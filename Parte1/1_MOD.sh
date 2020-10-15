#!/bin/bash

# sysinfo - Un script que informa del estado del sistema

##### Constantes

TITLE="Información del sistema para $HOSTNAME"
NAME="PRACTICA 1: Borja Guanche Sicilia"
RIGHT_NOW=$(date +"%x %r%Z")
TIME_STAMP="Actualizada el $RIGHT_NOW por $USER"

##### Estilos

TEXT_BOLD=$(tput bold)
TEXT_BLINK=$(tput blink)
TEXT_GREEN=$(tput setaf 2)
TEXT_CYAN=$(tput setaf 6)
TEXT_RESET=$(tput sgr0)

##### Funciones

system_info()
{
   # Función de stub temporal
   echo "Función system_info:"
   echo
   uname -a
}


show_uptime()
{
   # Función de stub temporal
   echo "Función show_uptime:"
   echo
   uptime
}


drive_space()
{
   # Función de stub temporal
   echo "Función drive_space:"
   echo
   df -H
}


home_space()
{
    # Función de stub temporal
   echo "Función home_space:"
   if [ $USER = root ]; then 
   echo "El usuario es  root."
   du -sh /home | sort -n
   else
   echo
   echo "El usuario debe ser root."
   du -sh /home/$USER | sort -n
   fi
   if [ $USER != $LOGNAME ]; then
   echo
   echo "EL usuario es -> $USER "
   echo "El usuario que entro al sistema es -> $LOGNAME "
   else
   echo
   echo "EL usuario actual coincide con el usuario que entro al sistema."
   fi
   echo
   echo "El numero de procesos que se ha ejecutado hasta ahora es: "
   ps | wc -l
}

search_dot()
{
   # Función de buscar la ejecucipn con "."
   echo "Función search dot:"
   echo
   if echo $PATH | grep :[.]; then
   echo "SI contiene el '.'"
   else
   echo "NO contiene el '.'"
   fi
}


##### Programa principal

cat << _EOF_

$TEXT_BLINK$TEXT_CYAN$NAME$TEXT_RESET

$TEXT_BOLD$TITLE$TEXT_RESET

$(system_info)

$(show_uptime)

$(drive_space)

$(home_space)

$(search_dot)

$TEXT_GREEN$TIME_STAMP$TEXT_RESET

_EOF_
