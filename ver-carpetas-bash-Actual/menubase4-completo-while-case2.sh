#!/bin/bash

function show_content {
  local dir=$1
  local option
  local i=1
  while true; do
    clear
    echo "Directorio actual: $dir"
    echo "Contenido:"
    for item in $(ls $dir); do
      echo "$i. $item"
      ((i++))
    done
    read -p "¿Qué quieres hacer? (1 = Entrar en carpeta, 2 = Leer archivo, 3 = Retroceder, 4 = Salir) [Introduce el número correspondiente]: " option
    case $option in
      1) read -p "Escribe el número de la carpeta: " folder_number
            folder=$(ls $dir | sed -n "${folder_number}p")
            if [ -d "$dir/$folder" ]; then
              dir="$dir/$folder"
              i=1
            else
              echo "La carpeta $folder no existe."
            fi;;
      2) read -p "Escribe el número del archivo: " file_number
            file=$(ls $dir | sed -n "${file_number}p")
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

show_content $dir
