#!/bin/bash

# Sacar el promedio de cada alumno sus 3notas dividimos entre 3
# Comprueba el primer argumento pasado al script.
case $1 in

  # Si el primer argumento es -p o -P, ejecuta este bloque.
  -p | -P)

    # Utiliza el comando 'grep' para buscar el segundo argumento en el archivo notas.csv,
    # ignorando las diferencias entre mayúsculas y minúsculas (-i).
    grep -i "$2" notas.csv |

    # Utiliza el comando 'awk' para procesar las líneas resultantes con el delimitador ','.
    # Luego, imprime el mensaje sobre el promedio para la persona correspondiente.
    # El promedio se calcula como la suma de las columnas 2, 3 y 4 dividido por 3.
    awk -F ',' '{print "El promedio es para", $1 , "es", ($2 + $3 + $4) / 3 }'
    ;;

  # Si el primer argumento no es -p o -P, muestra un mensaje de error.
  *)
    echo "Parámetro no válido"
    ;;

esac

# Para ejecutar por consola:
# ./bash-cambiar-palabra-title-input.sh -p pepito


# Esta versión del script elimina la necesidad de usar cat para leer el archivo y utiliza grep y awk directamente en el archivo "notas.csv", lo cual es una práctica más eficiente. También, asegúrate de usar comillas alrededor de $2 para manejar correctamente nombres con espacios u otros caracteres especiales.
