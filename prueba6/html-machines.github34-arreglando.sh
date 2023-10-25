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
  echo -e "\t${purpleColour}d)${endColour} Buscar por dificultad de una maquina"
  echo -e "\t${purpleColour}o)${endColour} Buscar por sistema operativo de la maquina"
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

      rm bundle_temp.js
    else
      echo -e "\n\t${purpleColour}u)${endColour}${yellowColour} [*] Se han encontrado actualizaciones disponibles${endColour}"

      sleep 1

      # Borra bundle.js y bundle_temp.js lo conviertas en bundle.js
      rm bundle.js && mv bundle_temp.js bundle.js

      echo -e "\n\t${purpleColour}u)${endColour}${yellowColour} [*] Los archivos han sido actualizados${endColour}"
    fi

    tput cnorm

  fi
}

function searchMachine() {
  machineName="$1"

  # Variable chivata
  machineName_checker="$(cat bundle.js | awk '/name: "'"${machineName}"'"/,/resuelta/' | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//')"

  # Si la variable esta vacia o no tiene contenido es que esa maquina no existe
  if [ "$machineName_checker" ]; then

    echo -e "\n\t${purpleColour}u)${endColour}${yellowColour} [*] Listando las propiedades de la maquina ${endColour}${yellowColour}$machineName${endColour}${purpleColour}:${endColour}\n"

    cat bundle.js | awk '/name: "'"${machineName}"'"/,/resuelta/' | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//'
  else
    echo -e "\n${redColour}[!] La maquina proporcionada no existe${endColour}\n"
  fi

  # Para ver la linea de youtube solo

  # cat bundle.js | awk "/name: \"Tentacle\"/,/resuelta/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//' | grep "youtube" | awk  'NF{print $NF}'

  # ERROR
  # cat bundle.js | awk "/name: "${ machineName }"/,/resuelta/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//'
}

function searchhIP() {
  ipAddress="$1"
  echo -e "\n\t${purpleColour}i)${endColour}${yellowColour} [*] La IP es $ipAddress${endColour}\n"

  machineName="$(cat bundle.js | grep "ip: \"$ipAddress\"" -B 3 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',')"
  # Si machineName tiene contenido es que la ha encontrado
  if [ "$machineName" ]; then
    echo -e "\n\t${purpleColour}[*])${endColour}${yellowColour} [*] La maquina correspondiente para la IP $ipAddress es $machineName${endColour}\n"
  # Sino la encuentra
  else
    echo -e "\n${redColour}[!] La direccion IP proporcionada no existe${endColour}\n"

  fi

  # searchMachine $machineName

}
# cat bundle.js: muestra el contenido del archivo bundle.js
# grep "ip:\"10.10.11.139\"" -B 3: busca la línea que contiene ip:\"10.10.11.139\" y muestra tres líneas antes
# grep "name:": busca las líneas que contienen name:
# awk 'NF{print $NF}': muestra el último campo de cada línea
# tr -d '"': elimina todas las comillas dobles (") de la salida
# tr -d ',': elimina todas las comas (,) de la salida

function YoutubeLink() {
  # echo "Obtener enlace de youtube"

  machineName="$1"

  youtubeLink="$(cat bundle.js | awk "/name: \"$machineName\"/,/resuelta:/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//' | grep youtube | awk 'NF{print $NF}' )"
  xdg-open "$youtubeLink" & disown
  sleep 1
  xdotool key --clearmodifiers "Return"
  # Comprobar si tiene valor la variable
  # echo "youtubeLink: $youtubeLink"

  # Si la variable youtubeLink tiene contenido entramos if
  if [ $youtubeLink ]; then
    echo -e "\n${greenColour}[!] El tutorial para esta maquina esta en este enlace: $youtubeLink${endColour}\n"
  # sino tiene contenido hacemos esto
  else
    echo -e "\n${redColour}[!] La maquina proporcionada no existe${endColour}\n"

  fi
}

function getmachinedifficulty(){
  difficulty="$1"

  results_check="$(cat bundle.js | grep "dificultad: \"$difficulty\"" -B 5 | grep "name:" | awk '{print $NF}' | tr -d '"' | tr -d ',' | column)"

  if [ "$results_check" ]; then
    echo -e "\n${greenColour}[!] Representando las maquinas que poseen un nivel de dificultad $difficulty\n"
    # echo "$result_check" | column -t
    cat bundle.js | grep "dificultad: \"$difficulty\"" -B 5 | grep "name:" | awk '{print $NF}' | tr -d '"' | tr -d ',' | column
  else
    echo -e "\n${redColour}[!] La dificultad proporcionada no existe${endColour}\n"
  fi
}

function getOSMachines(){
  os="$1"
  os_results="$(cat bundle.js | grep "so: \"$os\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column)"
  # echo "$os_results"
  if [ "$os_results" ]; then
    echo -e "\n${greenColour}[!] Mostrando las maquina cuyo sistema operativo es $os${endColour}\n"
    cat bundle.js | grep "so: \"$os\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column
  else
    echo -e "\n${redColour}[!] La dificultad del sistema operativo, no existe${endColour}\n"

  fi


}

function getOSDifficulteMachines(){
  difficulty="$1"
  os="$2"

  check_results="$(cat bundle.js | grep "so: \"$os\"" -C 4 | grep "dificultad: \"$difficulty\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',')"
  # Si check_results tiene contenido quiero que me hagas algo
  if [ check_results ]; then
    echo -e "\n${greenColour}[!] Se va a plicar una busqueda por la dificultad $difficulty y los sitemas operativos que sean $os ${endColour}\n"
    cat bundle.js | grep "so: \"$os\"" -C 4 | grep "dificultad: \"$difficulty\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column
  else
    echo -e "\n${redColour}[!] La dificultad del sistema operativo o el sitema operativo incorrectos{endColour}\n"

  fi
}

# ===============================================================
# FIN FUNCIONES
# ===============================================================

# INDICADORES
declare -i parameter_counter=0

# CHIVATOS
declare -i chivato_difficulty=0
declare -i chivato_os=0


while getopts "m:ui:y:d:o:h" arg; do
  case $arg in
  m)
    machineName="$OPTARG"
    let parameter_counter+=1
    ;;
  u)
    # updatefiles
    let parameter_counter+=2
    ;;
  i)
    ipAddress="$OPTARG"
    let parameter_counter+=3
    ;;
  y)
    machineName="$OPTARG"
    parameter_counter+=4
    ;;
  d)
    difficulty="$OPTARG";chivato_difficulty=1;let parameter_counter+=5
    ;;
  o)
    os="$OPTARG";chivato_os=1;let parameter_counter+=6
    ;;
  h) ;;
  esac
done

if [ $parameter_counter -eq 1 ]; then

  searchMachine $machineName

elif [ $parameter_counter -eq 2 ]; then
  updatefiles
  # SI $parameter_counter vale 3 es que he puesto i, entramos aqui
elif [ $parameter_counter -eq 3 ]; then
  searchhIP $ipAddress
elif [ $parameter_counter -eq 4 ]; then
  YoutubeLink $machineName
elif [ $parameter_counter -eq 5 ]; then
  getmachinedifficulty $difficulty
elif [ $parameter_counter -eq 6 ]; then
  getOSMachines $os
elif [ $chivato_difficulty -eq 1 ] && [ $chivato_os -eq 1 ]; then
  getOSDifficulteMachines $difficulty $os
else
  helpPanel
fi

exit 0

