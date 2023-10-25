#!/bin/bash
#todoreal.com
while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar directorio forma arbol con tree Carpeta Documentos"
    echo "2. Mostrar directorio de un directorio de forma arbol con tree"
    echo "3. Mostrar todos los ficheros arbol con tree -a"
    echo "5. Mostrar todos los directorios arbol con tree -d"
    echo "6. Mostrar todos las ruta arbol con tree -f"
    echo "7. Mostrar contenido ruta completa /bin con tree -f /bin"
    echo "8. Mostrar contenido  /bin con tree /bin sin ruta"
    echo "9. Mostrar el arbol  solo ficheros.txt con tree -P (comillas)*.txt(comillas) con patron"
    echo "10. Mostrar contenido  carpeta sin ver .txt"
    echo "4. Salir"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Mostrar directorios de forma arbol con tree"
        tree
        read foo
        ;;
    2)
        echo "Mostrar directorio de un directorio de forma arbol con tree"
        echo " tree (nombre directorio)"
        cd || /home/next
        tree Documentos

        read foo
        ;;
    3)
        echo "Mostrar todos los ficheros arbol con tree -a"
        # Hay demasiados
        # cd /home/next
        tree -a
        read foo
        ;;
    5)
        echo "Mostrar todos los directorios arbol con tree -d"
        # Hay demasiados
        # cd /home/next
        tree -d
        read foo
        ;;
    6)
        echo "Mostrar todos las ruta arbol con tree -f"
        # Hay demasiados
        # cd /home/next
        tree -f
        read foo
        ;;
    7)
        echo "Mostrar contenido ruta completa /bin con tree -f /bin"
        # Hay demasiados
        # cd /home/next
        tree -f /bin
        read foo
        ;;
    8)
        echo "Mostrar contenido  /bin con tree /bin sin ruta"
        # Hay demasiados
        # cd /home/next
        tree /bin
        read foo
        ;;
    9)
        echo "Mostrar el arbol  solo ficheros.txt con tree -P (comillas)*.txt(comillas)"
        # Hay demasiados
        # cd /home/next
        tree -P "*.txt"
        read foo
        ;;
    10)
        echo "Mostrar contenido  carpeta sin ver .txt"
        # Hay demasiados
        # cd /home/next
        tree -I "*.txt"
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
