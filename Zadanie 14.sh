Temat 14:

#!/bin/bash

# Słownik pięcioliterowych słów
slownik=("kasza" "zupka" "bułka" "jajka" "dynia" "manna" "tarta")
szukane_slowo=${slownik[$((RANDOM % ${#slownik[@]}))]}

licznik_prob=0
while true; do
    read -p "Podaj pięcioliterowe słowo związanie z jedzniem: " wpisane_slowo
    if [ "$wpisane_slowo" == "$szukane_slowo" ]; then
        echo "Gratulacje! Wygrałeś!"
        break
    fi

    licznik_prob=$((licznik_prob + 1))
    if [ "$licznik_prob" -ge 6 ]; then
        echo "Przegrałeś! Szukane słowo to: $szukane_slowo"
        break
    fi

    poprawne_litery=""
    niepoprawne_litery=""
    for ((i = 0; i < 5; i++)); do
        if [ "${wpisane_slowo:$i:1}" == "${szukane_slowo:$i:1}" ]; then
            poprawne_litery+="${szukane_slowo:$i:1}"
        else
            niepoprawne_litery+="${wpisane_slowo:$i:1}"
        fi
    done

    poprlit=""
    for ((i = 0; i < 5; i++)); do
        literki="${szukane_slowo:$i:1}"
        if [[ "$poprawne_litery" == *"$literki"* ]]; then
            poprlit+="$literki"
        else
            poprlit+="_"
        fi
    done

    echo "Poprawne litery: $poprlit"
    echo "Niepoprawne litery: $niepoprawne_litery"
done

