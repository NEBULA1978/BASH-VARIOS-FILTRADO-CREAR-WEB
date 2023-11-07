#!/bin/bash

declare -a OPTIONS=(
  "Introduce el tipo de display para el contenedor (por ejemplo, 'flex', 'block', 'inline-flex', etc.):"
  "Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse'):"
  "Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse'):"
  "Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around'):"
  "Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline'):"
  "Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch'):"
  "Introduce el ancho de los elementos flexibles (por ejemplo, '100px', '50%', etc.):"
  "Introduce la altura de los elementos flexibles (por ejemplo, '100px', '50%', etc.):"
  "Introduce el margen entre los elementos flexibles (por ejemplo, '10px', '1em', etc.):"
  "Introduce el color de fondo de los elementos flexibles (por ejemplo, 'lightgray', '#f0f0f0', 'rgba(200, 200, 200, 0.5)', etc.):"
  "Introduce el ancho del elemento centrado (por ejemplo, '100px', '50%', etc.):"
  "Introduce la altura del elemento centrado (por ejemplo, '100px', '50%', etc.):"
  "Introduce el color de fondo del elemento centrado (por ejemplo, 'lightblue', '#ccc', etc.):"
  "Introduce la etiqueta del contenedor ('div', 'section', 'main', etc.):"
  "Introduce la clase del contenedor:"
  "Introduce la etiqueta de los elementos ('div', 'span', 'p', etc.):"
  "Introduce la clase de los elementos:"
  "Introduce el contenido del primer elemento:"
  "Introduce el contenido del segundo elemento:"
  "Introduce el contenido del elemento centrado:"
)

# Variables inicializadas con valores por defecto
GRID_DISPLAY="flex"
FLEX_DIRECTION="row"
FLEX_WRAP="nowrap"
JUSTIFY_CONTENT="flex-start"
ALIGN_ITEMS="stretch"
ALIGN_CONTENT="flex-start"
ITEM_WIDTH="100px"
ITEM_HEIGHT="100px"
ITEM_MARGIN="10px"
ITEM_BG_COLOR="lightgray"
CENTERED_BOX_WIDTH="100px"
CENTERED_BOX_HEIGHT="100px"
CENTERED_BOX_BG_COLOR="lightblue"
CONTAINER_TAG="div"
CONTAINER_CLASS="flex-container"
ITEM_TAG="div"
ITEM_CLASS="flex-item"
CENTERED_BOX_TAG="div"
CENTERED_BOX_CLASS="centered-box"
ITEM_1_CONTENT="1"
ITEM_2_CONTENT="2"
CENTERED_CONTENT="Centered"

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
      2) FLEX_DIRECTION=$USER_INPUT ;;
      3) FLEX_WRAP=$USER_INPUT ;;
      4) JUSTIFY_CONTENT=$USER_INPUT ;;
      5) ALIGN_ITEMS=$USER_INPUT ;;
      6) ALIGN_CONTENT=$USER_INPUT ;;
      7) ITEM_WIDTH=$USER_INPUT ;;
      8) ITEM_HEIGHT=$USER_INPUT ;;
      9) ITEM_MARGIN=$USER_INPUT ;;
      10) ITEM_BG_COLOR=$USER_INPUT ;;
      11) CENTERED_BOX_WIDTH=$USER_INPUT ;;
      12) CENTERED_BOX_HEIGHT=$USER_INPUT ;;
      13) CENTERED_BOX_BG_COLOR=$USER_INPUT ;;
      14) CONTAINER_TAG=$USER_INPUT ;;
      15) CONTAINER_CLASS=$USER_INPUT ;;
      16) ITEM_TAG=$USER_INPUT ;;
      17) ITEM_CLASS=$USER_INPUT ;;
      18) ITEM_1_CONTENT=$USER_INPUT ;;
      19) ITEM_2_CONTENT=$USER_INPUT ;;
      20) CENTERED_CONTENT=$USER_INPUT ;;
    esac

    generate_html
    echo "Archivo HTML generado como 'flexbox_example.html'. Presiona Enter para continuar o Ctrl+C para salir."
    read -r
  else
    echo "Opción inválida."
  fi
}

# Función para generar el archivo HTML con CSS personalizado
generate_html() {
  cat <<EOF >flexbox_example.html
<!DOCTYPE html>
<html>
<head>
<style>
.${CONTAINER_CLASS} {
  display: $GRID_DISPLAY;
  flex-direction: $FLEX_DIRECTION;
  flex-wrap: $FLEX_WRAP;
  justify-content: $JUSTIFY_CONTENT;
  align-items: $ALIGN_ITEMS;
  align-content: $ALIGN_CONTENT;
  height: 300px; /* Ajusta la altura según sea necesario */
  border: 1px solid black; /* Agrega un borde para visualizar el contenedor */
}

.${ITEM_CLASS} {
  width: $ITEM_WIDTH;
  height: $ITEM_HEIGHT;
  margin: $ITEM_MARGIN;
  background-color: $ITEM_BG_COLOR;
}

.${CENTERED_BOX_CLASS} {
  width: $CENTERED_BOX_WIDTH;
  height: $CENTERED_BOX_HEIGHT;
  background-color: $CENTERED_BOX_BG_COLOR;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
</head>
<body>
<$CONTAINER_TAG class="$CONTAINER_CLASS">
  <$ITEM_TAG class="$ITEM_CLASS">$ITEM_1_CONTENT</$ITEM_TAG>
  <$ITEM_TAG class="$ITEM_CLASS">$ITEM_2_CONTENT</$ITEM_TAG>
  <$CENTERED_BOX_TAG class="$CENTERED_BOX_CLASS">$CENTERED_CONTENT</$CENTERED_BOX_TAG>
</$CONTAINER_TAG>
</body>
</html>
EOF

  echo "Archivo HTML generado como 'flexbox_example.html'."
}

# Main script
get_custom_values
generate_html
