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
    echo "5. Nos muestra las palabras que contiene una a no que empiezan por a:"
    echo "6. Nos muestra las palabras que contienen una a :"
    echo "7. Busca en el archivo /usr/share/dict/spanish todas las líneas que contienen la letra a y as últimas 10 líneas de esa salida"
    echo "8. Todas las palabras que empiezan por a :"
    echo "9. Saber los usuarios que empiezan por a"
    echo "10. Las 10 ultimas palabras que terminen en o:"
    echo "11. Que empiece por una c luego una aei luego una s  y una (a,o)"
    echo "12. MUY GENERICO:"
    echo "13. MAS ESPECIFICO:"
    echo "14. Empezar con la letra "c" seguida de una de las letras "a", "e" o "i"
    Tener dos caracteres adicionales después de eso
    Terminar con una de las letras "e", "i", "o", "u", "r", "t" o "a""
    echo "15. Seleccionar todas las personas de 30años con grep:"
    echo "16. El comando grep imprimirá en la salida estándar todas las líneas que cumplan con este patrón"
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
        echo "Nos muestra las palabras que contiene una a no que empiezan por a:"
        grep a /usr/share/dict/spanish | head
        read foo
        ;;

    # echo "6. Nos muestra las palabras que contienen una a :"
    6)
        echo "Nos muestra las palabras que contienen una a :"
        grep a /usr/share/dict/spanish | tail
        read foo
        ;;

    # echo "7. Busca en el archivo /usr/share/dict/spanish todas las líneas que contienen la letra a y as últimas 10 líneas de esa salida"
    7)
        echo "Busca en el archivo /usr/share/dict/spanish todas las líneas que contienen la letra a y as últimas 10 líneas de esa salida"
        grep ^a /usr/share/dict/spanish | tail
        read foo
        ;;

    # echo "8. Todas las palabras que empiezan por a :"
    8)
        echo "Todas las palabras que empiezan por a :"
        grep ^a /usr/share/dict/spanish | tail
        read foo
        ;;

    # echo "9. Saber los usuarios que empiezan por a"
    9)
        echo "aber los usuarios que empiezan por a"
        grep ^a /etc/passwd
        read foo
        ;;

    # echo "10. Las 10 ultimas palabras que terminen en o:"
    10)
        echo "Las 10 ultimas palabras que terminen en o:"
        grep o$ /usr/share/dict/spanish | tail
        read foo
        ;;

    # echo "11. Que empiece por una c luego una aei luego una s  y una (a,o)"
    11)
        echo "Que empiece por una c luego una aei luego una s  y una (a,o)"
        grep c[aei]s[ao] /usr/share/dict/spanish | tail
        read foo
        ;;

    # echo "12. MUY GENERICO:"
    12)
        echo "MUY GENERICO:"
        grep c[aei]s[ao] /usr/share/dict/spanish
        read foo
        ;;

    # echo "13. MAS ESPECIFICO:"
    13)
        echo "MAS ESPECIFICO:"
        grep ^c[aei]s[ao]$ /usr/share/dict/spanish
        read foo
        ;;

    # echo "14. Empezar con la letra "c" seguida de una de las letras "a", "e" o "i"
    # Tener dos caracteres adicionales después de eso
    # Terminar con una de las letras "e", "i", "o", "u", "r", "t" o "a""
    14)
        echo "Empezar con la letra "c" seguida de una de las letras "a", "e" o "i"
        Tener dos caracteres adicionales después de eso
        Terminar con una de las letras e, i, o, u, r, t o a"
        grep ^c[aei]s..[eiourta]$ /usr/share/dict/spanish
        read foo
        ;;

    # echo "15. Seleccionar todas las personas de 30años con grep:"
    15)
        echo "Seleccionar todas las personas de 30años con grep:"
        grep 2.$ datos.csv
        grep ', 30$' people.txt
        read foo
        ;;
    16)
        echo "Seleccionar todas las personas de 30 años y 20 años con grep:"
        grep [23].$ datos.csv
        echo "Solo quiero el nombre y la edad:"
        grep [23].$ datos.csv | cut -d";" -f1,6
        echo "Solo las personas de 30 años y 20 años"
        grep ', 2[03]$' people.txt
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
