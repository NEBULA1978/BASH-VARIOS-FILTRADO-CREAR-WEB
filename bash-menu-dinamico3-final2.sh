#!/bin/bash

while true; do
    clear
    echo "Menú:"
    echo "1. Mostrar contenido de texto-buscar.txt con números de línea."
    echo "2. Copiar una línea de texto-buscar.txt a texto-introducir.txt."
    echo "3. Buscar una palabra en un archivo."
    echo "4. Modificar el título en texto-introducir.txt."
    echo "5. Eliminar una línea de texto-introducir.txt."
    echo "6. Ver archivos en la carpeta actual."
    echo "7. Buscar palabra en archivos de la carpeta actual."
    echo "9. Comentar lineas del archivo indicado"
    echo "10. Sustituir palabra de archivo texto-sustituir-palabra.txt que le diga"
    echo "8. Salir"
    read -p "Seleccione una opción (1/2/3/4/5/6/7/8): " choice

    case $choice in
    1)
        echo "Contenido de texto-buscar.txt con números de línea:"
        nl texto-buscar.txt | more
        read -n 1 -s -r -p "Presione cualquier tecla para continuar..."
        ;;
    2)
        read -p "Introduzca el número de línea a copiar: " line_number
        if [ -f texto-buscar.txt ]; then
            line=$(sed -n "${line_number}p" texto-buscar.txt)
            if [ -n "$line" ]; then
                echo "$line" >>texto-introducir.txt
                echo "Línea copiada exitosamente."
            else
                echo "Número de línea no válido."
            fi
        else
            echo "El archivo texto-buscar.txt no existe."
        fi
        ;;
    3)
        read -p "Introduzca el nombre del archivo en el que buscar la palabra: " file_to_search
        read -p "Introduzca la palabra a buscar: " word_to_search

        if [ -f "$file_to_search" ]; then
            if grep -q "$word_to_search" "$file_to_search"; then
                echo "La palabra '$word_to_search' fue encontrada en el archivo '$file_to_search'."
            else
                echo "La palabra '$word_to_search' no fue encontrada en el archivo '$file_to_search'."
            fi
        else
            echo "El archivo '$file_to_search' no existe."
        fi
        ;;
    4)
        read -p "Introduzca el nuevo título: " new_title
        sed -i "s/<title>.*<\/title>/<title>${new_title}<\/title>/" texto-introducir.txt
        echo "Título modificado en texto-introducir.txt."
        ;;
    5)
        read -p "Introduzca el número de línea a eliminar: " line_number
        sed -i "${line_number}d" texto-introducir.txt
        echo "Línea eliminada exitosamente."
        ;;
    6)
        echo "Archivos en la carpeta actual:"
        ls -lah
        ;;
    7)
        read -p "Introduzca la palabra a buscar en archivos de la carpeta actual: " word_in_files
        read -p "Introduzca el nombre del archivo para guardar los resultados: " output_file
        grep -rnw . -e "$word_in_files" | awk -F: '{print "Archivo:", $1, "Línea:", $2, "Texto:", $3}' >"$output_file"
        echo "Resultados de la búsqueda por palabra '$word_in_files' en la carpeta actual se han guardado en '$output_file'."

        ;;
9)
    read -p "Introduzca el nombre del archivo al que desea añadir comentarios: " file_to_comment
    read -p "Introduzca el número de la primera línea para agregar <!--: " start_line
    read -p "Introduzca el número de la línea para agregar -->: " end_line

    if [ -f "$file_to_comment" ]; then
        if [ "$end_line" -lt "$start_line" ]; then
            echo "El número de la última línea debe ser mayor que el número de la primera línea."
        else
            sed -i "${start_line}s|^|<!-- |" "$file_to_comment"
            sed -i "${end_line}s|$| -->|" "$file_to_comment"
            echo "Se han agregado los comentarios en el archivo $file_to_comment."
        fi
    else
        echo "El archivo $file_to_comment no existe."
    fi
    ;;


10)
    read -p "Introduzca la nueva palabra para reemplazar 'Telegram' en la línea 2: " new_word
    sed -i '2s/Telegram/'"$new_word"'/' texto-sustituir-palabra.txt
    echo "Palabra reemplazada con éxito en la línea 2."
    ;;

    8)
        echo "Saliendo del menú."
        exit 0
        ;;
    *)
        echo "Opción no válida. Por favor, seleccione una opción válida (1/2/3/4/5/6/7/8)."
        ;;
    esac

    read -p "Presione Enter para continuar..."
done
