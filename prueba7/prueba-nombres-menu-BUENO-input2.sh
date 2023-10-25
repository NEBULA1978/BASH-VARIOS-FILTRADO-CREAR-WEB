#!/bin/bash

# Prompt the user for the filename containing the list of names
echo "Enter the filename for the list of names:"
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
echo "$custom_echo2 \"$((i + 1)). ${nombres[i]}\"" >> nombres3.txt
echo "read foo"
echo ";;"
done

# Permite al usuario personalizar comandos de Python y configurar un segundo comando, que en este caso es un comando "echo", para cada nombre en una lista. Además, se da la opción al usuario de presionar Enter para utilizar los valores predeterminados en caso de que no deseen personalizar estos comandos. El script recorre la lista de nombres, solicita al usuario los comandos personalizados y las configuraciones para el segundo comando "echo" y los almacena en un archivo llamado "nombres3.txt".

# En resumen, este script cumple con la funcionalidad que describiste anteriormente y proporciona opciones para personalizar los comandos de Python y el segundo comando "echo" para cada nombre en la lista.