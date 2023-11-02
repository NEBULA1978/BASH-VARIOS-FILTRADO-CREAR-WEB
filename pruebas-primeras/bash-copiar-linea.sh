#!/bin/bash





sed -e '7i' -e "$(sed -n '6{p;q}' texto-buscar.txt)" texto-introducir.txt > texto-introducir-temp.txt && mv texto-introducir-temp.txt texto-introducir.txt

# Este script extraerá la sexta línea de texto-buscar.txt e la insertará en la séptima línea de texto-introducir.txt. Emplea la bandera -i en sed para modificar el archivo directamente sin necesidad de un archivo temporal.