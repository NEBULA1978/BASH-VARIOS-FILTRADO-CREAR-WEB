#!/bin/bash

declare -a OPTIONS=(
  "Introduce el valor de 'display' para el contenedor grid ('grid', 'inline-grid', etc.):"
  "Introduce el valor de 'grid-template-rows' (por ejemplo, '100px 100px', '1fr 2fr 1fr', etc.):"
  "Introduce el valor de 'grid-template-columns' (por ejemplo, '1fr 2fr 1fr', 'repeat(3, 1fr)', etc.):"
  "Introduce el valor de 'justify-items' ('start', 'end', 'center', 'stretch'):"
  "Introduce el valor de 'align-items' ('start', 'end', 'center', 'stretch'):"
  "Introduce el valor de 'gap' para los espacios entre celdas (por ejemplo, '10px', '1em', etc.):"
  "Introduce la altura del contenedor (por ejemplo, '300px', '50vh', '20em', etc.):"
  "Introduce el estilo del borde (por ejemplo, '1px solid black', '2px dashed red', etc.):"
  "Introduce el color de fondo para los elementos (por ejemplo, 'lightgray', '#f0f0f0', 'rgba(200, 200, 200, 0.5)', etc.):"
  "Introduce el padding para los elementos (por ejemplo, '10px', '1em', etc.):"
  "Introduce el estilo del borde para los elementos (por ejemplo, '1px solid black', '2px dashed red', etc.):"
  "Introduce el margen para los elementos (por ejemplo, '5px', '2em', etc.):"
  "Introduce la etiqueta del contenedor ('div', 'section', 'main', etc.):"
  "Introduce la clase del contenedor ('grid-container', 'custom-container', etc.):"
  "Introduce la etiqueta de los elementos ('div', 'span', 'p', etc.):"
  "Introduce la clase de los elementos ('grid-item', 'custom-item', etc.):"
  "Introduce el contenido del primer elemento:"
  "Introduce el contenido del segundo elemento:"
  "Introduce el contenido del tercer elemento:"
)

# Variables inicializadas con valores por defecto
GRID_DISPLAY="grid"
GRID_TEMPLATE_ROWS="1fr 1fr"
GRID_TEMPLATE_COLUMNS="1fr 1fr"
JUSTIFY_ITEMS="center"
ALIGN_ITEMS="center"
GRID_GAP="10px"
CONTAINER_HEIGHT="300px"
BORDER_STYLE="1px solid black"
BG_COLOR="lightgray"
PADDING="10px"
ITEM_BORDER="1px solid black"
MARGIN="5px"
CONTAINER_TAG="div"
CONTAINER_CLASS="grid-container"
ITEM_TAG="div"
ITEM_CLASS="grid-item"
ITEM_1_CONTENT="Elemento 1"
ITEM_2_CONTENT="Elemento 2"
ITEM_3_CONTENT="Elemento 3"

# Función para solicitar valores personalizados
get_custom_values() {
  for i in "${!OPTIONS[@]}"; do
    echo "$((i + 1)). ${OPTIONS[i]}"
  done

  read -rp "Elige el número de la opción que deseas cambiar: " OPTION_NUM
  if [[ $OPTION_NUM -ge 1 && $OPTION_NUM -le ${#OPTIONS[@]} ]]; then
    read -rp "${OPTIONS[OPTION_NUM - 1]}" USER_INPUT

    case $OPTION_NUM in
      1) GRID_DISPLAY=$USER_INPUT ;;
      2) GRID_TEMPLATE_ROWS=$USER_INPUT ;;
      3) GRID_TEMPLATE_COLUMNS=$USER_INPUT ;;
      4) JUSTIFY_ITEMS=$USER_INPUT ;;
      5) ALIGN_ITEMS=$USER_INPUT ;;
      6) GRID_GAP=$USER_INPUT ;;
      7) CONTAINER_HEIGHT=$USER_INPUT ;;
      8) BORDER_STYLE=$USER_INPUT ;;
      9) BG_COLOR=$USER_INPUT ;;
      10) PADDING=$USER_INPUT ;;
      11) ITEM_BORDER=$USER_INPUT ;;
      12) MARGIN=$USER_INPUT ;;
      13) CONTAINER_TAG=$USER_INPUT ;;
      14) CONTAINER_CLASS=$USER_INPUT ;;
      15) ITEM_TAG=$USER_INPUT ;;
      16) ITEM_CLASS=$USER_INPUT ;;
      17) ITEM_1_CONTENT=$USER_INPUT ;;
      18) ITEM_2_CONTENT=$USER_INPUT ;;
      19) ITEM_3_CONTENT=$USER_INPUT ;;
    esac

    generate_html
    echo "Archivo HTML generado como 'grid_example.html'. Presiona Enter para continuar o Ctrl+C para salir."
    read -r
  else
    echo "Opción inválida."
  fi
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

get_custom_values
