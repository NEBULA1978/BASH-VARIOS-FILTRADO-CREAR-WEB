#!/bin/bash

# Supongamos que el archivo de texto se llama "nombres.txt" y contiene los siguientes nombres:
# hola
# adios
# aloa

# Leemos el archivo de texto y guardamos cada uno de los nombres en una lista
nombres=()
while IFS= read -r line; do
    nombres+=("$line")
done < "nombres.txt"

# Recorremos la lista de nombres y añadimos el prefijo delante de cada uno de ellos
for i in "${!nombres[@]}"; do
    echo "echo \"$((i + 1)). ${nombres[i]}\"" >> nombres2.txt
done
