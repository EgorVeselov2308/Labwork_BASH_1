#!/bin/bash

sortirovka() {
    local array=("$@")
    local n=${#array[@]}
    local i j x

    for ((i = 0; i < n - 1; i++)); do
        for ((j = 0; j < n - i - 1; j++)); do
            if [ "${array[j]}" -gt "${array[j+1]}" ]; then
                x="${array[j]}"
                array[j]="${array[j+1]}"
                array[j+1]="$x"
            fi
        done
    done

    echo "${array[@]}"
}

if [ $# -eq 0 ]; then
    echo "Error"
    exit 1
fi

for num in "$@"; do
    if ! [[ "$num" =~ ^-?[0-9]+$ ]]; then
        echo "Error"
        exit 1
    fi
done

sorted=$(sortirovka "$@")
echo "Sorted: $sorted"
