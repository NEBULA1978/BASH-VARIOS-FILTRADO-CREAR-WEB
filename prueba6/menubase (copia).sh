#!/bin/bash
while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar directorio"
    echo "2. Mostrar calendario"
    echo "3. Mostrar dato"
    echo "5. Indrocir frase y se muestra por pantalla awk"
    echo "6. Mostrar sólo los nombres y los tamaños de los ficheros:"
    echo "7. Mostrar sólo los nombres y tamaños de ficheros .txt:"
    echo "8. Imprimir las líneas que tengan más de 4 campos/columnas:"
    echo "9. Mostrar una determinada columna de información:"
    echo "10.Mostrar varias columnas, así como texto adicional (entre comillas):"
    echo "11.Imprimir campos en otro orden:"
    echo "12.Imprimir último campo de cada línea:"
    echo "13.Imprimir los campos en orden inverso:"
    echo "14.Imprimir última línea:"
    echo "15.Imprimir primeras N líneas: "

    echo "16. Mostrar las líneas que contienen valores numéricos mayor o menor que uno dado:"
    echo "17. Mostrar la línea con el valor numérico más grande en un campo determinado:"
    echo "18. Mostrar aquellos ficheros cuya longitud es mayor que 10 caracteres:"
    echo "19. Mostrar líneas con más o menos de N caracteres:"
    echo "20. Mostrar campos/líneas que cumplan determinadas condiciones entre campos:"
    echo "21. Mostrar y el número de campos de un fichero además de la línea:"
    echo "22. Mostrar y numerar sólo las líneas no vacías (no en blanco):"
    echo "23. Imprimir las líneas que tengan más de N campos:"
    echo "24. Mostrar el número de línea de cada fichero de una lista iniciando 
 desde cero la cuenta de líneas al empezar cada fichero:"
    echo "25.Mostrar el número de línea de cada fichero de una lista sin resetear
 la cuenta de líneas al empezar cada nuevo fichero:"
    echo "26.Sustituir la palabra jorge por carlos con awk"

    # Filtrado / Eliminación de información

    echo "27.Filtrar las líneas en blanco (numero campos ==0)"
    #     echo "27. Filtrar las líneas en blanco (numero campos ==0)"
    # #  Filtrar las líneas en blanco (numero campos ==0):
    # #  # cat file.txt | awk {' if (NF != 0) print $0 '}

    # #  Contar número de líneas donde la columna 3 sea mayor que la 1:
    # #  # awk '$3 > $1 {print i + "1"; i++}' fichero
    #     echo "28.  Contar número de líneas donde la columna 3 sea mayor que la 1:"
    echo "28.Contar número de líneas donde la columna 3 sea mayor que la 1:"

    # #  Eliminar campo 2 de cada línea:
    # #  # awk '{$2 = ""; print}' fichero
    #     echo "29.  Eliminar campo 2 de cada línea:"
    echo "29.Eliminar campo 2 de cada línea:"

    # #  Eliminar líneas duplicadas aunque sean no consecutivas:lines.
    # #  # awk '!temp_array[$0]++' fichero
    #     echo "30.  Eliminar campo 2 de cada línea:"
    echo "30.Eliminar campo 2 de cada línea:"
    echo 'Eliminar líneas que tengan una columna duplicada (usando un separador de columna).
# #  Usamos _ como temp_array. Usamos -F para indicar el separador de columnas.
# #  En este ejemplo miramos que la columna 3 sea diferente. Es el equivalente de un
# #  comando "uniq" comparando sólo una columna determinada.
# #  # awk -F',' '!_[$3]++' fichero'
    # #  Eliminar líneas que tengan una columna duplicada (usando un separador de columna).
    # #  Usamos _ como temp_array. Usamos -F para indicar el separador de columnas.
    # #  En este ejemplo miramos que la columna 3 sea diferente. Es el equivalente de un
    # #  comando "uniq" comparando sólo una columna determinada.
    # #  # awk -F',' '!_[$3]++' fichero
    #     echo "31.  Eliminar líneas que tengan una columna duplicada (usando un separador de columna):"
    echo "31.comando "uniq" comparando sólo una columna determinada."

    # #  (Se basa en utilizar un array de tipo hash/diccionario temporal donde
    # #  las líneas que aún no han aparecido valen 0, y las que han aparecido !=0)
    #     echo "32.  (Se basa en utilizar un array de tipo hash/diccionario temporal donde
    echo "32.(Se basa en utilizar un array de tipo hash/diccionario temporal donde las líneas que aún no han aparecido valen 0, y las que han aparecido !=0)"
    "
