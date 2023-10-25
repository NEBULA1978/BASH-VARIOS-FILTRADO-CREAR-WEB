#!/bin/bash

# Puedes escribir un script en bash que navegue por las carpetas de home automáticamente siguiendo los siguientes pasos:

#     Crea una función que tome como entrada la carpeta actual y muestre su contenido.
#     Dentro de la función, utiliza el comando ls para mostrar los archivos y carpetas contenidos en la carpeta actual.
#     Dentro de la función, utiliza el comando shuf para elegir un número aleatorio que represente el archivo o carpeta a abrir.
#     Utiliza el comando sed para seleccionar el archivo o carpeta correspondiente al número aleatorio elegido.
#     Si el archivo o carpeta elegido es una carpeta, utiliza el comando cd para entrar en ella y llama de nuevo a la función con la nueva carpeta como entrada.
#     Si el archivo elegido es un archivo, utiliza el comando cat para mostrar su contenido.
#     Repite los pasos desde el punto 3 hasta que se alcance un archivo o se decida salir de la función.


# function navigate {
#   local dir=$1
#   local file
#   local choice
#   local continue_navigation=true

#   while [ "$continue_navigation" = true ]; do
#     # Show the content of the current directory
#     ls "$dir"

#     # Choose a random file or directory
#     choice=$(ls "$dir" | shuf -n 1)

#     # Check if the chosen item is a directory
#     if [ -d "$dir/$choice" ]; then
#       # If it is a directory, enter it and call the function again
#       cd "$dir/$choice"
#       navigate "$dir/$choice"
#     else
#       # If it is a file, show its content
#       cat "$dir/$choice"
#     fi

#     # Ask the user if they want to continue navigating
#     read -p "Do you want to continue navigating? (y/n) " answer
#     case "$answer" in
#       y|Y ) continue_navigation=true;;
#       n|N ) continue_navigation=false;;
#       * ) echo "Invalid input. Please enter y or n.";;
#     esac
#   done
# }

# # Start navigating from the home directory
# navigate ~/

# Claro, aquí te muestro cómo podrías agregar un bucle while para permitir al usuario continuar navegando hasta que decida salir:

# bash

function navigate {
  local dir=$1
  local file
  local choice
  local continue_navigation=true

  while [ "$continue_navigation" = true ]; do
    # Show the content of the current directory
    ls "$dir"

    # Choose a random file or directory
    choice=$(ls "$dir" | shuf -n 1)

    # Check if the chosen item is a directory
    if [ -d "$dir/$choice" ]; then
      # If it is a directory, enter it and call the function again
      cd "$dir/$choice"
      navigate "$dir/$choice"
    else
      # If it is a file, show its content
      cat "$dir/$choice"
    fi

    # Ask the user if they want to continue navigating
    read -p "Do you want to continue navigating? (y/n) " answer
    case "$answer" in
      y|Y ) continue_navigation=true;;
      n|N ) continue_navigation=false;;
      * ) echo "Invalid input. Please enter y or n.";;
    esac
  done
}

# Start navigating from the home directory
navigate ~/

# Este código utiliza un bucle while que se ejecuta mientras la variable continue_navigation sea verdadera. Dentro del bucle, se muestra el contenido del directorio actual y se elige un archivo o directorio al azar. Si el archivo o directorio elegido es un directorio, el script entra en él y llama a la función navigate de nuevo con el nuevo directorio como argumento. Si el archivo o directorio elegido es un archivo, se muestra su contenido con el comando cat.

# Después de cada navegación, el script le pregunta al usuario si quiere continuar navegando o no. Si el usuario responde "y" o "Y", el bucle se ejecuta de nuevo y el proceso se repite. Si el usuario responde "n" o "N", la variable continue_navigation se establece en false, lo que hace que el bucle while termine y el script finalice. Si el usuario ingresa cualquier otra cosa, se le pedirá que ingrese "y" o "n" nuevamente.


# Aquí tienes un ejemplo de código que implementa los pasos anteriores:




# function navigate {
#   local dir=$1
#   local file
#   local choice

#   # Show the content of the current directory
#   ls "$dir"

#   # Choose a random file or directory
#   choice=$(ls "$dir" | shuf -n 1)

#   # Check if the chosen item is a directory
#   if [ -d "$dir/$choice" ]; then
#     # If it is a directory, enter it and call the function again
#     cd "$dir/$choice"
#     navigate "$dir/$choice"
#   else
#     # If it is a file, show its content
#     cat "$dir/$choice"
#   fi
# }

# # Start navigating from the home directory
# navigate ~/
