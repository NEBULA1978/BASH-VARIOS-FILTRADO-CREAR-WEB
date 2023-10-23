#!/bin/bash

# Función para solicitar valores personalizados
get_custom_values() {
  echo "Introduce el tipo de display para div (por ejemplo, 'flex', 'block', 'inline-flex', etc.):"
  read -r GRID_DISPLAY

  echo "Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse'):"
  read -r FLEX_DIRECTION

  echo "Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse'):"
  read -r FLEX_WRAP

  echo "Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around'):"
  read -r JUSTIFY_CONTENT

  echo "Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline'):"
  read -r ALIGN_ITEMS

  echo "Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch'):"
  read -r ALIGN_CONTENT
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
</style>
</head>
<body>
<div class="flex-container">
  <div class="flex-item">1</div>
  <div class="flex-item">2</div>
  <div class="flex-item">3</div>
</div>
</body>
</html>
EOF
}

while true; do
  clear
  echo "Menú de Ejemplos de Flexbox:"
  echo "1. Ejemplo de Flexbox con dirección 'row'"
  echo "   - Elementos colocados horizontalmente de izquierda a derecha."
  echo "2. Ejemplo de Flexbox con dirección 'row-reverse'"
  echo "   - Elementos colocados horizontalmente de derecha a izquierda."
  echo "3. Ejemplo de Flexbox con dirección 'column'"
  echo "   - Elementos colocados verticalmente de arriba abajo."
  echo "4. Ejemplo de Flexbox con dirección 'column-reverse'"
  echo "   - Elementos colocados verticalmente de abajo arriba."
  echo "5. Ejemplo de Flexbox con personalización de valores"
  echo "   - Puedes configurar los valores de Flexbox a tu elección."
  echo "6. Ejemplo de Flexbox con display 'inline-flex'"
  echo "   - Contenedor en línea con elementos flexibles."
  echo "7. Otra opción adicional"
  echo "8. Otra opción adicional 2"
  echo "9. Salir"

  read -n 1 -r OPTION
  echo ""  # Agrega un salto de línea para que la siguiente salida no se mezcle

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
      GRID_DISPLAY="inline-flex"
      FLEX_DIRECTION="row"
      FLEX_WRAP="nowrap"
      JUSTIFY_CONTENT="flex-start"
      ALIGN_ITEMS="stretch"
      ALIGN_CONTENT="flex-start"
      generate_html
      ;;

    7)
      echo "Has seleccionado la opción 7."
      # Agrega aquí la acción que deseas para la opción 7
      
      ;;

    8)
      echo "Has seleccionado la opción 8."
      # Agrega aquí la acción que deseas para la opción 8

      ;;

    9)
      exit 0
      ;;

    *)
      echo "Opción inválida. Introduce un número del 1 al 9."
      ;;
  esac

  echo "Archivo HTML generado como 'flexbox_example.html'. Presiona Enter para continuar."
  read -r
done