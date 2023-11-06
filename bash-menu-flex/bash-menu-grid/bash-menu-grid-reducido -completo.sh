#!/bin/bash

# Función para solicitar valores personalizados
get_custom_values() {
  echo "Introduce el valor de 'display' para el contenedor grid ('grid', 'inline-grid', etc.):"
  read -r GRID_DISPLAY

  echo "Introduce el valor de 'grid-template-rows' (por ejemplo, '100px 100px', '1fr 2fr 1fr', etc.):"
  read -r GRID_TEMPLATE_ROWS

  echo "Introduce el valor de 'grid-template-columns' (por ejemplo, '1fr 2fr 1fr', 'repeat(3, 1fr)', etc.):"
  read -r GRID_TEMPLATE_COLUMNS

  echo "Introduce el valor de 'justify-items' ('start', 'end', 'center', 'stretch'):"
  read -r JUSTIFY_ITEMS

  echo "Introduce el valor de 'align-items' ('start', 'end', 'center', 'stretch'):"
  read -r ALIGN_ITEMS

  echo "Introduce el valor de 'gap' para los espacios entre celdas (por ejemplo, '10px', '1em', etc.):"
  read -r GRID_GAP

  echo "Introduce la altura del contenedor (por ejemplo, '300px', '50vh', '20em', etc.):"
  read -r CONTAINER_HEIGHT

  echo "Introduce el estilo del borde (por ejemplo, '1px solid black', '2px dashed red', etc.):"
  read -r BORDER_STYLE

  echo "Introduce el color de fondo para los elementos (por ejemplo, 'lightgray', '#f0f0f0', 'rgba(200, 200, 200, 0.5)', etc.):"
  read -r BG_COLOR

  echo "Introduce el padding para los elementos (por ejemplo, '10px', '1em', etc.):"
  read -r PADDING

  echo "Introduce el estilo del borde para los elementos (por ejemplo, '1px solid black', '2px dashed red', etc.):"
  read -r ITEM_BORDER

  echo "Introduce el margen para los elementos (por ejemplo, '5px', '2em', etc.):"
  read -r MARGIN

  echo "Introduce la etiqueta del contenedor ('div', 'section', 'main', etc.):"
  read -r CONTAINER_TAG

  echo "Introduce la clase del contenedor ('grid-container', 'custom-container', etc.):"
  read -r CONTAINER_CLASS

  echo "Introduce la etiqueta de los elementos ('div', 'span', 'p', etc.):"
  read -r ITEM_TAG

  echo "Introduce la clase de los elementos ('grid-item', 'custom-item', etc.):"
  read -r ITEM_CLASS

  echo "Introduce el contenido del primer elemento:"
  read -r ITEM_1_CONTENT

  echo "Introduce el contenido del segundo elemento:"
  read -r ITEM_2_CONTENT

  echo "Introduce el contenido del tercer elemento:"
  read -r ITEM_3_CONTENT
}

# Función para generar el archivo HTML con CSS personalizado para Grid
generate_html() {
  cat <<EOF >grid_example.html
<!DOCTYPE html>
<html>
<head>
<style>
.${CONTAINER_CLASS} {
  display: $GRID_DISPLAY;
  grid-template-rows: $GRID_TEMPLATE_ROWS;
  grid-template-columns: $GRID_TEMPLATE_COLUMNS;
  justify-items: $JUSTIFY_ITEMS;
  align-items: $ALIGN_ITEMS;
  gap: $GRID_GAP;
  height: $CONTAINER_HEIGHT; /* Ajusta la altura según sea necesario */
  border: $BORDER_STYLE; /* Agrega un borde para visualizar el contenedor */
}

.${ITEM_CLASS} {
  background-color: $BG_COLOR; /* Color de fondo de los elementos */
  padding: $PADDING; /* Padding de los elementos */
  border: $ITEM_BORDER; /* Estilo del borde para los elementos */
  margin: $MARGIN; /* Margen de los elementos */
}
</style>
</head>
<body>
<$CONTAINER_TAG class="$CONTAINER_CLASS">
  <$ITEM_TAG class="$ITEM_CLASS">$ITEM_1_CONTENT</$ITEM_TAG>
  <$ITEM_TAG class="$ITEM_CLASS">$ITEM_2_CONTENT</$ITEM_TAG>
  <$ITEM_TAG class="$ITEM_CLASS">$ITEM_3_CONTENT</$ITEM_TAG>
</$CONTAINER_TAG>
</body>
</html>
EOF
}

while true; do
  get_custom_values
  generate_html
  echo "Archivo HTML generado como 'grid_example.html'. Presiona Enter para continuar."
  read -r
done
