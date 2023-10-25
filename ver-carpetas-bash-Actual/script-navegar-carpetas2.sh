#!/bin/bash

# Puedes escribir un script en bash que navegue por las carpetas de home automáticamente siguiendo los siguientes pasos:

#     Crea una función que tome como entrada la carpeta actual y muestre su contenido.
#     Dentro de la función, utiliza el comando ls para mostrar los archivos y carpetas contenidos en la carpeta actual.
#     Dentro de la función, utiliza el comando shuf para elegir un número aleatorio que represente el archivo o carpeta a abrir.
#     Utiliza el comando sed para seleccionar el archivo o carpeta correspondiente al número aleatorio elegido.
#     Si el archivo o carpeta elegido es una carpeta, utiliza el comando cd para entrar en ella y llama de nuevo a la función con la nueva carpeta como entrada.
#     Si el archivo elegido es un archivo, utiliza el comando cat para mostrar su contenido.
#     Repite los pasos desde el punto 3 hasta que se alcance un archivo o se decida salir de la función.

# Aquí tienes un ejemplo de código que implementa los pasos anteriores:




function show_content {
  local dir=$1
  local option
  local i=1
  while true; do
    clear
    echo "Directorio actual: $dir"
    echo "Contenido:"
    for item in $(ls "$dir"); do
      echo "$i. $item"
      ((i++))
    done
    read -p "¿Qué quieres hacer? (1 = Entrar en carpeta aleatoria, 2 = Leer archivo aleatorio, 3 = Retroceder, 4 = Salir) [Introduce el número correspondiente]: " option
    case $option in
      1) folder_number=$(shuf -i 1-$i -n 1)
            folder=$(ls "$dir" | sed -n "${folder_number}p")
            if [ -d "$dir/$folder" ]; then
              dir="$dir/$folder"
              i=1
            else
              echo "La carpeta $folder no existe."
            fi;;
      2) file_number=$(shuf -i 1-$i -n 1)
            file=$(ls "$dir" | sed -n "${file_number}p")
            if [ -f "$dir/$file" ]; then
              cat "$dir/$file"
              read -p "Presiona enter para continuar."
            else
              echo "El archivo $file no existe."
            fi;;
      3) if [ "$dir" != "/" ]; then
              dir=$(dirname "$dir")
              i=1
            else
              echo "Ya estás en la raíz del sistema."
            fi;;
      4) break;;
      *) echo "Opción inválida.";;
    esac
  done
}

read -p "¿Quieres entrar en una carpeta de home o del sistema? (H/S) " choice
choice=$(echo $choice | tr '[:lower:]' '[:upper:]')

if [ "$choice" == "H" ]; then
  dir=~
elif [ "$choice" == "S" ]; then
  dir="/"
else
  echo "Opción inválida."
  exit 1
fi

count=1
while [ $count -le 10 ]; do
  show_content "$dir"
  ((count++))
  echo "Finalizado después de $count ciclos."
done
