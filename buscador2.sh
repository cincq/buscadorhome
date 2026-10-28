#!/bin/bash
if [[ $# -lt 2 ]]; then
    echo "Uso: $0 <carpeta> <palabra>" >&2
    exit 1
fi
carpeta="$1"
cadena="$2"
if [[ -z "$cadena" ]]; then
    echo "Error: debes escribir una palabra o frase." >&2
    exit 1
fi
if [[ ! -d "$carpeta" ]]; then
    echo "Error: la carpeta no existe." >&2
    exit 1
fi
carpeta=$(realpath "$carpeta")
while IFS= read -r -d '' archivo; do
    cantidad=$(grep -oF -- "$cadena" "$archivo" 2>/dev/null | wc -l)
    if (( cantidad > 0 )); then
        echo "$archivo"
    fi
done < <(find "$carpeta" -type f -print0)
