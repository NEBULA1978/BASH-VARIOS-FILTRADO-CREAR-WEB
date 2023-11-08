#!/bin/bash

function replace() {
    local text="$1"
    local busc="$2"
    local repl="$3"
    echo ${text//$busc/$repl}
}

function replace_once() {
    local text="$1"
    local busc="$2"
    local repl="$3"
    echo ${text/$busc/$repl}
}

function longitud() {
    local text="$1"
    echo ${#text}
}

function recorta() {
    local text="$1"
    local desde=$2
    local hasta=$3
    [ -z $hasta ] && echo ${text:$desde} || echo ${text:$desde:$hasta}
}

function encuentra() {
    local text="$1"
    local subt="$2"
    [[ "$text" == *"$subt"* ]] && echo "ESTÁ" || echo "NO ESTÁ"
}

function ruta_archivo() {
    local fich="$1"
    echo "${fich%/*}"
}

function base_archivo() {
    local fich="$1"
    echo "${fich##*/}"
}

function extension_archivo() {
    local fich="$1"
    echo ${fich##*.}
}

function extension_archivo2() {
    local fich="$1"
    echo ${fich#*.}
}

function posicion_cadena() {
    local text="$1"
    local subc="$2"
    tmp="${text%%$subc*}"
    [[ "$text" = "$tmp" ]] && echo -1 || echo ${#tmp}
}

while true; do
    clear
    echo "Menú de operaciones:"
    echo "1 - Reemplazar subcadenas"
    echo "2 - Contar caracteres de una cadena"
    echo "3 - Recortar cadenas"
    echo "4 - Saber si una subcadena existe"
    echo "5 - Extraer la ruta de un archivo"
    echo "6 - Extraer el archivo sin la ruta"
    echo "7 - Extraer el nombre de archivo sin la extensión"
    echo "8 - Sacar solo la extensión del archivo"
    echo "9 - Conocer la posición de una palabra dentro de una cadena"
    echo "10 - Salir"

    read -p "Elige una opción: " opcion

    case $opcion in
        1) 
            read -p "Introduce el texto: " texto
            read -p "Introduce la cadena a buscar: " buscar
            read -p "Introduce la cadena de reemplazo: " reemplazo
            echo "Resultado: $(replace "$texto" "$buscar" "$reemplazo")"
            read -p "Presiona Enter para continuar..."
            ;;
        2) 
            read -p "Introduce el texto: " texto
            echo "La longitud es: $(longitud "$texto")"
            read -p "Presiona Enter para continuar..."
            ;;
        3)
            read -p "Introduce el texto: " texto
            read -p "Introduce la posición inicial: " inicio
            read -p "Introduce la longitud (deja vacío para hasta el final): " longitud
            echo "Resultado: $(recorta "$texto" "$inicio" "$longitud")"
            read -p "Presiona Enter para continuar..."
            ;;
        4) 
            read -p "Introduce el texto: " texto
            read -p "Introduce la subcadena a buscar: " subcadena
            echo "La subcadena $subcadena $(:encuentra "$texto" "$subcadena")"
            read -p "Presiona Enter para continuar..."
            ;;
        5)
            read -p "Introduce la ruta del archivo: " archivo
            echo "La ruta del archivo es: $(ruta_archivo "$archivo")"
            read -p "Presiona Enter para continuar..."
            ;;
        6)
            read -p "Introduce la ruta del archivo: " archivo
            echo "El nombre del archivo es: $(base_archivo "$archivo")"
            read -p "Presiona Enter para continuar..."
            ;;
        7)
            read -p "Introduce el nombre del archivo: " archivo
            echo "El nombre del archivo sin extensión es: $(extension_archivo "$archivo")"
            read -p "Presiona Enter para continuar..."
            ;;
        8)
            read -p "Introduce el nombre del archivo: " archivo
            echo "La extensión del archivo es: $(extension_archivo2 "$archivo")"
            read -p "Presiona Enter para continuar..."
            ;;
        9)
            read -p "Introduce el texto: " texto
            read -p "Introduce la palabra a buscar: " palabra
            echo "La posición de la palabra es: $(posicion_cadena "$texto" "$palabra")"
            read -p "Presiona Enter para continuar..."
            ;;
        10) 
            echo "Saliendo..."
            break
            ;;
        *)
            echo "Opción no válida. Inténtalo de nuevo."
            read -p "Presiona Enter para continuar..."
            ;;
    esac
done
