#!/bin/bash
#todoreal.com
while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar variable entorno (dolar)HOME"
    echo "2. Mostrando variables entorno del sistema"
    echo "3. Mostrando variables entorno del sistema con | less poco a poco vemos"
    echo "5. Ver usuario con echo (dolar)USER"
    echo "6. Ver el archivo anterior donde hemos estado echo (dolar)OLDPWD"
    echo "7. Abrir carpeta modo normal con thunar ."
    echo "8. Ir al archivo anterior donde hemos estado cd (dolar)OLDPWD"
    echo "9. Vemos el PATH con echo (dolar)PATH donde tenemos la posibilidad de no poner .(antes ejecutar script o la direccion completa) "
    echo "4. Salir"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Mostrar variable entorno (dolar)HOME"
        echo $HOME
        read foo
        ;;
    2)
        echo "Mostrando variables entorno del sistema"
        printenv
        read foo
        ;;
    3)
        echo "Mostrando variables entorno del sistema con | less poco a poco vemos"
        printenv | less
        read foo
        ;;
    5)
        echo "Ver usuario con echo (dolar)USER"
        echo $USER
        read foo
        ;;
    6)
        echo "Ver el archivo anterior donde hemos estado echo (dolar)OLDPWD"
        echo $OLDPWD
        read foo
        ;;
    7)
        echo "Abrir carpeta modo normal con thunar"
        thunar .
        read foo
        ;;
    8)
        echo "Ir al archivo anterior donde hemos estado cd (dolar)OLDPWD"
        cd $OLDPWD
        read foo
        ;;
    9)
        echo "Vemos el PATH con echo (dolar)PATH nos dice losdirectorios donde tenemos la posibilidad de no poner .(antes ejecutar script o la direccion completa) "
        echo $PATH
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
