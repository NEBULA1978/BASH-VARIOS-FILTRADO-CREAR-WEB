#!/bin/bash

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"

# ========================================================================
#  FUNCIONES
# ========================================================================

function controlC() {
  echo -e "\n\n${redColour}[!] Exiting... ${endColour}\n"
  tput cnorm && exit 1
}

trap controlC INT

# VARIABLES GLOBALES
main_url="https://htbmachines.github.io/bundle.js"

function helpPanel() {
  echo -e "\n${yellowColour}[*]${endColour} Usage: ./html-machines.github34.sh"
  echo -e "\n\t${purpleColour}u)${endColour} Download or update necessary files"
  echo -e "\n\t${purpleColour}m)${endColour} Search mode of name machine"
  echo -e "\t${purpleColour}i)${endColour} Buscar por direccion IP"
  echo -e "\t${purpleColour}y)${endColour} Obtener link de la resolucion e la maquina en youtube"
  echo -e "\t${purpleColour}h)${endColour} Show this help panel\n"
  exit 0
}

function updatefiles() {
  # echo -e "\n\t${purpleColour}u)${endColour}${yellowColour} Comprobando si Hay actualizaciones${endColour}"

  # sleep 2

  # Si el archivo no existe me lo descargas
  if [ ! -f bundle.js ]; then
    clear
    tput civis
    echo -e "\n\t${purpleColour}u)${endColour}${yellowColour} Comprobando si Hay actualizaciones${endColour}"

    echo -e "\n\t${purpleColour}u)${endColour} Descargando archivos necesarios"
    curl -s $main_url >bundle.js
    js-beautify bundle.js | sponge bundle.js
    echo -e "\n\t${purpleColour}u)${endColour} Todos los archivos Descargados\n"
    # echo "El archivo existe"
    tput cnorm
  else
    tput civis
    echo -e "\n\t${purpleColour}u)${endColour}${yellowColour}Comprobando si hay actualizaciones pendientes${endColour}"
    curl -s $main_url >bundle_temp.js
    js-beautify bundle_temp.js | sponge bundle_temp.js
    md5_temp_value=$(md5sum bundle_temp.js | awk '{print $1}')
    md5_original_value=$(md5sum bundle.js | awk '{print $1}')

    # echo $md5_temp_value
    # echo $md5_original_value
    if [ "$md5_temp_value" == "$md5_original_value" ]; then
      echo -e "\n\t${purpleColour}u)${endColour}${yellowColour} [*] No hay actualizaciones detectadas esta todo al dia${endColour}"

      # Borra bundle.js y bundle_temp.js lo conviertas en bundle.js
      rm bundle.js && mv bundle_temp.js bundle.js

      echo -e "\n\t${purpleColour}u)${endColour}${yellowColour} [*] Los archivos han sido actualizados${endColour}"
    fi

    tput cnorm

  fi
}

function searchMachine() {
  machineName="$1"
  echo -e "\n\t${purpleColour}u)${endColour}${yellowColour} [*] Listando las propiedades de la maquina ${endColour}${yellowColour}$machineName${endColour}${purpleColour}:${endColour}\n"

  cat bundle.js | awk '/name: "'"${machineName}"'"/,/resuelta/' | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//'

  # Para ver la linea de youtube solo
  
  # cat bundle.js | awk "/name: \"Tentacle\"/,/resuelta/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//' | grep "youtube" | awk  'NF{print $NF}'

  # ERROR
  # cat bundle.js | awk "/name: "${ machineName }"/,/resuelta/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//'
}

function searchhIP() {
  ipAddress="$1"
  echo -e "\n\t${purpleColour}i)${endColour}${yellowColour} [*] La IP es $ipAddress${endColour}\n"

  machineName="$(cat bundle.js | grep "ip: \"$ipAddress\"" -B 3 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',')"

  echo -e "\n\t${purpleColour}[*])${endColour}${yellowColour} [*] La maquina correspondiente para la IP $ipAddress es $machineName${endColour}\n"

  # searchMachine $machineName

}
# cat bundle.js: muestra el contenido del archivo bundle.js
# grep "ip:\"10.10.11.139\"" -B 3: busca la línea que contiene ip:\"10.10.11.139\" y muestra tres líneas antes
# grep "name:": busca las líneas que contienen name:
# awk 'NF{print $NF}': muestra el último campo de cada línea
# tr -d '"': elimina todas las comillas dobles (") de la salida
# tr -d ',': elimina todas las comas (,) de la salida

function getYoutubeLink() {
  echo "Obtener enlace de youtube"
}

# ===============================================================
# FIN FUNCIONES
# ===============================================================

# INDICADORES
declare -i parameter_counter=0

while getopts "m:ui:y:h" arg; do
  case $arg in
  m)
    machineName="$OPTARG"
    let parameter_counter+=1
    ;;
  u)
    let parameter_counter+=2
    ;;
  i)
    ipAddress="$OPTARG"
    let parameter_counter+=3
    ;;
  y)
    machineName="$OPTARG"
    searchMachinelet=$OPTARG
    parameter_counter+=4
    ;;
  h) ;;
  esac
done

if [ $parameter_counter -eq 1 ]; then
  updatefiles
  searchMachine $machineName

elif [ $parameter_counter -eq 2 ]; then
  updatefiles
  # SI $parameter_counter vale 3 es que he puesto i, entramos aqui
elif [ $parameter_counter -eq 3 ]; then
  searchhIP $ipAddress
elif [ $parameter_counter -eq 4 ]; then
  getYoutubeLink $machine
else
  helpPanel
fi

exit 0
