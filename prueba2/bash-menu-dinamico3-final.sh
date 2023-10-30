#!/bin/bash

while true; do
    echo "Menú:"
    echo "1. Mostrar contenido de texto-buscar.txt con números de línea."
    echo "2. Copiar una línea de texto-buscar.txt a texto-introducir.txt."
    echo "3. Introduzca el nombre del archivo en el que buscar la palabra e Introduzca la palabra a buscar."
    echo "4. Modificar el título en texto-introducir.txt."
    echo "5. Eliminar una línea de texto-introducir.txt."
    echo "7. Ver archivos carpeta actual."
    echo "8. Buscar palabra en archivos de la carpeta actual."

    echo "6. Salir"
    read -p "Seleccione una opción (1/2/3/4/5/6): " choice

    case $choice in
    1)
        cat -n texto-buscar.txt
        ;;
    2)
        read -p "Introduzca el número de línea a copiar: " line_number
        sed -e "$((line_number + 1))i\\" -e "$(sed -n "${line_number}{p;q}" texto-buscar.txt)" texto-introducir.txt >texto-introducir-temp.txt && mv texto-introducir-temp.txt texto-introducir.txt
        echo "Línea copiada exitosamente."
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
    7)
        echo "Ver archivos carpeta actual"
        ls -lah
        ;;
    8)
        read -p "Introduzca la palabra a buscar en archivos de la carpeta actual: " word_in_files
        read -p "Introduzca el nombre del archivo para guardar los resultados: " output_file
        grep -rnw . -e "$word_in_files" | awk -F: '{print "Archivo:", $1, "Línea:", $2, "Texto:", $3}' >"$output_file"
        echo "Resultados de la búsqueda por palabra '$word_in_files' en la carpeta actual se han guardado en '$output_file'."

        read -p "¿Desea insertar este resultado en un archivo específico? (s/n): " option_insert

        if [ "$option_insert" = "s" ]; then
            read -p "Introduzca el nombre del archivo donde desea insertar los resultados: " insert_file
            read -p "Introduzca el número de línea donde desea insertar los resultados: " insert_line

            sed -i "${insert_line}r $output_file" "$insert_file"
            echo "Resultados insertados exitosamente en la línea $insert_line de '$insert_file'."
        fi
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
