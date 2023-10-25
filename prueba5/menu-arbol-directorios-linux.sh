#!/bin/bash
#todoreal.com
while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar directorio"
    echo "2. Mostrar calendario"
    echo "3. Mostrar date"
    echo "5. Mostrar Carpetas raiz del sistema linux"
    echo "6. bin tenemos los programas que puede ejecutar cualquier usuario"
    echo "7. sbin tenemos los programas del sistema, solo puede ejecutar solo los del sistema o los que utilza el adiministrador "
    echo "8. Ver opciones en /bin/man man"
    echo "9. Ver los directorios del sistema de arranque carpeta (boot) dentro de /"
    echo "10. Ver la interfaz del sistema  carpeta (dev) dentro de / (vemos todos los dispositivos discos duros,etc)"
    echo "11. Ver archivos de configuracion del sistema con ls /etc/"
    echo "12. En archivo ver.txt Ver archivos de configuracion del sistema con ls /etc/"
    echo "13. Ver configuracion de red de la carpeta hosts en directorio / vemos con cat /etc/hosts"
    echo "14. Ver usuarios en / con cat /etc/passwd"
    echo "15. Ver usuarios que hay con ls /home/"
    echo "16. Ver librerias que hay con ls /lib/"
    echo "17. Ver librerias de python 3.9 con  ls /lib/python3.9/"
    echo "18. Ver si tengo usb con ls /media/next/"
    echo "19. Ver programas utilizado por terceros,no son de la distro con ls /opt/"
    echo "20. Ver todos los procesos en funcionamiento con ls /proc/"
    echo "21. Ususario root el el administrador del sistema puede hacer cualquier cosa dentro del sistema operativo vemos carpeta con ls /root/"
    # ls /srv para ver los servidores instalados en estacaso no tengo ninguno
    # sys igual que proc y dev es una interfaaz,no tiene ficheros son enlaces a la informacion del kernel
    # ls /sys/kernel/ son los ficheros o directorios del kernel del sistema
    # ls /temp/ tenemos archivos temporales
    # ls /usr/ es una replica de auellos directorios que utiliza
    # ls /var/ es donde tenemos las variables un servidor web,etc
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
        echo "Mostrando calendario"
        cal
        read foo
        ;;
    3)
        echo "Mostrando date"
        date
        read foo
        ;;
    5)
        echo "Mostrar Carpetas raiz del sistema linux"
        ls /
        echo "================="
        echo "Tanto bin como sbin son los archivos binarios es decir aquellos programas que se pueden ejecuar "
        read foo
        ;;
    6)
        echo "bin tenemos los programas que puede ejecutar cualquier usuario"
        ls /bin
        read foo
        ;;

    7)
        echo "sbin tenemos los programas del sistema,la carpeta (useradd o userdel) para crear usuarios o borrar usuarios, solo puede ejecutar el sistema o los que utilza el adiministrador"
        ls /sbin
        read foo
        ;;
    8)
        echo "Ver opciones en /bin/man man"
        /bin/man man
        read foo
        ;;
    9)
        echo "Ver los directorios del sistema de arranque carpeta boot dentro de /"
        ls /boot/
        read foo
        ;;
    10)
        echo "Ver la interfaz del sistema  carpeta (dev) dentro de / (vemos todos los dispositivos discos duros,carpeta null(errores)etc)"
        ls /dev/
        echo "============="
        echo "En gnulinux todo se puede trabajar como si fuera un fichero"
        read foo
        ;;
    11)
        echo "Ver archivos de configuracion del sistema con ls /etc/"
        ls /etc/
        echo "============="
        ls /etc/ >ver.txt
        echo "============="
        echo "En gnulinux todo se puede trabajar como si fuera un fichero"
        read foo
        ;;
    12)
        echo "En archivo ver.txt Ver archivos de configuracion del sistema con ls /etc/ "
        cat ver.txt
        read foo
        ;;
    13)
        echo "Ver configuracion de red de la carpeta hosts en directorio / vemos con cat /etc/hosts "
        cat /etc/hosts
        read foo
        ;;
    14)
        echo "Ver usuarios en / con cat /etc/passwd "
        cat /etc/passwd
        read foo
        ;;
    15)
        echo "Ver usuarios que hay con ls /home/"
        ls /home/
        read foo
        ;;
    16)
        echo "Ver librerias que hay con ls /lib/"
        ls /lib/
        read foo
        ;;
    17)
        echo "Ver librerias de python 3.9 con  ls /lib/python3.9/"
        ls /lib/python3.9/
        read foo
        ;;
    18)
        echo "Ver si tengo usb con ls /media/next/"
        ls /media/next/
        read foo
        ;;
    19)
        echo "Ver programas utilizado por terceros,no son de la distro con ls /opt/"
        ls /opt/
        read foo
        ;;
    20)
        echo "Ver todos los procesos en funcionamiento con ls /proc/"
        ls /proc/
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
