#!/bin/bash

sed -e '7i\' -e "$(sed -n '6{p;q}' texto-buscar.txt)" texto-introducir.txt > texto-introducir-temp.txt && mv texto-introducir-temp.txt texto-introducir.txt

