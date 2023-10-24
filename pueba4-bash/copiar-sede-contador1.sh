#!/bin/bash
clear 
ls -l
echo "Introduce el nombre del archivo:"
read -r archivo
echo

# Display the content of the selected file
cat "$archivo"

echo "Desde qué línea desea copiar?"
read -r inicio
echo "Hasta qué línea desea copiar?"
read -r fin

# Function to check if input is a valid integer
is_integer() {
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        return 0  # It's an integer
    else
        return 1  # It's not an integer
    fi
}

# Input validation for "inicio" and "fin"
if ! is_integer "$inicio" || ! is_integer "$fin"; then
    echo "Error: Debe introducir números enteros válidos para el inicio y el final."
    exit 1
fi

# Añadir un contador al nombre de archivo resultado
counter=0
while [ -e "resultado$counter.txt" ]
do
  counter=$((counter + 1))
done

# Guardar las líneas seleccionadas en un archivo resultado con el contador
sed -n "${inicio},${fin}p" "$archivo" >> "resultado$counter.txt"
echo
echo "Las líneas seleccionadas se han guardado en resultado$counter.txt"
