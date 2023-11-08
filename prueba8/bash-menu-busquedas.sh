#!/bin/bash

while true; do
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar varios directorios"
    echo "2. Crear varios ficheros"
    echo "3. Mostrar archivos con una extensión específica"
    echo "4. Mostrar archivos que empiecen con 'f' y terminen con '.txt'"
    echo "5. Mostrar archivos que empiecen con 'f'"
    echo "6. Mostrar archivos que empiecen con 'f' seguido de dos caracteres y terminen con '.txt'"
    echo "7. Mostrar archivos que empiecen con tres caracteres y terminen con '.txt'"
    echo "8. Mostrar archivos que empiecen con tres caracteres y terminen con '.tx?'"
    echo "9. Mostrar archivos que terminen con un carácter después de 'fichero'"
    echo "10. Mostrar archivos que empiecen con 'fichero' seguido por cualquier caracter"
    echo "11. Mostrar archivos de la carpeta actual y guardar en listado.txt con '>'"
    echo "12. Mostrar el contenido de listado.txt con 'cat'"
    echo "13. Mostrar archivos de la carpeta actual y añadir al archivo listado.txt con '>>'"
    echo "14. Ordenar números del archivo numeros.txt con sort"
    echo "15. Salir"
    echo ""
    
    read -rp "Seleccione una opción: " opcion

    case $opcion in
        1)
            read -rp "Introduzca los directorios separados por un espacio (Ejemplo: directorio1 directorio2): " directorios
            ls "$directorios"
            read -rp "Presione Enter para continuar..."
            ;;
        2)
            read -rp "Se crearán varios ficheros... Introduzca los nombres separados por un espacio: " nombres_ficheros
            touch "$nombres_ficheros"
            read -rp "Presione Enter para continuar..."
            ;;
        3)
            read -rp "Ingrese la extensión de archivo a mostrar: " extension
            ls "*.$extension"
            read -rp "Presione Enter para continuar..."
            ;;
        4)
            ls f*.txt
            read -rp "Presione Enter para continuar..."
            ;;
        5)
            ls f*
            read -rp "Presione Enter para continuar..."
            ;;
        6)
            ls f??.txt
            read -rp "Presione Enter para continuar..."
            ;;
        7)
            ls f???txt
            read -rp "Presione Enter para continuar..."
            ;;
        8)
            ls f??tx?
            read -rp "Presione Enter para continuar..."
            ;;
        9)
            ls fichero?
            read -rp "Presione Enter para continuar..."
            ;;
        10)
            ls fichero*
            read -rp "Presione Enter para continuar..."
            ;;
        11)
            ls > listado.txt
            read -rp "Presione Enter para continuar..."
            ;;
        12)
            cat listado.txt
            read -rp "Presione Enter para continuar..."
            ;;
        13)
            ls >> listado.txt
            read -rp "Presione Enter para continuar..."
            ;;
        14)
            echo "Sin ordenar:"
            cat numeros.txt
            echo "======= Ordenados ========"
            sort < numeros.txt
            read -rp "Presione Enter para continuar..."
            ;;
        15)
            exit 0
            ;;
        *)
            echo "Opción inválida..."
            sleep 1
            ;;
    esac
done
