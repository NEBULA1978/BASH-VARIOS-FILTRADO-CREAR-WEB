#!/bin/bash

while true; do
    echo "Menú:"
    echo "1. Mostrar contenido del archivo de búsqueda."
    echo "2. Copiar un rango de líneas del archivo de búsqueda al archivo de destino."
    echo "3. Introduzca el nombre del archivo en el que buscar la palabra e Introduzca la palabra a buscar."    echo "4. Modificar el título en el archivo de introducción."
    echo "5. Eliminar una línea del archivo de introducción."
    echo "6. Salir"
    read -p "Seleccione una opción (1/2/3/4/5/6): " choice

    case $choice in
    1)
        ls "$(pwd)"
        read -p "Introduzca el nombre del archivo de búsqueda: " buscar_file
        cat -n "$buscar_file"
        ;;
    2)
        read -p "Introduzca el nombre del archivo de búsqueda: " buscar_file
        read -p "Introduzca el nombre del archivo de destino: " destino_file
        read -p "Introduzca el número de la primera línea del rango a copiar: " start_line
        read -p "Introduzca el número de la última línea del rango a copiar: " end_line
        read -p "Introduzca el número de línea en el archivo de destino donde desea introducir la copia: " destination_line

        # Copiar el rango de líneas al archivo temporal
        sed -n "${start_line},${end_line}p" "$buscar_file" >temp_copy.txt

        # Insertar el contenido copiado en el archivo de destino
        head -n $((destination_line - 1)) "$destino_file" >temp_head.txt
        tail -n +$destination_line "$destino_file" >temp_tail.txt
        cat temp_head.txt temp_copy.txt temp_tail.txt >"$destino_file"

        rm temp_copy.txt temp_head.txt temp_tail.txt
        echo "Rango de líneas copiado exitosamente en la línea $destination_line."
        ;;
    3)
        read -p "Introduzca el nombre del archivo en el que buscar la palabra: " file_to_search
        read -p "Introduzca la palabra a buscar: " word_to_search

        if grep -q "$word_to_search" "$file_to_search"; then
            echo "La palabra '$word_to_search' fue encontrada en el archivo '$file_to_search'."
        else
            echo "La palabra '$word_to_search' no fue encontrada en el archivo '$file_to_search'."
        fi
        ;;

    4)
        read -p "Introduzca el nombre del archivo de introducción: " introducir_file
        read -p "Introduzca el nuevo título: " new_title
        sed -i "s/<title>.*<\/title>/<title>${new_title}<\/title>/" "$introducir_file"
        echo "Título modificado en $introducir_file."
        ;;
    5)
        read -p "Introduzca el nombre del archivo de introducción: " introducir_file
        read -p "Introduzca el número de línea a eliminar: " line_number
        sed -i "${line_number}d" "$introducir_file"
        echo "Línea eliminada exitosamente."
        ;;
    6)
        echo "Saliendo del menú."
        exit 0
        ;;
    *)
        echo "Opción no válida. Por favor, seleccione una opción válida (1/2/3/4/5/6)."
        ;;
    esac
done
