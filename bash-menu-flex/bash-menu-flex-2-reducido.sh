#!/bin/bash

declare -a OPTIONS=(
  "Introduce el tipo de display para div (por ejemplo, 'flex', 'block', 'inline-flex', etc.):"
  "Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse'):"
  "Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse'):"
  "Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around'):"
  "Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline'):"
  "Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch'):"
)

# Variables inicializadas con valores por defecto
GRID_DISPLAY="flex"
FLEX_DIRECTION="row"
FLEX_WRAP="nowrap"
JUSTIFY_CONTENT="flex-start"
ALIGN_ITEMS="stretch"
ALIGN_CONTENT="flex-start"

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