#  las líneas que aún no han aparecido valen 0, y las que han aparecido !=0)"

    echo "32.Saltar 1000 Líneas de un fichero:"
    # #  Saltar 1000 Líneas de un fichero:
    # #  # awk '{if ( NR > 1000 ) { print $0 }}' fichero
    #     echo "33.  Saltar 1000 Líneas de un fichero:"
    # #  Saltar líneas < 10 y > 20:
    # #  # awk '(NR >= 0) && (NR <= 20) { print $0 }'
    #     echo "34.  Saltar líneas < 10 y > 20:"
    echo "33.Saltar líneas < 10 y > 20:"

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
        echo "Mostrando datos"
        date
        read foo
        ;;
    5)
        echo "Indrocir frase y se muestra por pantalla awk"
        awk '{print "Hola estoy aprendiendo awk"}'
        read foo
        ;;
    6)
        echo "Mostrar sólo los nombres y los tamaños de los ficheros:"
        ls -l | awk '{ print $8 ":" $5 }'
        read foo
        ;;
    7)
        echo "  Mostrar sólo los nombres y tamaños de ficheros .txt:"
        ls -l | awk '$8 ~ /\.txt/ { print $8 ":" $5 }'
        read foo
        ;;
    8)
        echo " Imprimir las líneas que tengan más de 4 campos/columnas: "
        ls -l | awk '$8 ~ /\.txt/ { print $8 ":" $5 }'
        read foo
        ;;
    9)
        echo "  Mostrar una determinada columna de información:"
        ls -l | awk '{ print $5 }'
        read foo
        ;;

    # echo "9. Mostrar una determinada columna de información:"
    10)
        echo " Mostrar varias columnas, así como texto adicional (entre comillas): "
        ls -l | awk '{ print $8 ":" $5 }'
        read foo
        ;;

    # echo "10.Mostrar varias columnas, así como texto adicional (entre comillas):"
    11)
        echo " Imprimir campos en otro orden: "
        awk '{ print $2, $1 }' fichero
        read foo
        ;;

    # echo "11.Imprimir campos en otro orden:"
    12)
        echo "Imprimir último campo de cada línea:  "
        awk '{ print $NF }' fichero
        read foo
        ;;

    # echo "12.Imprimir último campo de cada línea:"
    13)
        echo " Imprimir los campos en orden inverso: "
        wk '{ for (i = NF; i > 0; --i) print $i }' fichero
        read foo
        ;;

    # echo "13.Imprimir los campos en orden inverso:"
    14)
        echo " Imprimir última línea: "
        awk '{line = $0} END {print line}'
        read foo
        ;;

    # echo "14.Imprimir última línea:"
    15)
        echo "Imprimir primeras N líneas:  "
        awk 'NR < 100 {print}'
        read foo
        ;;

        #     # echo "15.Imprimir primeras N líneas: "
    16)
        echo " Mostrar las líneas que contienen valores numéricos mayor o menor que uno dado:"
        ls -l | awk '$5 > 1000000 { print $8 ":" $5 }'
        ls -l | awk '$5 > 1000000 || $5 < 100 { print $8 ":" $5 }'
        fich1:12
        read foo
        ;;
        #     echo "16. Mostrar las líneas que contienen valores numéricos mayor o menor que uno dado:"
    17)
        echo " Mostrar la línea con el valor numérico más grande en un campo determinado:"
        awk '$1 > max { max=$1; linea=$0 }; END { print max, linea }' fichero
        read foo
        ;;
        #     echo "17. Mostrar la línea con el valor numérico más grande en un campo determinado:"
    18)
        echo " Mostrar aquellos ficheros cuya longitud es mayor que 10 caracteres:"
        ls -l | awk 'length($8) > 10 { print NR " " $8 }'
        read foo
        ;;
        #     echo "18. Mostrar aquellos ficheros cuya longitud es mayor que 10 caracteres:"
    19)
        echo " Mostrar líneas con más o menos de N caracteres:"
        awk 'length > 75' fichero
        awk 'length < 75' fichero
        read foo
        ;;
        #     echo "19. Mostrar líneas con más o menos de N caracteres:"
    20)
        echo "Mostrar campos/líneas que cumplan determinadas condiciones entre campos: "
        awk '$2 > $3 {print $3}' fichero
        awk '$1 > $2 {print length($1)}' fichero

        read foo
        ;;
        #     echo "20. Mostrar campos/líneas que cumplan determinadas condiciones entre campos:"
    21)
        echo "Mostrar y el número de campos de un fichero además de la línea: "
        awk '{ print NF ":" $0 } ' fichero
        read foo
        ;;
        #     echo "21. Mostrar y el número de campos de un fichero además de la línea:"
    22)
        echo " Mostrar y numerar sólo las líneas no vacías (no en blanco):"
        awk 'NF { $0=++a " :" $0 }; { print }'
        read foo
        ;;
        #     echo "22. Mostrar y numerar sólo las líneas no vacías (no en blanco):"
    23)
        echo "Imprimir las líneas que tengan más de N campos: "
        awk 'NF > 5 { print $0 }' fichero

        read foo
        ;;
        #     echo "23. Imprimir las líneas que tengan más de N campos:"
    24)
        echo "Mostrar el número de línea de cada fichero de una lista iniciando 
