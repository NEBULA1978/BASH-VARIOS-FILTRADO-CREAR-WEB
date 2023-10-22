#!/bin/bash

# Muestra las líneas del archivo con números
echo "Contenido actual del archivo 'texto-introducir.txt':"
nl texto-introducir.txt

# Solicita al usuario que ingrese el número de la línea que desea editar
echo "Ingrese el número de la línea que desea editar: "
read linea_a_editar

# Solicita al usuario que ingrese la nueva etiqueta y contenido
echo "Ingrese la nueva etiqueta (por ejemplo, '<title>Nueva etiqueta</title>'): "
read nueva_etiqueta

# Crea un archivo temporal para almacenar el contenido actualizado
tempfile=$(mktemp)
awk -v linea=$linea_a_editar -v nueva_etiqueta="$nueva_etiqueta" 'NR==linea {$0=nueva_etiqueta} {print}' texto-introducir.txt > "$tempfile"

# Reemplaza el archivo original con el archivo temporal
mv "$tempfile" texto-introducir.txt

# Muestra el contenido actualizado del archivo
echo "Contenido actualizado del archivo 'texto-introducir.txt':"
cat texto-introducir.txt

echo "La línea se ha reemplazado con éxito en el archivo."
