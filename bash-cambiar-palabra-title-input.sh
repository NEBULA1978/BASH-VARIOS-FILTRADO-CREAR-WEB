#!/bin/bash

# Solicita al usuario que ingrese el nombre del archivo
echo "Ingrese el nombre del archivo que desea editar (por ejemplo, 'texto-introducir.txt'): "
read archivo_a_editar

# Verifica si el archivo existe
if [ ! -f "$archivo_a_editar" ]; then
    echo "El archivo no existe."
    exit 1
fi

# Muestra las líneas del archivo con números
echo "Contenido actual del archivo '$archivo_a_editar':"
nl "$archivo_a_editar"

# Solicita al usuario que ingrese el número de la línea que desea editar
echo "Ingrese el número de la línea que desea editar: "
read linea_a_editar

# Solicita al usuario que ingrese la nueva etiqueta y contenido
echo "Ingrese la nueva etiqueta (por ejemplo, '<title>Nueva etiqueta</title>'): "
read nueva_etiqueta

# Crea un archivo temporal para almacenar el contenido actualizado
tempfile=$(mktemp)
awk -v linea=$linea_a_editar -v nueva_etiqueta="$nueva_etiqueta" 'NR==linea {$0=nueva_etiqueta} {print}' "$archivo_a_editar" > "$tempfile"

# Reemplaza el archivo original con el archivo temporal
mv "$tempfile" "$archivo_a_editar"

# Muestra el contenido actualizado del archivo
echo "Contenido actualizado del archivo '$archivo_a_editar':"
cat "$archivo_a_editar"

echo "La línea se ha reemplazado con éxito en el archivo."
