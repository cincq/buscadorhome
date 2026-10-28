#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Error: faltan argumentos. Debes escribir carpeta y palabra."
    exit 1
elif [ $# -gt 2 ]; then
    echo "Error: sobran argumentos. Debes escribir exactamente 2."
    exit 1
fi

carpeta="$1"
cadena="$2"
