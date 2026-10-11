#!/bin/bash

echo "Введите числа через пробел:"
read array

if [ -z "$array" ]; then
    echo "Error"
    exit 1
fi

numbers=($array)

for num in "${numbers[@]}"; do
    if ! [[ "$num" =~ ^-?[0-9]+$ ]]; then
        echo "Error"
        exit 1
    fi
done

sorted=$(printf "%s\n" "${numbers[@]}" | sort -n)
echo "Sorted: $(echo $sorted | tr '\n' ' ')"
