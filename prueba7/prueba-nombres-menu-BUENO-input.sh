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

    echo "$i)"
    echo "$python_command"
    echo "echo \"$((i + 1)). ${nombres[i]}\"" >> nombres3.txt
    echo "read foo"
    echo ";;"
done

# Este script Bash permite al usuario hacer lo siguiente:

# Solicita al usuario que ingrese el nombre de un archivo que contiene una lista de nombres.
# Verifica si el archivo especificado existe. Si no existe, muestra un mensaje de error y sale del script.
# Lee el archivo de texto y almacena cada uno de los nombres en una lista.
# Inicializa tres variables adicionales (variable1, variable2 y variable3) con un valor nulo.
# Luego, recorre la lista de nombres y, para cada nombre, realiza lo siguiente:
# Solicita al usuario que ingrese el comando de Python con entrada para ese nombre. Si no se ingresa nada, usa "python3 nombre" como valor predeterminado.
# Solicita al usuario que ingrese tres variables adicionales para ese nombre. El usuario tiene la opción de dejarlas en blanco si no son necesarias.
# Luego, muestra el número de orden del nombre y el comando de Python en pantalla y, si se ingresaron valores para las variables adicionales, las muestra también.
# Finalmente, agrega estas líneas al archivo "nombres3.txt", que contiene la secuencia de comandos generada.
# El ciclo se repite para cada nombre en la lista.
# Después de completar el proceso para todos los nombres, el script genera un archivo llamado "nombres3.txt" que contiene las secuencias de comandos y variables adicionales configuradas por el usuario para cada nombre.
# En resumen, este script permite al usuario personalizar comandos de Python y variables adicionales para una lista de nombres y luego guarda estas configuraciones en un archivo de salida.