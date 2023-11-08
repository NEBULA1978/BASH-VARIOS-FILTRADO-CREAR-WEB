#!/bin/bash

while true; do
    clear
    echo "Menú:"
    echo "1. Mostrar contenido de un archivo con números de línea."
    echo "2. Copiar un rango de líneas de un archivo a otro."
    echo "3. Buscar una palabra en un archivo."
    echo "4. Modificar el título en texto-introducir.txt."
    echo "5. Eliminar una línea de texto-introducir.txt."
    echo "6. Ver archivos en la carpeta actual."
    echo "7. Buscar palabra en archivos de la carpeta actual."
    echo "9. Añadir comentarios a un archivo HTML/CSS/JS."
    echo "10. Sustituir palabra en archivo texto-sustituir-palabra.txt."
    echo "8. Salir"
    read -p "Seleccione una opción (1/2/3/4/5/6/7/8/9/10): " choice

    case $choice in
    1)
        echo "Ver lineas del archivo elegido en la carpeta actual:"
        # ls -R
        # read -p "Introduzca el nnombre del archivo: " texto-buscar.txt
        # echo "Contenido de texto-buscar.txt con números de línea:"
        # nl texto-buscar.txt
        # cat -n "$(texto-buscar.txt)"
        # read -n 1 -s -r -p "Presione cualquier tecla para continuar..."
        # ;;
        echo "Archivos en la carpeta actual:"
        ls
        read -p "Introduzca el nombre del archivo: " file_to_display

        if [ -f "$file_to_display" ]; then
            echo "Contenido de $file_to_display con números de línea:"
            nl "$file_to_display"
            # cat -n "$(file_to_display)"
        else
            echo "El archivo $file_to_display no existe."
        fi
        ;;
    2)
        read -p "Introduzca el nombre del archivo de búsqueda: " buscar_file
        read -p "Introduzca el nombre del archivo de destino: " destino_file
        read -p "Introduzca el número de la primera línea del rango a copiar: " start_line
        read -p "Introduzca el número de la última línea del rango a copiar: " end_line
        read -p "Introduzca el número de línea en el archivo de destino donde desea introducir la copia: " destination_line

        # Crear un respaldo del archivo de destino
        cp "$destino_file" "$destino_file.bak"

        # Copiar el rango de líneas al archivo temporal
        sed -n "${start_line},${end_line}p" "$buscar_file" >temp_copy.txt

        # Insertar el contenido copiado en el archivo de destino
        head -n $((destination_line - 1)) "$destino_file" >temp_head.txt
        tail -n +$destination_line "$destino_file" >temp_tail.txt
        cat temp_head.txt temp_copy.txt temp_tail.txt >"$destino_file"

        rm temp_copy.txt temp_head.txt temp_tail.txt

        echo "Rango de líneas copiado exitosamente en la línea $destination_line. Se ha creado un respaldo en $destino_file.bak."
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
        read -p "Introduzca el tipo de archivo (html/css/js): " file_type
        read -p "Introduzca el nombre del archivo al que desea añadir comentarios: " file_to_comment
        read -p "Introduzca el número de la primera línea para agregar el comentario: " start_line
        read -p "Introduzca el número de la línea para finalizar el comentario: " end_line

        if [ -f "$file_to_comment" ]; then
            case "$file_type" in
            "html")
                if [ "$end_line" -lt "$start_line" ]; then
                    echo "El número de la última línea debe ser mayor que el número de la primera línea."
                else
                    sed -i "${start_line}s|^|<!-- |" "$file_to_comment"
                    sed -i "${end_line}s|$| -->|" "$file_to_comment"
                    echo "Se han agregado comentarios en el archivo $file_to_comment."
                fi
                ;;
            "css")
                if [ "$end_line" -lt "$start_line" ]; then
                    echo "El número de la última línea debe ser mayor que el número de la primera línea."
                else
                    sed -i "${start_line}s|^|/* |" "$file_to_comment"
                    sed -i "${end_line}s|$| */|" "$file_to_comment"
                    echo "Se han agregado comentarios en el archivo $file_to_comment."
                fi
                ;;
            "js")
                if [ "$end_line" -lt "$start_line" ]; then
                    echo "El número de la última línea debe ser mayor que el número de la primera línea."
                else
                    sed -i "${start_line}s|^|// |" "$file_to_comment"
                    sed -i "${end_line}s|$| |" "$file_to_comment"
                    echo "Se han agregado comentarios en el archivo $file_to_comment."
                fi
                ;;
            *)
                echo "Tipo de archivo no compatible. Use 'html', 'css' o 'js'."
                ;;
            esac
        else
            echo "El archivo $file_to_comment no existe."
        fi
        ;;

    10)
        current_word=$(awk 'NR==2{match($0, /<.*>(.*)<.*/, arr); print arr[1]}' texto-sustituir-palabra.txt)

        read -p "Introduzca una nueva palabra para reemplazar '$current_word': " new_word

        if [ -z "$new_word" ]; then
            new_word=$current_word
        else
            sed -i "2s/$current_word/$new_word/" texto-sustituir-palabra.txt
            echo "Palabra reemplazada con éxito en la línea 2."
        fi
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
