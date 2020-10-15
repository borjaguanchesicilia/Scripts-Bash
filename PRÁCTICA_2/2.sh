#!/bin/bash

# sysinfo - Un script que informa del estado del sistema

##### Constantes

TITLE="Información del sistema para $HOSTNAME"
NAME="PRACTICA 2: Borja Guanche Sicilia"
RIGHT_NOW=$(date +"%x %r%Z")
TIME_STAMP="Actualizada el $RIGHT_NOW por $USER"

##### Estilos

TEXT_BOLD=$(tput bold)
TEXT_BLINK=$(tput blink)
TEXT_GREEN=$(tput setaf 2)
TEXT_CYAN=$(tput setaf 6)
TEXT_RESET=$(tput sgr0)

##### Funciones

usage(){

  echo "Función usage:"
  echo "Esta es la funcion de ayuda."
}

error_exit(){
	
  echo "Función error_exit:"	
  echo "$1" 1>&2
  exit 1
}

search_comand(){

  # Función de buscar si el sistema contiene los comandos 'uptime', 'du' y 'df'
  echo "Función search comand:"
  echo
  if grep uptime /usr/bin/uptim; then
  echo "Si contiene el comando 'uptime'.";
  else 
  $(error_exit)
  fi
  echo
  if grep du /usr/bin/du; then
  echo "Si contiene el comando 'du'.";
  else
  error_exit "No contiene el comando 'du'. ABORTANDO..."
  fi
  echo
  if grep df /bin/df; then
  echo "Si contiene el comando 'df'.";
  else
  error_exit "No contiene el comando 'df'. ABORTANDO..."
  fi
}

home_space(){
  # Función de stub temporal
  X=$(find -type d | wc -l)
  Y=$(find -type f | wc -l)
  W=$(du -sh)
  Z=$(pwd)
  echo "Función home_space:"
  if [ $USER != root ]; then
  echo "El usuario es  root."
  cd /home
  for i in $( ls );do
  cd $i; 
  echo
  X=$(find -type d | wc -l)
  Y=$(find -type f | wc -l)
  W=$(du -sh)
  Z=$(pwd)
  printf "%10s%10s%7s\t%10s \n" "Directorios" "Archivos" "Usado" "Directorio"
  printf "%11s%10s%7s\t%s " $X $Y $W $i
  cd -; 
  done
  else
  echo
  echo "El usuario debe ser root."
  V=$(cd /home/$USER)
  cd /home/$USER
  pwd
  echo
  X=$(find -type d | wc -l)
  Y=$(find -type f | wc -l)
  W=$(du -sh)
  Z=$(pwd)
  printf "%10s%10s%7s\t%10s \n" "Directorios" "Archivos" "Usado" "Directorio"
  printf "%11s%10s%7s\t%s " $X $Y $W $cd /home/$USER
  fi
}

open_files(){

  # Función open files
  echo "Función open_files:"
  echo
  printf "%10s\t%10s \n" "Usuarios" "Nº Archivos"
  for i in $( awk -F: '{ print $1}' /etc/passwd );
  do
  K=$(lsof -u $i | wc -l);
  echo
  printf "%10s\t%10s \n" $i $K
  done

}



##### Programa principal

cat << _EOF_

$TEXT_BLINK$TEXT_CYAN$NAME$TEXT_RESET

$TEXT_BOLD$TITLE$TEXT_RESET

$(error_exit)

$(usage)

$(home_space)

$(search_comand)

$(open_files)

$TEXT_GREEN$TIME_STAMP$TEXT_RESET

_EOF_
