#!/bin/bash

# Function to display options and their default values
show_options() {
  echo "Options available:"
  echo "1. Display for the grid container (Default value: grid)"
  echo "2. Grid-template-rows (Default value: <empty>)"
  echo "3. Grid-template-columns (Default value: <empty>)"
  echo "4. Justify-items (Possible values: start, end, center, stretch; Default value: start)"
  echo "5. Align-items (Possible values: start, end, center, stretch; Default value: start)"
  echo "6. Gap for cell spacing (Default value: <empty>)"
  echo "7. Height of the container (Default value: <empty>)"
  echo "8. Border style for the container (Possible values: 1px solid black, 2px dashed red, 3px dotted blue; Default value: 1px solid black)"
  echo "9. Background color for elements (Possible values: lightgray, #f0f0f0, rgba(200, 200, 200, 0.5); Default value: lightgray)"
  echo "10. Padding for elements (Default value: <empty>)"
  echo "11. Border style for elements (Possible values: 1px solid black, 2px dashed red, 3px dotted blue; Default value: 1px solid black)"
  echo "12. Margin for elements (Default value: <empty>)"
  echo "13. Container tag (Default value: div)"
  echo "14. Container class (Default value: <empty>)"
  echo "15. Element tag (Possible values: div, span, p; Default value: div)"
  echo "16. Element class (Default value: <empty>)"
  echo "17. Content for the first element (Default value: Element 1)"
  echo "18. Content for the second element (Default value: Element 2)"
  echo "19. Content for the third element (Default value: Element 3)"
}

# Function to handle the option selection
select_option() {
  read -rp "Choose an option (1-19): " choice
  while [[ $choice -lt 1 || $choice -gt 19 ]]; do
    read -rp "Please enter a valid number (1-19): " choice
  done

  case $choice in
    1)
      read -rp "Enter the value for 'display' for the grid container (Press Enter to use the default value 'grid'): " GRID_DISPLAY
      [[ -z $GRID_DISPLAY ]] && GRID_DISPLAY="grid"
      ;;
    2) read -rp "Enter the value for 'grid-template-rows': " GRID_TEMPLATE_ROWS ;;
    3) read -rp "Enter the value for 'grid-template-columns': " GRID_TEMPLATE_COLUMNS ;;
    4)
      echo "Possible values: start, end, center, stretch"
      read -rp "Choose 'justify-items' (1-4) (Press Enter to use the default value 'start'): " JUSTIFY_ITEMS
      [[ -z $JUSTIFY_ITEMS ]] && JUSTIFY_ITEMS="start"
      ;;
    5)
      echo "Possible values: start, end, center, stretch"
      read -rp "Choose 'align-items' (1-4) (Press Enter to use the default value 'start'): " ALIGN_ITEMS
      [[ -z $ALIGN_ITEMS ]] && ALIGN_ITEMS="start"
      ;;
    6) read -rp "Enter the value for 'gap' for cell spacing: " GRID_GAP ;;
    7) read -rp "Enter the height of the container: " CONTAINER_HEIGHT ;;
    8)
      echo "Possible values: 1px solid black, 2px dashed red, 3px dotted blue"
      read -rp "Choose the border style for the container (1-3) (Press Enter to use the default value '1px solid black'): " BORDER_STYLE
      [[ -z $BORDER_STYLE ]] && BORDER_STYLE="1px solid black"
      ;;
    9)
      echo "Possible values: lightgray, #f0f0f0, rgba(200, 200, 200, 0.5)"
      read -rp "Choose the background color for elements (1-3) (Press Enter to use the default value 'lightgray'): " BG_COLOR
      [[ -z $BG_COLOR ]] && BG_COLOR="lightgray"
      ;;
    10) read -rp "Enter the padding for elements: " PADDING ;;
    11)
      echo "Possible values: 1px solid black, 2px dashed red, 3px dotted blue"
      read -rp "Choose the border style for elements (1-3) (Press Enter to use the default value '1px solid black'): " ITEM_BORDER
      [[ -z $ITEM_BORDER ]] && ITEM_BORDER="1px solid black"
      ;;
    12) read -rp "Enter the margin for elements: " MARGIN ;;
    13) read -rp "Enter the tag for the container (Press Enter to use the default value 'div'): " CONTAINER_TAG
        [[ -z $CONTAINER_TAG ]] && CONTAINER_TAG="div"
      ;;
    14) read -rp "Enter the class for the container: " CONTAINER_CLASS ;;
    15)
      echo "Possible values: div, span, p"
      read -rp "Choose the tag for elements (1-3) (Press Enter to use the default value 'div'): " ITEM_TAG
      [[ -z $ITEM_TAG ]] && ITEM_TAG="div"
      ;;
    16) read -rp "Enter the class for elements: " ITEM_CLASS ;;
    17) read -rp "Enter the content for the first element (Press Enter to use the default value 'Element 1'): " ITEM_1_CONTENT
        [[ -z $ITEM_1_CONTENT ]] && ITEM_1_CONTENT="Element 1"
      ;;
    18) read -rp "Enter the content for the second element (Press Enter to use the default value 'Element 2'): " ITEM_2_CONTENT
        [[ -z $ITEM_2_CONTENT ]] && ITEM_2_CONTENT="Element 2"
      ;;
    19) read -rp "Enter the content for the third element (Press Enter to use the default value 'Element 3'): " ITEM_3_CONTENT
        [[ -z $ITEM_3_CONTENT ]] && ITEM_3_CONTENT="Element 3"
      ;;
  esac
}

# Function to generate the HTML file with customized CSS for the grid
generate_html() {
  cat <<EOF >grid_example.html
<!DOCTYPE html>
<html>
<head>
<style>
/* Styles based on the provided inputs */
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
  show_options
  select_option
  generate_html
  echo "HTML file generated as 'grid_example.html'. Press Enter to continue."
  read -r
done
