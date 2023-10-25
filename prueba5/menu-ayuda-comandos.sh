#!/bin/bash
#todoreal.com
while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar comandos ayuda ls --help"
    echo "2. Mostrar comandos ayuda man ls"
    echo "3. Ver el manual de ls con man -w ls"
    echo "5. Ver el nº de ficheros y carpetas en un directorio con man -f ls"
    echo "6. Ver el nº de ficheros y carpetas en un directorio con whatis ls"
    echo "7. Ver el nº de convertidores en un directorio con whatis convert"
    echo "8. Ver el nº de convertidores en un directorio con man -f convert"
    echo "9. Ver mas nºs de convertidores en un directorio con man -k video converter"
    echo "10. Ver el nº de editores de texto con man -k text | grep converter"
    echo "11. Ver el nº de editores de texto con man -f nano"
    echo "12. Ver el nº de editores de texto con apropos text | grep editor"
    echo "13. Ver informacion mediante nodos con info ls"
    echo "14. Ver informacion mediante xman"
    echo "15. Ver informacion mediante tree"
    echo "16. Quiero modificar el color de ls con ls --help | grep color"

    echo "4. Salir"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Mostrar comandos ayuda ls --help"
        ls --help | less
        read foo
        ;;
    2)
        echo "Mostrar comandos ayuda man ls"
        man ls | less
        read foo
        ;;
    3)
        echo "Ver el manual de ls con man -w ls"
        man -w ls
        read foo
        ;;
    5)
        echo "Ver el nº de ficheros y carpetas en un directorio con man -f ls"
        man -f ls
        read foo
        ;;
    6)
        echo "Ver el nº de ficheros y carpetas en un directorio con whatis ls"
        whatis ls
        read foo
        ;;
    7)
        echo "Ver el nº de convertidores en un directorio con whatis convert"
        whatis convert
        read foo
        ;;
    8)
        echo "Ver el nº de convertidores en un directorio con man -f convert"
        man -f convert
        read foo
        ;;
    9)
        echo "Ver mas nºs de convertidores en un directorio con man -k video converter"
        man -k video converter
        read foo
        ;;
    10)
        echo "Ver el nº de editores de texto con man -k text | grep converter"
        man -k text | grep converter
        read foo
        ;;
    11)
        echo "Ver el nº de editores de texto con man -f nano"
        con man -f nano
        read foo
        ;;
    12)
        echo "Ver el nº de editores de texto con apropos text | grep editor"
        apropos text | grep editor
        read foo
        ;;
    13)
        echo "Ver informacion mediante nodos con info ls"
        echo "con n adelante o con p hacia atras"
        echo "============="
        info ls
        read foo
        ;;
    14)
        echo "Ver informacion mediante xman"
        echo "Sale menu pequeñito y navegamos a documentacion"
        echo "============="
        xman
        read foo
        ;;
    15)
        echo "Ver informacion mediante tree"
        echo "Sale directorios tipo arbol"
        echo "============="
        tree
        read foo
        ;;
    16)
        echo "Quiero modificar el color de ls con ls --help | grep color"
        echo "Para modificar color a ls"
        echo "============="
        ls --help | grep color
        read foo
        ;;
    4) exit 0 ;;
    #Alerta
    *)
        echo "Opcion invalida..."
        sleep 1
        ;;
    esac
done
