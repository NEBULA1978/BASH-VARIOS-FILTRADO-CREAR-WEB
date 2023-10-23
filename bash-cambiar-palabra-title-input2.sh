#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar directorio:|ls -lth"
    "Mostrar calendario:|cal"
    "Mostrar fecha de hoy:|date"
    "Editar archivo:|editar_archivo"
    "Salir:|exit 0"
)

editar_archivo() {
    mapfile -t archivos < <(ls -1 --color=never)

    # Muestra la lista de archivos en el directorio actual
    echo "Archivos disponibles para editar:"
    for i in "${!archivos[@]}"; do
        echo "$i. ${archivos[$i]}"
    done

    # Solicita al usuario que ingrese el número del archivo que desea editar
    read -p "Ingrese el número del archivo que desea editar: " archivo_numero

    # Verifica si el número ingresado es válido
    if [[ ! "$archivo_numero" =~ ^[0-9]+$ ]] || [ "$archivo_numero" -ge ${#archivos[@]} ]; then
        echo "Número de archivo inválido."
        return
    fi

    # Obtiene el nombre del archivo seleccionado
    archivo_a_editar="${archivos[$archivo_numero]}"

    # Verifica si el archivo existe
    if [ ! -f "$archivo_a_editar" ]; then
        echo "El archivo no existe."
        return
    fi

    # Muestra las líneas del archivo con números
    echo "Contenido actual del archivo '$archivo_a_editar':"
    nl "$archivo_a_editar"

    # Solicita al usuario que ingrese el número de la línea que desea editar
    read -p "Ingrese el número de la línea que desea editar: " linea_a_editar

    # Solicita al usuario que ingrese la nueva etiqueta y contenido
    read -p "Ingrese la nueva etiqueta (por ejemplo, '<title>Nueva etiqueta</title>'): " nueva_etiqueta

    # Crea un archivo temporal para almacenar el contenido actualizado
    tempfile=$(mktemp)
    awk -v linea=$linea_a_editar -v nueva_etiqueta="$nueva_etiqueta" 'NR==linea {$0=nueva_etiqueta} {print}' "$archivo_a_editar" > "$tempfile"

    # Reemplaza el archivo original con el archivo temporal
    mv "$tempfile" "$archivo_a_editar"

    # Muestra el contenido actualizado del archivo
    echo "Contenido actualizado del archivo '$archivo_a_editar':"
    cat "$archivo_a_editar"

    echo "La línea se ha reemplazado con éxito en el archivo."
}

while true; do
    clear
    echo "MENU SCRIPT V.2"
    echo "==============================="
    echo "Escoja una opción:"
    for ((i=0; i<${#opciones[@]}; i++)); do
        echo "$i. ${opciones[$i]%%:*}" # Imprimimos el índice y el nombre de la opción (sin el comando).
    done
    echo "==============================="
    read -p "Ingrese el número de la opción: " opcion

    if [[ $opcion =~ ^[0-9]+$ ]] && [ "$opcion" -ge 0 ] && [ "$opcion" -lt ${#opciones[@]} ]; then
        clear
        seleccion="${opciones[$opcion]#*|}" # Obtenemos el comando correspondiente a la opción seleccionada.
        eval "$seleccion" # Ejecutamos el comando.
        read -p "Presione Enter para continuar..."
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read -p "Presione Enter para"
    fi
done
