#!/bin/bash

declare -A options
default_options=(
  [GRID_DISPLAY]="grid"
  [GRID_TEMPLATE_ROWS]="<empty>"
  [GRID_TEMPLATE_COLUMNS]="<empty>"
  [JUSTIFY_ITEMS]="start"
  [ALIGN_ITEMS]="start"
  [GRID_GAP]="<empty>"
  [CONTAINER_HEIGHT]="<empty>"
  [BORDER_STYLE]="1px solid black"
  [BG_COLOR]="lightgray"
  [PADDING]="<empty>"
  [ITEM_BORDER]="1px solid black"
  [MARGIN]="<empty>"
  [CONTAINER_TAG]="div"
  [CONTAINER_CLASS]="<empty>"
  [ITEM_TAG]="div"
  [ITEM_CLASS]="<empty>"
  [ITEM_1_CONTENT]="Element 1"
  [ITEM_2_CONTENT]="Element 2"
  [ITEM_3_CONTENT]="Element 3"
)

for key in "${!default_options[@]}"; do
  options[$key]=${default_options[$key]}
done

# Function to display options and their default values
show_options() {
  echo "Options available:"
  for key in "${!options[@]}"; do
    echo "$key. ${key//_/-} (Default value: ${options[$key]})"
  done
}

# Function to handle the option selection
select_option() {
  read -rp "Choose an option (1-${#options[@]}): " choice
  while [[ $choice -lt 1 || $choice -gt ${#options[@]} ]]; do
    read -rp "Please enter a valid number (1-${#options[@]}): " choice
  done

  current_option_name=$(echo "${!options[@]}" | cut -d ' ' -f $choice)

  echo "Enter new value for '${current_option_name//-/_}' (Press Enter to keep the default value '${options[$current_option_name]}'): "
  read -r value

  if [[ -n $value ]]; then
    options[$current_option_name]=$value
  fi
}

# Function to generate the HTML file with customized CSS for the grid
generate_html() {
  cat <<EOF >grid_example.html
<!DOCTYPE html>
<html>
<head>
<style>
/* Styles based on the provided inputs */
.${options[CONTAINER_CLASS]:-"container"} {
  display: ${options[GRID_DISPLAY]:-"grid"};
  grid-template-rows: ${options[GRID_TEMPLATE_ROWS]:-""};
  grid-template-columns: ${options[GRID_TEMPLATE_COLUMNS]:-""};
  justify-items: ${options[JUSTIFY_ITEMS]:-"start"};
  align-items: ${options[ALIGN_ITEMS]:-"start"};
  gap: ${options[GRID_GAP]:-""};
  height: ${options[CONTAINER_HEIGHT]:-""};
  border: ${options[BORDER_STYLE]:-"1px solid black"};
}

.${options[ITEM_CLASS]:-"item"} {
  background-color: ${options[BG_COLOR]:-"lightgray"};
  padding: ${options[PADDING]:-""};
  border: ${options[ITEM_BORDER]:-"1px solid black"};
  margin: ${options[MARGIN]:-""};
}
</style>
</head>
<body>
<${options[CONTAINER_TAG]:-"div"} class="${options[CONTAINER_CLASS]:-"container"}">
  <${options[ITEM_TAG]:-"div"} class="${options[ITEM_CLASS]:-"item"}">${options[ITEM_1_CONTENT]:-"Element 1"}</${options[ITEM_TAG]:-"div"}>
  <${options[ITEM_TAG]:-"div"} class="${options[ITEM_CLASS]:-"item"}">${options[ITEM_2_CONTENT]:-"Element 2"}</${options[ITEM_TAG]:-"div"}>
  <${options[ITEM_TAG]:-"div"} class="${options[ITEM_CLASS]:-"item"}">${options[ITEM_3_CONTENT]:-"Element 3"}</${options[ITEM_TAG]:-"div"}>
</${options[CONTAINER_TAG]:-"div"}>
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
