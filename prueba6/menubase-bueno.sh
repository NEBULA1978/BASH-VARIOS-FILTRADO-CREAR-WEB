#!/bin/bash
#todoreal.com
while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar directorio con toda informacion"
    echo "2. Mostrar calendario"
    echo "3. Mostrar fecha de hoy"
    echo "5. Copiar nombre de carpetas directorio actual en archivo de texto con >"
    echo "6. Mostrar texto archivo salida_home.txt con cat"
    echo "7. Mostrar texto archivo salida_home.txt con more"
    echo "8. Eliminar archivo salida_home.txt con rm -r"
    echo "9.Añadir Copia de nombres de carpetas directorio actual en archivo de texto con >>"
    echo "10.Ver los 10 primeros nombres mas recientes de  salida_home.txt con tail"
    echo "11.Ver los 10 primeros nombres mas antigos de  salida_home.txt con tail los ultimos 10 "
    echo "12.Ver los 5 primeros nombres mas antigos de  salida_home.txt con tail los 5 ultimos  "
    echo "13.Con grep buscar nombres que tengan el patron de agosto ago en salida_home.txt  "
    echo "14.Con grep - v buscar nombres que no tengan el patron de agosto ago en salida_home.txt  "
    echo "15.Con grep y | tuberias sin ningun archivo de texto"
    echo "16.Con grep y | tuberias sin ningun archivo de texto | permisos"
    echo "17.Con grep y | tuberias sin ningun archivo de texto | permisos | grep 20:(entre comillas)"
    echo "18.Con cd entrar ICD-17_ComandosManejoDatos y vemos archivos con cat o more"
    echo "19.Crea archivo lista.csv para ver nombre alumnosConcatenar, texto de archivos en otro archivos"
    echo "20.Ver nombres del archivo lista.csv ordenado alfabeticamente"
    echo "21.Ver nombres del archivo lista.csv ordenado de menor a mayor"
    echo "22.Ver nombres del archivo lista.csv ordenado de mayor a menor calificaciones mas altas de estudiantes"
    echo "23.Ver nombres del archivo lista.csv ordenado de mayor a menor las 5 calificaciones mas altas de estudiantes"
    echo "24.Comando cut de archivo lista.csv para ver los tres 1ºs caracteres de los nombres"
    echo "25.Comando cut de archivo lista.csv para ver los 10 1ºs caracteres de los nombres"
    echo "26.Comando cut de archivo lista.csv para ver los nombres y apellidos la 1º y 2º columna, nos muestra la coma"
    echo "27.Comando cut de archivo lista.csv para ver los nombres y apellidos la 1º y 2º columna, nos muestra la coma,sustituimos por un espacio"
    echo "28.Comando awk de archivo lista.csv para ver los nombres y apellidos la 1º y 2º columna, nos muestra la coma,sustituimos por un espacio"
    echo "29.Vamos a suponer que la UNIVERSIDAD quiere crear un correo basdo en un nombre_apellido@universidad.com"
    echo "30.Vamos a suponer que la UNIVERSIDAD quiere crear un correo solo para energia renovables del archivo lista.css estan los correos"
    echo "31.Primero la columna con la carrera ,Vamos a ver cuantos estudiantes hay de cada carrera del archivo lista.css estan las carreras"
    echo "32.Primero la columna con la carrera ,Vamos a ver cuantos estudiantes hay de cada carrera y ORDENAMOS del archivo lista.css estan las carreras"

    echo "4. Salir"
    echo "========================================="
    echo "APUNTES"
    echo "Crear archivo lista.csv con opcion 19"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Mostrando directorio"
        ls -lth
        read foo
        ;;
    2)
        echo "Mostrando calendario"
        cal
        read foo
        ;;
    3)
        echo "Mostrando datos"
        date
        read foo
        ;;
    5)
        echo "Copiar nombre carpetas en archivo de texto con >"
        ls -lth >salida_home.txt
        echo "Hecho"
        echo "Con > se sobrescribe el archivo"
        read foo
        ;;
    6)
        echo "Mostrar texto archivo salida_home.txt con cat"
        cat salida_home.txt
        echo "Hecho"
        # echo "Con > se sobrescribe el archivo"
        read foo
        ;;
    7)
        echo "Mostrar texto archivo salida_home.txt con more"
        more salida_home.txt
        echo "Hecho"
        # echo "Con > se sobrescribe el archivo"
        read foo
        ;;
    8)
        echo "Eliminar archivo salida_home.txt con rm -r"
        rm -r salida_home.txt
        # echo "Con > se sobrescribe el archivo"
        echo "Hecho"
        read foo
        ;;
    9)
        echo "Añadir Copia de nombres de carpetas directorio actual en archivo de texto con >>"
        ls -lth >>salida_home.txt
        # echo "Con > se sobrescribe el archivo"
        echo "Hecho"
        read foo
        ;;
    10)
        echo "Ver los 10 primeros nombres mas recientes de  salida_home.txt con head, los 5 mas recientes head -5 salida_home.txt"
        head salida_home.txt
        # echo "Con > se sobrescribe el archivo"
        echo "Hecho"
        read foo
        ;;
    11)
        echo "Ver los 10 primeros nombres mas antigos de  salida_home.txt con tail"
        tail salida_home.txt
        # echo "Con > se sobrescribe el archivo"
        echo "Hecho"
        read foo
        ;;
    12)
        echo "Ver los 5 primeros nombres mas antigos de  salida_home.txt con tail los 5 ultimos"
        tail -5 salida_home.txt
        # echo "Con > se sobrescribe el archivo"
        echo "Hecho"
        read foo
        ;;
    13)
        echo "Con grep buscar nombres que tengan el patron de agosto ago en salida_home.txt"
        grep " ago " salida_home.txt
        # echo "Con > se sobrescribe el archivo"
        echo "Hecho"
        read foo
        ;;
    14)
        echo "Con grep - v buscar nombres que no tengan el patron de agosto ago en salida_home.txt "
        grep -v" ago " salida_home.txt
        # echo "Con > se sobrescribe el archivo"
        echo "Hecho"
        read foo
        ;;
    15)
        echo "Con grep y | tuberias sin ningun archivo de texto"
        ls -lth | grep " ago "
        # echo "Con > se sobrescribe el archivo"
        echo "Hecho"
        read foo
        ;;
    16)
        echo "Con grep y | tuberias sin ningun archivo de texto | permisos"
        ls -lth | grep " ago " | grep "drwxr-xr-x"
        # echo "Con > se sobrescribe el archivo"
        echo "Hecho"
        read foo
        ;;
    17)
        echo "17.Con grep y | tuberias sin ningun archivo de texto | permisos | grep 20:(entre comillas)"
        ls -lth | grep " ago " | grep "drwxr-xr-x" | grep "20:"
        # echo "Con > se sobrescribe el archivo"
        echo "Hecho"
        read foo
        ;;
    18)
        echo "18.Con cd entrar ICD-17_ComandosManejoDatos y vemos archivos con cat o more y el numero de lineas del archivo"
        cd ICD-17_ComandosManejoDatos
        cat semestre1a.csv | wc -l
        # cat semestre1b.csv
        echo " O con | more semestre1a.csv | es lo mismo que arriba"
        echo "Hecho"
        read foo
        ;;
    19)
        echo "19.Concatenar texto de archivos en otro archivos"
        cd ICD-17_ComandosManejoDatos
        cat semestre1a.csv semestre1b.csv >lista.csv
        cat lista.csv
        cat lista.csv | wc -l
        # cat semestre1b.csv
        echo " cat semestre1?.csv >lista.csv | es lo mismo arriba"
        echo " cat semestre1*.csv >lista.csv | es lo mismo arriba"
        echo "Hecho"
        read foo
        ;;
    20)
        echo "20.Ver nombres del archivo lista.csv ordenado alfabeticamente"
        cd /home/next/Documentos/more cat head tail sort wc cut awk uniq/ICD-17_ComandosManejoDatos

        sort -t "," -k 1 lista.csv

        # cat semestre1b.csv
        echo " cat semestre1?.csv >lista.csv | es lo mismo arriba"
        echo " cat semestre1*.csv >lista.csv | es lo mismo arriba"
        echo "Hecho"
        read foo
        ;;
    21)
        echo "21.Ver nombres del archivo lista.csv ordenado de menor a mayor"
        cd /home/next/Documentos/more cat head tail sort wc cut awk uniq/ICD-17_ComandosManejoDatos

        sort -t "," -k 3 -n lista.csv

        # cat semestre1b.csv
        echo " cat semestre1?.csv >lista.csv | es lo mismo arriba"
        echo " cat semestre1*.csv >lista.csv | es lo mismo arriba"
        echo "Hecho"
        read foo
        ;;
    22)
        echo "21.Ver nombres del archivo lista.csv ordenado de mayor a menor las calificaciones mas altas"
        cd /home/next/Documentos/more cat head tail sort wc cut awk uniq/ICD-17_ComandosManejoDatos

        sort -t "," -k 3 -n -r lista.csv

        # cat semestre1b.csv
        echo " cat semestre1?.csv >lista.csv | es lo mismo arriba"
        echo " cat semestre1*.csv >lista.csv | es lo mismo arriba"
        echo "Hecho"
        read foo
        ;;
    23)
        echo "Ver nombres del archivo lista.csv ordenado de mayor a menor las 5 calificaciones mas altas de estudiantes"
        cd /home/next/Documentos/more cat head tail sort wc cut awk uniq/ICD-17_ComandosManejoDatos

        sort -t "," -k 3 -n -r lista.csv | head -5

        # cat semestre1b.csv
        echo " cat semestre1?.csv >lista.csv | es lo mismo arriba"
        echo " cat semestre1*.csv >lista.csv | es lo mismo arriba"
        echo "Hecho"
        read foo
        ;;
    24)
        echo "Comando cut de archivo lista.csv para ver los tres 1ºs caracteres de los nombres"
        cd /home/next/Documentos/ | more lista.csv | cut -c 1-3

        echo "Hecho"
        read foo
        ;;
    25)
        echo "Comando cut de archivo lista.csv para ver los 10 1ºs caracteres de los nombres"
        cd /home/next/Documentos/ | more lista.csv | cut -c 1-10

        echo "Hecho"
        read foo
        ;;
    26)
        echo "26.Comando cut de archivo lista.csv para ver los nombres y apellidos la 1º y 2º columna"
        # Columna de 1 a la 2 y el separador es la coma,nos musetra la coma
        cd /home/next/Documentos/ | more lista.csv | cut -f 1-2 -d ","

        echo "Hecho"
        read foo
        ;;
    27)
        echo "Comando cut de archivo lista.csv para ver los nombres y apellidos la 1º y 2º columna, nos muestra la coma,sustituimos por un espacio"
        # Columna de 1 a la 2 y el separador es la coma,nos musetra la coma
        cd /home/next/Documentos/ | more lista.csv | cut -f 1-2 -d "," ----output-delimiter=" "

        echo "Hecho"
        read foo
        ;;
    28)
        echo "Comando awk de archivo lista.csv para ver los nombres y apellidos la 1º y 2º columna, nos muestra la coma,sustituimos por un espacio"
        # Columna de 1 a la 2 y el separador es la coma,nos musetra la coma
        cd /home/next/Documentos/ | awk -F "," '{ print $1 " " $2 }' lista.csv

        echo "Hecho"
        read foo
        ;;
    29)
        echo "Vamos a suponer que la UNIVERSIDAD quiere crear un correo basdo en un nombre_apellido@universidad.com"
        # Columna de 1 a la 2 y el separador es la coma,nos musetra la coma
        cd /home/next/Documentos/ | awk -F "," '{ print $1 "_" $2 "@universidad.com"}' lista.csv

        echo "Hecho"
        read foo
        ;;
    30)
        echo "Vamos a suponer que la UNIVERSIDAD quiere crear un correo solo para energia renovables del archivo lista.css estan los correos"
        # Columna de 1 a la 2 y el separador es la coma,nos musetra la coma
        cd /home/next/Documentos/ | awk -F "," '{ if ($4 == "RENOVABLES") print $1 "_" $2 "@solar.com"}' lista.csv

        echo "Hecho"
        echo "Podiamos poner head -5 lista.csv dentro de carpeta test"
        read foo
        ;;
    31)
        echo " 1º la columna con la carrera ,Vamos a ver cuantos estudiantes hay de cada carrera del archivo lista.css estan las carreras"
        # Columna de 1 a la 2 y el separador es la coma,nos musetra la coma
        cd /home/next/Documentos/ | awk -F "," '{ print $4}' lista.csv

        echo "Hecho"
        read foo
        ;;
    32)
        echo " 1º la columna con la carrera y ORDENAMOS,Vamos a ver cuantos estudiantes hay de cada carrera del archivo lista.css estan las carreras"
        # Columna de 1 a la 2 y el separador es la coma,nos musetra la coma
        cd /home/next/Documentos/ | awk -F "," '{ print $4}' lista.csv | sort | uniq -c

        echo "Hecho"
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
