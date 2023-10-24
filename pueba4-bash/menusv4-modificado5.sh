#!/bin/bash

# Function to display directory content and navigation
function show_content {
  local dir=$1
  local option
  while true; do
    clear
    echo "Directorio actual: $dir"
    echo "Contenido:"
    ls $dir
    read -p "¿Qué quieres hacer? (C = Entrar en carpeta, L = Leer archivo, R = Retroceder, S = Salir): " option
    case $option in
      [Cc]) read -p "Escribe el nombre de la carpeta: " folder
            if [ -d "$dir/$folder" ]; then
              dir="$dir/$folder"
            else
              echo "La carpeta $folder no existe."
            fi;;
      [Ll]) read -p "Escribe el nombre del archivo: " file
            if [ -f "$dir/$file" ]; then
              cat "$dir/$file"
              read -p "Presiona enter para continuar."
            else
              echo "El archivo $file no existe."
            fi;;
      [Rr]) if [ "$dir" != "/" ]; then
              dir=$(dirname "$dir")
            else
              echo "Ya estás en la raíz del sistema."
            fi;;
      [Ss]) break;;
      *) echo "Opción inválida.";;
    esac
  done
}

function controlC(){
  echo -e "\n\n[!] Saliendo...\n"
  exit 1
}

trap controlC INT

function helpPanel(){
  echo -e "\n[!] Por favor, introduzca una cantidad de dinero y una técnica de apuestas válida. Las técnicas disponibles son martingala, d'Alembert y Paroli.\n"
}

while true; do
  echo "Menú:"
  echo "1. martingala"
  echo "2. d'Alembert"
  echo "3. Paroli"
  echo "4. Navegar Directorio"
  echo "5. Salir"
  read -p "Seleccione una opción (1-5): " menu_choice

  if [ $menu_choice -eq 5 ]; then
    echo -e "\n\n[!] Saliendo...\n"
    exit 0
  elif [ $menu_choice -eq 4 ]; then
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
  elif [ $menu_choice -ge 1 ] && [ $menu_choice -le 3 ]; then
    read -p "Introduzca la cantidad de dinero: " money

    if [ $money ]; then
      case $menu_choice in
        1) technique="martingala";;
        2) technique="d'Alembert";;
        3) technique="Paroli";;
      esac
      echo "Voy a jugar con $money dinero usando la técnica $technique"
    else
      helpPanel
    fi
  else
    helpPanel
  fi
done
