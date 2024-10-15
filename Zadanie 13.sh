Kod:
#!/bin/bash
aktualna_data=$(date +%m.%d)
za_dwa_tygodnie=$(date -d "+2 weeks" +%m.%d)

w_ciagu_dwoch_tygodni=false
while read -r linia; do
    data_wydarzenia=${linia%% *}
    opis_wydarzenia=${linia#* }

    if [[ "$data_wydarzenia" == "$aktualna_data" || ( "$data_wydarzenia" > "$aktualna_data" && "$data_wydarzenia" < "$za_dwa_tygodnie" ) ]]; then
        echo "$linia"
        w_ciagu_dwoch_tygodni=true
    fi
done < wydarzenia.txt

if ! $w_ciagu_dwoch_tygodni; then
    echo "Brak wydarzeń w najbliższych dwóch tygodniach. Oto trzy najbliższe wydarzenia:"
    sort -n -k1 -t'.' wydarzenia.txt | head -n 3
fi

