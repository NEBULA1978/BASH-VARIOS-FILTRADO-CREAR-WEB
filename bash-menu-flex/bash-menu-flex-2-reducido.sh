#!/bin/bash

# Función para solicitar valores personalizados
get_custom_values() {
  echo "Introduce el tipo de display para div (por ejemplo, 'flex', 'block', 'inline-flex', etc.):"
  read -r GRID_DISPLAY
  GRID_DISPLAY=${GRID_DISPLAY:-flex} # Valor por defecto si no se introduce ninguno

  echo "Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse'):"
  read -r FLEX_DIRECTION
  FLEX_DIRECTION=${FLEX_DIRECTION:-row} # Valor por defecto si no se introduce ninguno

  echo "Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse'):"
  read -r FLEX_WRAP
  FLEX_WRAP=${FLEX_WRAP:-nowrap} # Valor por defecto si no se introduce ninguno

  echo "Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around'):"
  read -r JUSTIFY_CONTENT
  JUSTIFY_CONTENT=${JUSTIFY_CONTENT:-flex-start} # Valor por defecto si no se introduce ninguno

  echo "Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline'):"
  read -r ALIGN_ITEMS
  ALIGN_ITEMS=${ALIGN_ITEMS:-stretch} # Valor por defecto si no se introduce ninguno

  echo "Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch'):"
  read -r ALIGN_CONTENT
  ALIGN_CONTENT=${ALIGN_CONTENT:-flex-start} # Valor por defecto si no se introduce ninguno
}

# Función para generar el archivo HTML con CSS personalizado
generate_html() {
  cat <<EOF >flexbox_example.html
<!DOCTYPE html>
<html>
<head>
<style>
.flex-container {
  display: $GRID_DISPLAY;
  flex-direction: $FLEX_DIRECTION;
  flex-wrap: $FLEX_WRAP;
  justify-content: $JUSTIFY_CONTENT;
  align-items: $ALIGN_ITEMS;
  align-content: $ALIGN_CONTENT;
  height: 300px; /* Ajusta la altura según sea necesario */
  border: 1px solid black; /* Agrega un borde para visualizar el contenedor */
}

.flex-item {
  width: 100px; /* Ancho de los elementos flexibles */
  height: 100px; /* Altura de los elementos flexibles */
  margin: 10px; /* Márgenes entre los elementos flexibles */
  background-color: lightgray; /* Color de fondo de los elementos */
}

.centered-box {
  width: 100px;
  height: 100px;
  background-color: lightblue;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
</head>
<body>
<div class="flex-container">
  <div class="flex-item">1</div>
  <div class="flex-item">2</div>
  <div class="centered-box">Centered</div>
</div>
</body>
</html>
EOF

  echo "Archivo HTML generado como 'flexbox_example.html'."
}

# Main script
get_custom_values
generate_html
