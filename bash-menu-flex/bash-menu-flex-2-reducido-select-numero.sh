#!/bin/bash

# Valores por defecto
GRID_DISPLAY="flex"
FLEX_DIRECTION="row"
FLEX_WRAP="nowrap"
JUSTIFY_CONTENT="flex-start"
ALIGN_ITEMS="stretch"
ALIGN_CONTENT="flex-start"

# Función para solicitar valores personalizados
get_custom_values() {
  echo "Introduce el tipo de display para div (por ejemplo, 'flex', 'block', 'inline-flex', etc.) [ENTER para valor por defecto: $GRID_DISPLAY]:"
  read -r input
  GRID_DISPLAY=${input:-$GRID_DISPLAY}

  echo "Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse') [ENTER para valor por defecto: $FLEX_DIRECTION]:"
  read -r input
  FLEX_DIRECTION=${input:-$FLEX_DIRECTION}

  echo "Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse') [ENTER para valor por defecto: $FLEX_WRAP]:"
  read -r input
  FLEX_WRAP=${input:-$FLEX_WRAP}

  echo "Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around') [ENTER para valor por defecto: $JUSTIFY_CONTENT]:"
  read -r input
  JUSTIFY_CONTENT=${input:-$JUSTIFY_CONTENT}

  echo "Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline') [ENTER para valor por defecto: $ALIGN_ITEMS]:"
  read -r input
  ALIGN_ITEMS=${input:-$ALIGN_ITEMS}

  echo "Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch') [ENTER para valor por defecto: $ALIGN_CONTENT]:"
  read -r input
  ALIGN_CONTENT=${input:-$ALIGN_CONTENT}
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

# Mostrar menú
show_menu() {
  echo "Menú de Ejemplos de Flexbox:"
  echo "1. Ejemplo de Flexbox con dirección 'row'"
  echo "2. Ejemplo de Flexbox con dirección 'row-reverse'"
  echo "3. Ejemplo de Flexbox con dirección 'column'"
  echo "4. Ejemplo de Flexbox con dirección 'column-reverse'"
  echo "5. Ejemplo de Flexbox con personalización de valores"
  echo "6. Salir"
}

# Main script
while true; do
  show_menu
  read -p "Selecciona una opción: " OPTION

  case $OPTION in
    1)
      GRID_DISPLAY="flex"
      FLEX_DIRECTION="row"
      FLEX_WRAP="nowrap"
      JUSTIFY_CONTENT="flex-start"
      ALIGN_ITEMS="stretch"
      ALIGN_CONTENT="flex-start"
      generate_html
      ;;
    2)
      GRID_DISPLAY="flex"
      FLEX_DIRECTION="row-reverse"
      FLEX_WRAP="nowrap"
      JUSTIFY_CONTENT="flex-start"
      ALIGN_ITEMS="stretch"
      ALIGN_CONTENT="flex-start"
      generate_html
      ;;
    3)
      GRID_DISPLAY="flex"
      FLEX_DIRECTION="column"
      FLEX_WRAP="nowrap"
      JUSTIFY_CONTENT="flex-start"
      ALIGN_ITEMS="stretch"
      ALIGN_CONTENT="flex-start"
      generate_html
      ;;
    4)
      GRID_DISPLAY="flex"
      FLEX_DIRECTION="column-reverse"
      FLEX_WRAP="nowrap"
      JUSTIFY_CONTENT="flex-start"
      ALIGN_ITEMS="stretch"
      ALIGN_CONTENT="flex-start"
      generate_html
      ;;
    5)
      get_custom_values
      generate_html
      ;;
    6)
      exit 0
      ;;
    *)
      echo "Opción inválida. Introduce un número del 1 al 6."
      ;;
  esac
done
