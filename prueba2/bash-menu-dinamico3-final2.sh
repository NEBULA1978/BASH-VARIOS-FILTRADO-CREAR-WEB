#!/bin/bash

while true; do
    echo "Menú:"
    echo "1. Mostrar contenido del archivo de búsqueda."
    echo "2. Copiar una línea del archivo de búsqueda a otro archivo."
    echo "3. Eliminar una palabra del archivo de introducción."
    echo "4. Modificar el título en el archivo de introducción."
    echo "5. Eliminar una línea del archivo de introducción."
    echo "6. Salir"
    read -p "Seleccione una opción (1/2/3/4/5/6): " choice

    case $choice in
        1)
            read -p "Introduzca el nombre del archivo de búsqueda: " buscar_file
            cat -n "$buscar_file"
            ;;
        2)
            read -p "Introduzca el nombre del archivo de búsqueda: " buscar_file
            read -p "Introduzca el nombre del archivo de destino: " destino_file
            read -p "Introduzca el número de línea a copiar: " line_number
            sed -e "$((line_number + 1))i\\" -e "$(sed -n "${line_number}{p;q}" "$buscar_file")" "$destino_file" > "$destino_file-temp.txt" && mv "$destino_file-temp.txt" "$destino_file"
            echo "Línea copiada exitosamente."
            ;;
        3)
            read -p "Introduzca el nombre del archivo de introducción: " introducir_file
            read -p "Introduzca la palabra a eliminar: " word_to_remove
            sed -i "7,8s/${word_to_remove}//" "$introducir_file"
            echo "Palabra '${word_to_remove}' eliminada de las líneas 7 y 8."
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
