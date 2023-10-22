#!/bin/bash

while true; do
    echo "Menú:"
    echo "1. Mostrar contenido del archivo de búsqueda."
    echo "2. Copiar un rango de líneas del archivo de búsqueda al archivo de destino."
    echo "3. Eliminar una palabra del archivo de introducción."
    echo "4. Modificar el título en el archivo de introducción."
    echo "5. Eliminar una línea del archivo de introducción."
    echo "6. Salir"
    read -p "Seleccione una opción (1/2/3/4/5/6): " choice

    case $choice in
        1)
            files=($(ls))
            for i in "${!files[@]}"; do
                echo "$i. ${files[$i]}"
            done
            read -p "Introduzca el número del archivo de búsqueda: " buscar_option
            buscar_file="${files[$buscar_option]}"
            cat -n "$buscar_file"
            ;;
        2)
            files=($(ls))
            for i in "${!files[@]}"; do
                echo "$i. ${files[$i]}"
            done
            read -p "Introduzca el número del archivo de búsqueda: " buscar_option
            buscar_file="${files[$buscar_option]}"
            read -p "Introduzca el número del archivo de destino: " destino_option
            destino_file="${files[$destino_option]}"
            read -p "Introduzca el número de la primera línea del rango a copiar: " start_line
            read -p "Introduzca el número de la última línea del rango a copiar: " end_line
            read -p "Introduzca el número de línea en el archivo de destino donde desea introducir la copia: " destination_line

            # Copiar el rango de líneas al archivo temporal
            sed -n "${start_line},${end_line}p" "$buscar_file" > temp_copy.txt

            # Insertar el contenido copiado en el archivo de destino
            head -n $((destination_line - 1)) "$destino_file" > temp_head.txt
            tail -n +$destination_line "$destino_file" > temp_tail.txt
            cat temp_head.txt temp_copy.txt temp_tail.txt > "$destino_file"

            rm temp_copy.txt temp_head.txt temp_tail.txt
            echo "Rango de líneas copiado exitosamente en la línea $destination_line."
            ;;
        3)
            files=($(ls))
            for i in "${!files[@]}"; do
                echo "$i. ${files[$i]}"
            done
            read -p "Introduzca el número del archivo de introducción: " introducir_option
            introducir_file="${files[$introducir_option]}"
            read -p "Introduzca la palabra a eliminar: " word_to_remove
            sed -i "7,8s/${word_to_remove}//" "$introducir_file"
            echo "Palabra '${word_to_remove}' eliminada de las líneas 7 y 8."
            ;;
        4)
            files=($(ls))
            for i in "${!files[@]}"; do
                echo "$i. ${files[$i]}"
            done
            read -p "Introduzca el número del archivo de introducción: " introducir_option
            introducir_file="${files[$introducir_option]}"
            read -p "Introduzca el nuevo título: " new_title
            sed -i "s/<title>.*<\/title>/<title>${new_title}<\/title>/" "$introducir_file"
            echo "Título modificado en $introducir_file."
            ;;
        5)
            files=($(ls))
            for i in "${!files[@]}"; do
                echo "$i. ${files[$i]}"
            done
            read -p "Introduzca el número del archivo de introducción: " introducir_option
            introducir_file="${files[$introducir_option]}"
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
