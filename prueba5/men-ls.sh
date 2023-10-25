#!/bin/bash
#todoreal.com
while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar directorio en orden alfabetico"
    echo "2. Mostrar directorio con mas informacion"
    echo "3. Mostrar directorio con mas informacion modo humano"
    echo "5. Mostrar directorio en orden alfabetico en orden inverso con ls -r"
    echo "6. Mostrar directorio en orden por fecha modificacion con  ls -lt"
    echo "7. Mostrar directorio en orden invertido por fecha modificacion con  ls -ltr"
    echo "8. Mostrar directorio en funcion de la extension con ls -x"
    echo "9. Mostrar directorio invertido en funcion de la extension con ls -xr"
    echo "10. Mostrar que hay dentro de directorios de forma recursiva ls -R"
    echo "11. Mostrar lo que ocupa cada directorio con  ls -Sh"
    echo "12. Mostrar el tamaño solo 1ºcolumna con  ls -Sh | cut -d ' ' -f 1"
    echo "13. Mostrar el directorio bashrc con cat ~/.bashrc "
    echo "14. Entrar a archivo con nano  ~/.bashrc "
    echo "15. Listar ls con for in, forma basica "
    echo "16. Listar ls con for in,forma mejorada "
    echo "4. Salir"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Mostrando directorio en orden alfabetico"
        ls
        read foo
        ;;
    2)
        echo "Mostrar directorio con mas informacion"
        ls -l
        read foo
        ;;
    3)
        echo "Mostrar directorio con mas informacion modo humano"
        ls -lh
        read foo
        ;;
    5)
        echo "Mostrar directorio en orden alfabetico en orden inverso con -r"
        ls -r
        read foo
        ;;
    6)
        echo "Mostrar directorio en orden por fecha modificacion con  ls -lt"
        echo "Descendente por defecto"
        echo "========="
        ls -lt
        read foo
        ;;
    7)
        echo "Mostrar directorio en orden invertido por fecha modificacion con  ls -ltr"
        echo "Descendente por defecto"
        echo "========="
        ls -ltr
        read foo
        ;;
    8)
        echo "Mostrar directorio en funcion de la extension con ls -x"
        echo "Por extension"
        echo "========="
        ls -x
        read foo
        ;;
    9)
        echo "Mostrar directorio invertido en funcion de la extension con ls -xr"
        echo "Por extension"
        echo "========="
        ls -xr
        read foo
        ;;
    10)
        echo "Mostrar que hay dentro de directorios de forma recursiva ls -R"
        echo "Por Recursividad"
        echo "========="
        ls -R
        read foo
        ;;
    11)
        echo "Mostrar lo que ocupa cada directorio con  ls -Sh"
        echo "vemos en megas con ls -Sh"
        echo "========="
        ls -Sh
        read foo
        ;;
    12)
        echo "Mostrar el tamaño solo 1ºcolumna con  ls -Sh | cut -d ' ' -f 1"
        echo "vemos 1º columna"
        echo "========="
        ls -Sh | cut -d ' ' -f 1
        read foo
        ;;
    13)
        echo "Mostrar el directorio bashrc con cat ~/.bashrc"
        echo "Veropcion color con consola con cat ~/.bashrc | grep color"
        echo "========="
        cat ~/.bashrc
        echo "=====VER COLOR===="
        cat ~/.bashrc | grep color
        read foo
        ;;
    14)
        echo "Entrar a archivo  ~/.bashrc"
        echo "========="
        nano ~/.bashrc
        read foo
        ;;
    15)

        echo "====FOR IN====="
        for file in *; do
            echo $file
        done
        read foo
        ;;
    16)

        echo "====Listar ls con for in,forma mejorada====="
        # Que no interprete los saltosde linea IFS
        IFS=$'\n'
        for file in $(ls -Rl); do
            echo $file
        done
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
