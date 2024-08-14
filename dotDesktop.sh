#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Error: No has proporcionado un archivo."
    echo "Uso: dotDesktop <archivo.AppImage> <nombre_para_desktop>"
    exit 1
fi

if [[ ${#1} -gt 9 ]]; then
    if [[ "${1: -8}" != "AppImage" ]]; then
        echo "Error: Formato de archivo invalido."
        echo "Formato de archivo requerido: .AppImage"
        exit 1
    fi
else
    echo "Error: Formato de archivo invalido."
    echo "Formato de archivo requerido: .AppImage"
    exit 1
fi

if [[ -z "$2" ]]; then
    echo "Error: No has proporcionado un nombre para el .desktop"
    echo "Uso: dotDesktop <archivo.AppImage> <nombre_para_desktop>"
    exit 1
fi

path_desktop="$HOME/.local/share/applications/$2.desktop"

text_desktop="[Desktop Entry]\n
Type=Application\n
Categories=Application;\n
Exec=$(pwd)/$1\n
Name=$2\n
"

echo -e $text_desktop > $path_desktop
echo "Nuevo .desktop creado para $2 en $path_desktop"
