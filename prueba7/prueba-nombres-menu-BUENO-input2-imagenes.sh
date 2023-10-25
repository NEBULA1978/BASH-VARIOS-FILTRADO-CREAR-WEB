#!/bin/bash

# Prompt the user for the filename containing the list of names
echo "Enter the filename for the list of image names:"
read filename

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File '$filename' does not exist."
    exit 1
fi

# Leemos el archivo de texto y guardamos cada uno de los nombres en una lista
nombres=()
while IFS= read -r line; do
    nombres+=("$line")
done < "$filename"

# Recorremos la lista de nombres and ask for the Python command with input for each one
for i in "${!nombres[@]}"; do
    echo "Enter the Python command with input for '${nombres[i]}' (press Enter if it's the same):"
    read -r python_command
    if [ -z "$python_command" ]; then
        python_command="python3 ${nombres[i]}"
    fi

    echo "Enter the second echo command for '${nombres[i]}' (press Enter to use the default 'echo'):"
    read -r custom_echo2
    if [ -z "$custom_echo2" ]; then
        custom_echo2="echo"
    fi

    echo "$i)"
    echo "$python_command"
    echo "$custom_echo2 \"$((i + 1)). ${nombres[i]}.png\"" >> nombres3.txt
    echo "read foo"
    echo ";;"
done

# En esta versión modificada, se cambió el mensaje para que el usuario ingrese el nombre del archivo que contiene la lista de nombres de imágenes. Luego, el script genera nombres de imágenes numeradas con la extensión ".png" al agregar ".png" al final de cada nombre en el archivo "nombres3.txt". Puedes personalizar los comandos de Python y el segundo comando "echo" según tus necesidades, y los nombres de las imágenes se generarán automáticamente en el formato "número.nombre.png".