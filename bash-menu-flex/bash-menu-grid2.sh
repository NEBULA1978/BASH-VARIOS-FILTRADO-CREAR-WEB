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
}

# Función para generar el archivo HTML con CSS personalizado para Grid
generate_html() {
  cat <<EOF >grid_example.html
<!DOCTYPE html>
<html>
<head>
<style>
.grid-container {
  display: $GRID_DISPLAY;
  grid-template-rows: $GRID_TEMPLATE_ROWS;
  grid-template-columns: $GRID_TEMPLATE_COLUMNS;
  justify-items: $JUSTIFY_ITEMS;
  align-items: $ALIGN_ITEMS;
  gap: $GRID_GAP;
  height: 300px; /* Ajusta la altura según sea necesario */
  border: 1px solid black; /* Agrega un borde para visualizar el contenedor */
}

.grid-item {
  background-color: lightgray; /* Color de fondo de los elementos */
}
</style>
</head>
<body>
<div class="grid-container">
  <div class="grid-item">1</div>
  <div class="grid-item">2</div>
  <div class="grid-item">3</div>
</div>
</body>
</html>
EOF
}

# Función para generar ejemplos predefinidos
generate_example() {
  GRID_DISPLAY=$1
  GRID_TEMPLATE_ROWS=$2
  GRID_TEMPLATE_COLUMNS=$3
  JUSTIFY_ITEMS=$4
  ALIGN_ITEMS=$5
  GRID_GAP=$6

  generate_html
}

while true; do
  clear
  echo "Menú de Ejemplos de CSS Grid:"
  echo "1. Ejemplo de Grid con valores predefinidos"
  echo "2. Ejemplo de Grid con valores predefinidos 2"
  echo "3. Ejemplo de Grid con valores predefinidos 3"
  echo "4. Ejemplo de Grid con valores predefinidos 4"
  echo "5. Ejemplo de Grid con personalización de valores"
  echo "6. Ejemplo de Grid en línea (inline-grid)"
  echo "7. Otra opción adicional"
  echo "8. Otra opción adicional 2"
  echo "9. Salir"

  read -n 1 -r OPTION
  echo ""  # Agrega un salto de línea para que la siguiente salida no se mezcle

case $OPTION in
    1)
      generate_example "grid" "1fr 1fr 1fr" "1fr 1fr 1fr" "center" "center" "10px"
      ;;

    2)
      generate_example "grid" "50px 100px 50px" "1fr 2fr 1fr" "start" "end" "5px"
      ;;

    3)
      generate_example "grid" "100px 200px 100px" "repeat(3, 1fr)" "end" "center" "15px"
      ;;

    4)
      generate_example "grid" "200px 100px 200px" "1fr 2fr 1fr" "start" "stretch" "20px"
      ;;

    5)
      get_custom_values
      generate_html
      ;;

    6)
      generate_example "inline-grid" "1fr" "1fr 1fr 1fr" "center" "center" "10px"
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

  echo "Archivo HTML generado como 'grid_example.html'. Presiona Enter para continuar."
  read -r
done
