#!/bin/bash

# Comprueba el primer argumento pasado al script.
case $1 in

  # Si el primer argumento es -p o -P, ejecuta este bloque.
  -p | -P)

    # Lee el archivo notas.csv y filtra las líneas que contienen el valor pasado como segundo argumento,
    # ignorando las diferencias entre mayúsculas y minúsculas (-i).
    cat notas.csv | grep -i $2 |

    # Utiliza el comando 'awk' para procesar las líneas de notas.csv con el delimitador ','.
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
# ❯ ./bash-cambiar-palabra-title-input.sh -p pepito
# El promedio es para Pepito es 4
