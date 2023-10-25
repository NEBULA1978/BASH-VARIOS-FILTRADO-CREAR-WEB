#!/bin/bash
#todoreal.com
while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar varios directorios"
    echo "2. Creamos varios ficheros"
    echo "3. Mostrar cualquier cosa que termine con .txt con ls *.txt"
    echo "5. Mostrar que empiece con f y termine con .txt"
    echo "6. Mostrar que empiece con f hacemos con ls f*"
    echo "7. Mostrar que empiece con f mas un caracter y termine .txt hacemos con ls f??.txt"
    echo "8. Mostrar que empiece con 3 caracteres(los que sean) y termine .txt hacemos con ls f???txt"
    echo "9. Mostrar que empiece con 3 caracteres(los que sean) y termine .tx? hacemos con ls f??tx?"
    echo "10. Mostrar que termine con f hacemos con ls fichero?"
    echo "11. Mostrar fichero mas lo que sea despues con ls fichero*?"
    echo "12. Mostrar ficheros carpeta actual y guardar en listado.txt con  > "
    echo "13. Mostrar archivo listado.txt con  cat "
    echo "14. Mostrar ficheros carpeta actual y concatenar y guardar en listado.txt con  >> "
    echo "15. Mostrando redirecciones o tuberias pipes,ordenamos numeros de numeros.txt con sort"
    echo "4. Salir"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Mostrando dos directorios"
        ls
        echo "Introducimos ls carpeta1 parpeta2"
        read foo
        ;;
    2)
        echo "Creamos varios ficheros"
        touch f1.txt f2.txt f3.txt f4.txt fichero 1 fichero 2 fichero3 otro_directorio prueba
        read foo
        ;;
    3)
        echo "Mostrar cualquier cosa que termine con .txt con ls *.txt "
        ls *.txt
        read foo
        ;;
    5)
        echo "Mostrar que empiece con f y termine con .txt "
        ls f*.txt
        read foo
        ;;
    6)
        echo "Mostrar que empiece con f hacemos con ls f* "
        ls f*
        read foo
        ;;
    7)
        echo "Mostrar que empiece con f mas un caracter y termine .txt hacemos con ls f??.txt"
        ls f??.txt
        read foo
        ;;
    8)
        echo "Mostrar que empiece con 3 caracteres(los que sean) y termine .txt hacemos con ls f???txt"
        ls f???txt
        read foo
        ;;
    9)
        echo " Mostrar que empiece con 3 caracteres(los que sean) y termine .tx? hacemos con ls f??tx?"
        ls f??tx?
        read foo
        ;;
    10)
        echo " Mostrar que termine con un caractaer el quesea hacemos con ls fichero?"
        ls fichero?
        read foo
        ;;
    11)
        echo " Mostrar fichero mas lo que sea despues con ls fichero* "
        ls fichero*
        read foo
        ;;
    12)
        echo " Mostrar archivos carpeta actual y guardar en listado.txt con  > "
        ls >fichero.txt
        read foo
        ;;
    13)
        echo " Mostrar archivo listado.txt con  cat "
        cat fichero.txt
        read foo
        ;;
    14)
        echo " Mostrar ficheros carpeta actual y concatenar y guardar en listado.txt con  >> "
        ls >>fichero.txt
        read foo
        ;;
    15)
        echo "Mostrando redirecciones o tuberias pipes,ordenamos numeros de numeros.txt con sort(orden alfabetico"
        echo "Sin oredenar"
        cat numeros.txt
        echo"=======Ordenados=========="
        cat numeros.txt | sort
        # Es lo mismo que arriba: sort numeros.txt
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
