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
    echo "8. Salir"
    read -p "Seleccione una opción (1/2/3/4/5/6/7/8): " choice

    case $choice in
    1)
        echo "Contenido de texto-buscar.txt con números de línea:"
        nl texto-buscar.txt
        ;;
    2)
        read -p "Introduzca el número de línea a copiar: " line_number
        if [ -f texto-buscar.txt ]; then
            line=$(sed -n "${line_number}p" texto-buscar.txt)
            if [ -n "$line" ]; then
                echo "$line" >> texto-introducir.txt
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