#  desde cero la cuenta de líneas al empezar cada fichero: "
        awk '{print FNR "\t:" $0}' *.txt

        read foo
        ;;
        #     echo "24. Mostrar el número de línea de cada fichero de una lista iniciando
        #  desde cero la cuenta de líneas al empezar cada fichero:"
    25)
        echo "Mostrar el número de línea de cada fichero de una lista sin resetear
#  la cuenta de líneas al empezar cada nuevo fichero: "
        awk '{print FNR "\t:" $0}' *.txt
        read foo
        ;;
        #     echo "25.Mostrar el número de línea de cada fichero de una lista sin resetear
        #  la cuenta de líneas al empezar cada nuevo fichero:"
    26)
        echo "Sustituir la palabra jorge por carlos con awk "
        echo "Hola jorge" | awk '{$2="carlos"; print $0}'
        read foo
        ;;
        #     echo "25.Mostrar el número de línea de cada fichero de una lista sin resetear
        #  la cuenta de líneas al empezar cada nuevo fichero:"

        # echo "27. Filtrar las líneas en blanco (numero campos ==0)"
        # #  Filtrar las líneas en blanco (numero campos ==0):
        # #  # cat file.txt | awk {' if (NF != 0) print $0 '}
    27)
        echo "Filtrar las líneas en blanco (numero campos ==0)"
        cat file.txt | awk {' if (NF != 0) print $0 '}
        read foo
        ;;

        # #  Contar número de líneas donde la columna 3 sea mayor que la 1:
        # #  # awk '$3 > $1 {print i + "1"; i++}' fichero
        #     echo "28.  Contar número de líneas donde la columna 3 sea mayor que la 1:"
    28)
        echo "Contar número de líneas donde la columna 3 sea mayor que la 1:"
        awk '$3 > $1 {print i + "1"; i++}' fichero
        read foo
        ;;

        # #  Eliminar campo 2 de cada línea:
        # #  # awk '{$2 = ""; print}' fichero
        #     echo "29.  Eliminar campo 2 de cada línea:"
    29)
        echo "Eliminar campo 2 de cada línea:"
        awk '{$2 = ""; print}' fichero
        read foo
        ;;

        # #  Eliminar líneas duplicadas aunque sean no consecutivas:lines.
        # #  # awk '!temp_array[$0]++' fichero
        #     echo "30.  Eliminar campo 2 de cada línea:"
    30)
        echo "Eliminar líneas duplicadas aunque sean no consecutivas:lines."
        awk '!temp_array[$0]++' fichero
        read foo
        ;;

        # #  Eliminar líneas que tengan una columna duplicada (usando un separador de columna).
        # #  Usamos _ como temp_array. Usamos -F para indicar el separador de columnas.
        # #  En este ejemplo miramos que la columna 3 sea diferente. Es el equivalente de un
        # #  comando "uniq" comparando sólo una columna determinada.
        # #  # awk -F',' '!_[$3]++' fichero
        #     echo "31.  Eliminar líneas que tengan una columna duplicada (usando un separador de columna):"

    31)
        echo "Eliminar líneas que tengan una columna duplicada (usando un separador de columna):"
        awk -F',' '!_[$3]++' fichero
        read foo
        ;;
        # #  (Se basa en utilizar un array de tipo hash/diccionario temporal donde
        # #  las líneas que aún no han aparecido valen 0, y las que han aparecido !=0)
        #     echo "32.  (Se basa en utilizar un array de tipo hash/diccionario temporal donde
        # #  las líneas que aún no han aparecido valen 0, y las que han aparecido !=0)"
    32)
        echo "(Se basa en utilizar un array de tipo hash/diccionario temporal donde
# #  las líneas que aún no han aparecido valen 0, y las que han aparecido !=0)"
        echo "Saltar 1000 Líneas de un fichero:"
        awk '{if ( NR > 1000 ) { print $0 }}' fichero
        read foo
        ;;
    33)
        echo "(Se basa en utilizar un array de tipo hash/diccionario temporal donde
# #  las líneas que aún no han aparecido valen 0, y las que han aparecido !=0)"
        echo "Saltar líneas < 10 y > 20:"
        awk '(NR >= 0) && (NR <= 20) { print $0 }'
        read foo
        ;;

        # #  Saltar 1000 Líneas de un fichero:
        # #  # awk '{if ( NR > 1000 ) { print $0 }}' fichero
        #     echo "33.  Saltar 1000 Líneas de un fichero:"
        # #  Saltar líneas < 10 y > 20:
        # #  # awk '(NR >= 0) && (NR <= 20) { print $0 }'
        #     echo "34.  Saltar líneas < 10 y > 20:"

    4) exit 0 ;;
    #Alerta
    *)
        echo "Opcion invalida..."
        sleep 1
        ;;
    esac
done
