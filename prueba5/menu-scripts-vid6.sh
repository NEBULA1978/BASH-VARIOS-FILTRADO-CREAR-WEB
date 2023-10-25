#!/bin/bash
#todoreal.com
while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar consola que estamos trabajando"
    echo "2. Mostrar cadena de texto en script y saludar a usuario"
    echo "3. Wardar en variable lang (echo ($)LANGUAGE | cut -d '_' -f 1)"
    echo "5. Saludar a usuario en ingles o español depende de LANGUAGE"
    echo "6. Copiar en ($)PATH el archivo .sh para no tener que escribir el .(al ejecutar)"
    echo "4. Salir"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Mostrar consola que estamos trabajando"
        echo $SHELL
        read foo
        ;;
    2)
        echo "Mostrar cadena de texto en script y saludar a usuario"
        echo "Hola, "$USER
        echo $LANGUAGE
        echo "Solo quiero ver la 1ºparte de  (es Es),que me diga es abajo:"
        echo "echo $LANGUAGE | cut -d ' ' -f 1"
        echo "=========="
        echo $LANGUAGE | cut -d '_' -f 1
        echo "Para ver ES de es_ES"
        echo $LANGUAGE | cut -d '_' -f 2
        read foo
        ;;
    3)
        echo "Wardar en variable lang (echo ($)LANGUAGE | cut -d '_' -f 1)"
        # Wardamos en variable tabtas tuberias copmo queramos
        lang=$(echo $LANGUAGE | cut -d '_' -f 1)
        echo $lang
        if [ "$lang" = "es" ]; then
            echo "El idioma configurado es Español"
        else
            echo "El idioma no es español"
        fi
        read foo
        ;;
    5)
        echo "Saludar a usuario en ingles o español depende de LANGUAGE"
        lang=$(echo $LANGUAGE | cut -d '_' -f 1)

        if [ "$lang" = "es" ]; then
            echo "Hola, "$USER
        else
            echo "Hellow, "$USER

        fi
        read foo
        ;;
    6)
        echo "Copiar en ($)PATH el archivo .sh para no tener que escribir el .(al ejecutar)"
        echo "Escribimos cp saludo.sh /home/next/.local/bin/saludo"
        echo "Desde cualquier parte de la consola escribimos hola.sh y nos saluda"
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
