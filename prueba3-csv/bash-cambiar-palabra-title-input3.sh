#!/bin/bash

# Comprueba el primer argumento pasado al script.
case $1 in

  # Si el primer argumento es -p o -P, ejecuta este bloque.
  -p | -P)
    # Realiza una comprobación para asegurarse de que se proporciona un segundo argumento.
    if [ -z "$2" ]; then
      echo "Error: Debes proporcionar un nombre como segundo argumento."
      exit 1
    fi

    # Verifica si el archivo 'notas.csv' existe antes de continuar.
    if [ ! -f "notas.csv" ]; then
      echo "Error: El archivo 'notas.csv' no existe."
      exit 1
    fi

    # Lee el archivo notas.csv y filtra las líneas que contienen el valor pasado como segundo argumento,
    # ignorando las diferencias entre mayúsculas y minúsculas (-i).
    if ! grep -i "$2" notas.csv > /dev/null; then
      echo "Error: El nombre '$2' no se encuentra en 'notas.csv'."
      exit 1
    fi

    # Utiliza el comando 'awk' para procesar las líneas de notas.csv con el delimitador ','.
    # Luego, imprime el mensaje sobre el promedio para la persona correspondiente.
    # El promedio se calcula como la suma de las columnas 2, 3 y 4 dividido por 3.
    promedio=$(grep -i "$2" notas.csv | awk -F ',' '{print ($2 + $3 + $4) / 3 }')
    echo "El promedio es para $2 es $promedio"
    ;;

  # Si el primer argumento no es -p o -P, muestra un mensaje de error.
  *)
    echo "Error: Parámetro no válido. Debes usar -p o -P como primer argumento."
    exit 1
    ;;

esac

# Para ejecutar por consola
# ❯ ./bash-cambiar-palabra-title-input3.sh -p pepito

# El promedio es para pepito es 4
