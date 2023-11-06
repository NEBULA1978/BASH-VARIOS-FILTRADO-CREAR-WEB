#!/bin/bash

# Función para solicitar valores personalizados
get_custom_values() {
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
  display: grid;
  grid-template-rows: 1fr 1fr 1fr;
  grid-template-columns: 1fr 1fr 1fr;
  justify-items: center;
  align-items: center;
  gap: 10px;
  height: 300px; /* Ajusta la altura según sea necesario */
  border: 1px solid black; /* Agrega un borde para visualizar el contenedor */
}

.${ITEM_CLASS} {
  background-color: lightgray; /* Color de fondo de los elementos */
  padding: 10px;
  border: 1px solid #000;
  margin: 5px;
}
</style>
</head>
<body>
<${CONTAINER_TAG} class="${CONTAINER_CLASS}">
  <${ITEM_TAG} class="${ITEM_CLASS}">${ITEM_1_CONTENT}</${ITEM_TAG}>
  <${ITEM_TAG} class="${ITEM_CLASS}">${ITEM_2_CONTENT}</${ITEM_TAG}>
  <${ITEM_TAG} class="${ITEM_CLASS}">${ITEM_3_CONTENT}</${ITEM_TAG}>
</${CONTAINER_TAG}>
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
