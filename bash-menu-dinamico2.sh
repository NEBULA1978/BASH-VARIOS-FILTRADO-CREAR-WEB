#!/bin/bash

while true; do
    echo "Menú:"
    echo "1. Mostrar contenido de texto-buscar.txt con números de línea."
    echo "2. Copiar una línea de texto-buscar.txt a texto-introducir.txt."
    echo "3. Eliminar una palabra de texto-introducir.txt."
    echo "4. Modificar el título en texto-introducir.txt."
    echo "5. Salir"
    read -p "Seleccione una opción (1/2/3/4/5): " choice

    case $choice in
        1)
            cat -n texto-buscar.txt
            ;;
        2)
            read -p "Introduzca el número de línea a copiar: " line_number
            sed -e "$((line_number + 1))i\\" -e "$(sed -n "${line_number}{p;q}" texto-buscar.txt)" texto-introducir.txt > texto-introducir-temp.txt && mv texto-introducir-temp.txt texto-introducir.txt
            echo "Línea copiada exitosamente."
            ;;
        3)
            read -p "Introduzca la palabra a eliminar: " word_to_remove
            sed -i "7,8s/${word_to_remove}//" texto-introducir.txt
            echo "Palabra '${word_to_remove}' eliminada de las líneas 7 y 8."
            ;;
        4)
            read -p "Introduzca el nuevo título: " new_title
            sed -i "s/<title>Document<\/title>/<title>${new_title}<\/title>/" texto-introducir.txt
            echo "Título modificado en texto-introducir.txt."
            ;;
        5)
            echo "Saliendo del menú."
            exit 0
            ;;
        *)
            echo "Opción no válida. Por favor, seleccione una opción válida (1/2/3/4/5)."
            ;;
    esac
done
