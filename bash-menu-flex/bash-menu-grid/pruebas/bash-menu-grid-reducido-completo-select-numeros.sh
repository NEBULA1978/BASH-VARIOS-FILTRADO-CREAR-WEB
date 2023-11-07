#!/bin/bash

# Función para solicitar valores personalizados
get_custom_values() {
  echo "1. Introduce el valor de 'display' para el contenedor grid ('grid', 'inline-grid', etc.):"
  read -r GRID_DISPLAY

  echo "2. Introduce el valor de 'grid-template-rows' (por ejemplo, '100px 100px', '1fr 2fr 1fr', etc.):"
  read -r GRID_TEMPLATE_ROWS

  echo "3. Introduce el valor de 'grid-template-columns' (por ejemplo, '1fr 2fr 1fr', 'repeat(3, 1fr)', etc.):"
  read -r GRID_TEMPLATE_COLUMNS

  echo "4. Introduce el valor de 'justify-items' ('start', 'end', 'center', 'stretch'):"
  read -r JUSTIFY_ITEMS

  echo "5. Introduce el valor de 'align-items' ('start', 'end', 'center', 'stretch'):"
  read -r ALIGN_ITEMS

  echo "6. Introduce el valor de 'gap' para los espacios entre celdas (por ejemplo, '10px', '1em', etc.):"
  read -r GRID_GAP

  echo "7. Introduce la altura del contenedor (por ejemplo, '300px', '50vh', '20em', etc.):"
  read -r CONTAINER_HEIGHT

  echo "8. Introduce el estilo del borde (por ejemplo, '1px solid black', '2px dashed red', etc.):"
  read -r BORDER_STYLE

  echo "9. Introduce el color de fondo para los elementos (por ejemplo, 'lightgray', '#f0f0f0', 'rgba(200, 200, 200, 0.5)', etc.):"
  read -r BG_COLOR

  echo "10. Introduce el padding para los elementos (por ejemplo, '10px', '1em', etc.):"
  read -r PADDING

  echo "11. Introduce el estilo del borde para los elementos (por ejemplo, '1px solid black', '2px dashed red', etc.):"
  read -r ITEM_BORDER

  echo "12. Introduce el margen para los elementos (por ejemplo, '5px', '2em', etc.):"
  read -r MARGIN

  echo "13. Introduce la etiqueta del contenedor ('div', 'section', 'main', etc.):"
  read -r CONTAINER_TAG

  echo "14. Introduce la clase del contenedor ('grid-container', 'custom-container', etc.):"
  read -r CONTAINER_CLASS

  echo "15. Introduce la etiqueta de los elementos ('div', 'span', 'p', etc.):"
  read -r ITEM_TAG

  echo "16. Introduce la clase de los elementos ('grid-item', 'custom-item', etc.):"
  read -r ITEM_CLASS

  echo "17. Introduce el contenido del primer elemento:"
  read -r ITEM_1_CONTENT

  echo "18. Introduce el contenido del segundo elemento:"
  read -r ITEM_2_CONTENT

  echo "19. Introduce el contenido del tercer elemento:"
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
  height: $CONTAINER_HEIGHT;
  border: $BORDER_STYLE;
}

.${ITEM_CLASS} {
  background-color: $BG_COLOR;
  padding: $PADDING;
  border: $ITEM_BORDER;
  margin: $MARGIN;
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
