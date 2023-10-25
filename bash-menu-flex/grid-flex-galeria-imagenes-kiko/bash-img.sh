#!/bin/bash

# Directorio donde se encuentran las imágenes
image_directory="img/"

# Nombre del archivo HTML de salida
output_file="photo_grid.html"

# Inicio del archivo HTML
cat <<EOL > $output_file
<!DOCTYPE html>
<html>
<head>
    <title>Photo Grid</title>
</head>
<body>
<div id='photo-container'>
<div class='column'>
EOL

# Bucle para generar las imágenes
for ((i = 1; i <= 20; i++)); do
    if ((i != 1 && i % 5 == 1)); then
        # Cierre y apertura de una nueva fila de columnas
        echo "</div><div class='column'>" >> $output_file
    fi

    # Generar el código HTML para la imagen
    image_name="Photo $i"
    image_file="${image_directory}photo_$i.jpg"

    cat <<EOL >> $output_file
    <a href='#' class='photo'>
        <img loading='lazy' alt='$image_name' src='$image_file' />
    </a>
EOL

done

# Cierre del archivo HTML
cat <<EOL >> $output_file
</div>
</div>
</body>
</html>
EOL

echo "Archivo HTML generado: $output_file"
