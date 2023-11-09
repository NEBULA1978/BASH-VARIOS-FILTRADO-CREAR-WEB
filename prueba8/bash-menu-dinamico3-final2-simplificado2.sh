#!/bin/bash

opciones=(
    "Mostrar directorio:|ls -lth"
    "Mostrar calendario:|cal"
    "Mostrar fecha de hoy:|date"
    "Salir:|exit 0"
    "Ver lineas del archivo elegido en la carpeta actual:|ls; read -p 'Introduzca el nombre del archivo: ' file_to_display; if [ -f \"$file_to_display\" ]; then nl \"$file_to_display\"; else echo \"El archivo $file_to_display no existe.\"; fi"
    "Copiar un rango de líneas de un archivo a otro:|read -p 'Introduzca el nombre del archivo de búsqueda: ' buscar_file; read -p 'Introduzca el nombre del archivo de destino: ' destino_file; read -p 'Introduzca el número de la primera línea del rango a copiar: ' start_line; read -p 'Introduzca el número de la última línea del rango a copiar: ' end_line; read -p 'Introduzca el número de línea en el archivo de destino donde desea introducir la copia: ' destination_line; cp \"$destino_file\" \"$destino_file.bak\"; sed -n \"${start_line},${end_line}p\" \"$buscar_file\" >temp_copy.txt; head -n $((destination_line - 1)) \"$destino_file\" >temp_head.txt; tail -n +$destination_line \"$destino_file\" >temp_tail.txt; cat temp_head.txt temp_copy.txt temp_tail.txt >\"$destino_file\"; rm temp_copy.txt temp_head.txt temp_tail.txt; echo \"Rango de líneas copiado exitosamente en la línea $destination_line. Se ha creado un respaldo en $destino_file.bak.\""
    "Buscar una palabra en un archivo:|read -p 'Introduzca el nombre del archivo en el que buscar la palabra: ' file_to_search; read -p 'Introduzca la palabra a buscar: ' word_to_search; if grep -q \"$word_to_search\" \"$file_to_search\"; then echo \"La palabra '$word_to_search' fue encontrada en el archivo '$file_to_search'.\"; else echo \"La palabra '$word_to_search' no fue encontrada en el archivo '$file_to_search'.\"; fi"
    "Modificar el título en texto-introducir.txt:|read -p 'Introduzca el nuevo título: ' new_title; sed -i \"s/<title>.*<\/title>/<title>${new_title}<\/title>/\" texto-introducir.txt; echo \"Título modificado en texto-introducir.txt.\""
    "Eliminar una línea de texto-introducir.txt:|read -p 'Introduzca el número de línea a eliminar: ' line_number; sed -i \"${line_number}d\" texto-introducir.txt; echo \"Línea eliminada exitosamente.\""
    "Ver archivos en la carpeta actual:|ls -lah"
    "Buscar palabra en archivos de la carpeta actual:|read -p 'Introduzca la palabra a buscar en archivos de la carpeta actual: ' word_in_files; read -p 'Introduzca el nombre del archivo para guardar los resultados: ' output_file; grep -rnw . -e \"$word_in_files\" | awk -F: '{print \"Archivo:\", $1, \"Línea:\", $2, \"Texto:\", $3}' >\"$output_file\"; echo \"Resultados de la búsqueda por palabra '$word_in_files' en la carpeta actual se han guardado en '$output_file'.\""
    "Añadir comentarios a un archivo HTML/CSS/JS:|read -p 'Introduzca el tipo de archivo (html/css/js): ' file_type; read -p 'Introduzca el nombre del archivo al que desea añadir comentarios: ' file_to_comment; read -p 'Introduzca el número de la primera línea para agregar el comentario: ' start_line; read -p 'Introduzca el número de la línea para finalizar el comentario: ' end_line; if [ -f \"$file_to_comment\" ]; then case \"$file_type\" in \"html\") if [ \"$end_line\" -lt \"$start_line\" ]; then echo \"El número de la última línea debe ser mayor que el número de la primera línea.\"; else sed -i \"${start_line}s|^|<!-- |\" \"$file_to_comment\"; sed -i \"${end_line}s|$| -->|\" \"$file_to_comment\"; echo \"Se han agregado comentarios en el archivo $file_to_comment.\"; fi;; \"css\") if [ \"$end_line\" -lt \"$start_line\" ]; then echo \"El número de la última línea debe ser mayor que el número de la primera línea.\"; else sed -i \"${start_line}s|^|/* |\" \"$file_to_comment\"; sed -i \"${end_line}s|$| */|\" \"$file_to_comment\"; echo \"Se han agregado comentarios en el archivo $file_to_comment.\"; fi;; \"js\") if [ \"$end_line\" -lt \"$start_line\" ]; then echo \"El número de la última línea debe ser mayor que el número de la primera línea.\"; else sed -i \"${start_line}s|^|// |\" \"$file_to_comment\"; sed -i \"${end_line}s|$| |\" \"$file_to_comment\"; echo \"Se han agregado comentarios en el archivo $file_to_comment.\"; fi;; *) echo \"Tipo de archivo no compatible. Use 'html', 'css' o 'js'.\"; ;; esac; else echo \"El archivo $file_to_comment no existe.\"; fi"
    "Sustituir palabra en archivo texto-sustituir-palabra.txt:|current_word=$(awk 'NR==2{match($0, /<.*>(.*)<.*/, arr); print arr[1]}' texto-sustituir-palabra.txt); read -p 'Introduzca una nueva palabra para reemplazar '$current_word': ' new_word; if [ -z \"$new_word\" ]; then new_word=$current_word; else sed -i \"2s/$current_word/$new_word/\" texto-sustituir-palabra.txt; echo \"Palabra reemplazada con éxito en la línea 2.\"; fi"
    "Mostrar varios directorios:|read -p 'Introduzca los directorios separados por un espacio: ' directorios; ls \$directorios"
    "Crear varios ficheros:|read -p 'Se crearán varios ficheros... Introduzca los nombres separados por un espacio: ' nombres_ficheros; touch \$nombres_ficheros"
    "Mostrar archivos con una extensión específica:|read -p 'Ingrese la extensión de archivo a mostrar: ' extension; ls \"*.\$extension\""
    "Mostrar archivos que empiecen con 'f' y terminen con '.txt':|read -p 'Introduzca las letras para buscar archivos que empiecen con 'f' y terminen con '.txt': ' letras; ls \"f*\$letras.txt\""
    "Mostrar archivos que empiecen con 'f':|read -p 'Introduzca las letras para buscar archivos que empiecen con 'f': ' letras; ls \"f*\$letras\""
    "Mostrar archivos que empiecen con 'f' seguido de dos caracteres y terminen con '.txt':|read -p 'Introduzca dos letras para buscar archivos que empiecen con 'f' seguido de dos caracteres y terminen con '.txt': ' letras; ls \"f??\$letras.txt\""
    "Mostrar archivos que empiecen con tres caracteres y terminen con '.txt':|read -p 'Introduzca tres letras para buscar archivos que empiecen con tres caracteres y terminen con '.txt': ' letras; ls \"f???\$letras.txt\""
    "Mostrar archivos que empiecen con tres caracteres y terminen con '.tx?':|read -p 'Introduzca dos letras para buscar archivos que empiecen con tres caracteres y terminen con '.tx?': ' letras; ls \"f??\$letras.tx?\""
    "Mostrar archivos que terminen con un carácter después de 'fichero':|read -p 'Introduzca un carácter para buscar archivos que terminen con un carácter después de 'fichero': ' caracter; ls \"fichero?\$caracter\""
    "Mostrar archivos que empiecen con 'fichero' seguido por cualquier caracter:|read -p 'Introduzca un caracter para buscar archivos que empiecen con 'fichero' seguido por cualquier caracter: ' caracter; ls \"fichero\$caracter*\""
    "Mostrar archivos de la carpeta actual y guardar en listado.txt con '>':|ls > listado.txt"
    "Mostrar el contenido de listado.txt con 'cat':|cat listado.txt"
    "Mostrar archivos de la carpeta actual y añadir al archivo listado.txt con '>>':|ls >> listado.txt"
    "Ordenar números del archivo numeros.txt con sort:|echo 'Sin ordenar:'; cat numeros.txt; echo '======= Ordenados ========'; sort < numeros.txt"
)

while true; do
    clear
    echo "MENU SCRIPT V.2"
    echo "==============================="
    echo "Escoja una opción:"
    for ((i = 0; i < ${#opciones[@]}; i++)); do
        echo "$i. ${opciones[i]%%:*}" # Imprimimos el índice y el nombre de la opción (sin el comando).
    done
    echo "==============================="
    read -p "Ingrese el número de la opción: " opcion

    if [[ $opcion =~ ^[0-9]+$ ]] && [ "$opcion" -ge 0 ] && [ "$opcion" -lt ${#opciones[@]} ]; then
        clear
        seleccion="${opciones[$opcion]#*|}" # Obtenemos el comando correspondiente a la opción seleccionada.
        eval "$seleccion"                   # Ejecutamos el comando.
        read -p "Presione Enter para continuar..."
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read -p "Presione Enter para"
    fi
done
