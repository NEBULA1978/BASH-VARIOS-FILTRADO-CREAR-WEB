#!/bin/bash

# Puedes utilizar el comando awk en Bash para mostrar las 27 líneas de un archivo de texto. Aquí tienes un ejemplo de cómo hacerlo:
awk 'NR <= 27' texto-buscar.txt

# Respuesta consola

# Saltar al contenido
# geekland Blog de Tecnología
# Contacto Indice El Autor Buscar
# Twitter
 
# Reddit
 
# RSS
 
# Telegram
# USo del comando awk en Linux y Unix
# Uso del comando AWK en Linux y UNIX con ejemplos
# Publicado porJoan Carles
# 10 octubre, 2021
# 2 comentariosen Uso del comando AWK en Linux y UNIX con ejemplos
# Home » Linux » Explicación y ejemplos de uso del comando awk

# Hace unas semanas vimos con bastante profundidad y con ejemplos el uso que podíamos dar a la utilidad Sed. Ahora ha llegado el momento de hacer lo mismo pero esta vez con el comando Awk. Como ya dije en su día, si queréis empezar a programar scripts es esencial tener un conocimiento básico de herramientas como sed, awk, grep, cut, etc.

# ¿QUÉ NOS PERMITE REALIZAR EL COMANDO AWK?
# Los usos básicos que podemos dar al comando Awk son los siguientes:

# Buscar palabras y patrones de palabras y reemplazarlos por otras palabras y/o patrones.
# Hacer operaciones matemáticas.
# Procesar texto y mostrar las líneas y columnas que cumplen con determinadas condiciones.
# Etc.
# Nota: En términos generales el comando awk permite procesar y modificar el texto según nuestras necesidades.

awk 'NR <= 27' texto-buscar.txt | awk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27}' 

# Respuesta consola

# Saltar al contenido                        
# geekland Blog de Tecnología                       
# Contacto Indice El Autor Buscar                      
# Twitter                          
                          
# Reddit                          
                          
# RSS                          
                          
# Telegram                          
# USo del comando awk en Linux y Unix                   
# Uso del comando AWK en Linux y UNIX con ejemplos                 
# Publicado porJoan Carles                        
# 10 octubre, 2021                        
# 2 comentariosen Uso del comando AWK en Linux y UNIX con ejemplos               
# Home » Linux » Explicación y ejemplos de uso del comando awk               
                          
# Hace unas semanas vimos con bastante profundidad y con ejemplos el uso que podíamos dar a la utilidad Sed. Ahora ha llegado el momento de hacer lo
                          
# ¿QUÉ NOS PERMITE REALIZAR EL COMANDO AWK?                    
# Los usos básicos que podemos dar al comando Awk son los siguientes:               
                          
# Buscar palabras y patrones de palabras y reemplazarlos por otras palabras y/o patrones.              
# Hacer operaciones matemáticas.                        
# Procesar texto y mostrar las líneas y columnas que cumplen con determinadas condiciones.              
# Etc.                          
# Nota: En términos generales el comando awk permite procesar y modificar el texto según nuestras necesidades.           


