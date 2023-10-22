#!/bin/bash

while true; do
    echo "Menú:"
    echo "1. Copiar la línea 6 de texto-buscar.txt a la línea 7 de texto-introducir.txt."
    echo "2. Eliminar la palabra 'Reddit' de las líneas 7 y 8 de texto-introducir.txt."
    echo "3. Modificar el título en texto-introducir.txt."
    echo "4. Salir"
    read -p "Seleccione una opción (1/2/3/4): " choice

    case $choice in
        1)
            sed -e '7i\' -e "$(sed -n '6{p;q}' texto-buscar.txt)" texto-introducir.txt > texto-introducir-temp.txt && mv texto-introducir-temp.txt texto-introducir.txt
            echo "Línea copiada exitosamente."
            ;;
        2)
            sed -i '7,8s/Reddit//' texto-introducir.txt
            echo "Palabra 'Reddit' eliminada de las líneas 7 y 8."
            ;;
        3)
            sed -i 's/<title>Document<\/title>/<title>Practicando bash web<\/title>/' texto-introducir.txt
            echo "Título modificado en texto-introducir.txt."
            ;;
        4)
            echo "Saliendo del menú."
            exit 0
            ;;
        *)
            echo "Opción no válida. Por favor, seleccione una opción válida (1/2/3/4)."
            ;;
    esac
done
