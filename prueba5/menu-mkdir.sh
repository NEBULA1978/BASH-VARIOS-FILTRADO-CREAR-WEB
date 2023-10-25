#!/bin/bash
#todoreal.com
while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar directorio"
    echo "2. Crear un directorio con mkdir"
    echo "3. Crear un directorio con mkdir y otro directorio dentro"
    echo "5. Ver  directorios con tree"
    echo "6. Crear un directorio con un nombre y 3carpetas dentro"
    echo "7. Ver  directorios con tree -d vemos directorios y subdirectorios"
    echo "8. Borrar:vemos si carpeta contiene algo con ls (nombre) y sino borramos"
    echo "9. Ver que archivos hemos borrado con vervose rmdir -pv padre/hijo/nieto/"
    echo "10. Borrar archivos pero que nos consulte"
    echo "11. Borrar carpetas con rchivos pero que nos consulte"
    echo "4. Salir"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Mostrando directorio"
        ls
        read foo
        ;;
    2)
        echo "Crear un directorio con mkdir"
        mkdir prueba-mkdir
        read foo
        ;;
    3)
        echo "Crear un directorio con mkdir y otro directorio dentro"
        mkdir -p padre/hijo/nieto
        read foo
        ;;
    5)
        echo "Crear un directorio con mkdir y otro directorio dentro"
        tree
        read foo
        ;;
    6)
        echo "Crear un directorio con un nombre y 3carpetas dentro"
        mkdir -p a1/1 a1/2 a1/3
        tree
        read foo
        ;;
    7)
        echo "Ver  directorios con tree -d vemos directorios y subdirectorios"
        tree -d
        read foo
        ;;
    8)
        echo "vemos si carpeta contiene algo con ls (nombre) y sino borramos"
        echo "ls dir3 por ejmplo sino tiene nada rmdir dir3 solo si esta vacio"
        echo "Si tiene cosas dentro directorio rm -r dir3"
        read foo
        ;;
    9)
        echo "Ver que archivos hemos borrado con vervose rmdir -pv padre/hijo/nieto/"
        echo "rmdir -pv padre/hijo/nieto/ "
        echo "rmdir -v directorio/subdirectorio (Nos mustra lo que ha borrado) "
        read foo
        ;;
    10)
        echo "Borrar archivos pero que nos consulte"
        echo " rm -i f?.txt"
        echo "rmdir -pv padre/hijo/nieto/ "
        echo "rmdir -v directorio/subdirectorio (Nos mustra lo que ha borrado) "
        read foo
        ;;
    11)
        echo "Borrar carpetas con rchivos pero que nos consulte"
        echo " rm -ri prueba/"
        # echo "rmdir -pv padre/hijo/nieto/ "
        # echo "rmdir -v directorio/subdirectorio (Nos mustra lo que ha borrado) "
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
