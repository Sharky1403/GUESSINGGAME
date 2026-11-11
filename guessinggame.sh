count_files() {
    find . -maxdepth 1 -type f | wc -l
}
is_valid_number() {
    [[ "$1" =~ ^[0-9]+$ ]]
}

play_game() {
    local guess
    local total
    total=$(count_files)

    echo "Bienvenue dans le jeu des fichiers !"
    echo "Combien de fichiers sont dans le repertoire actuel ?"

    while true; do
        if ! read -r -p "Votre estimation : " guess; then
            echo
            echo "Saisie interrompue."
            return 1
        fi

        if ! is_valid_number "$guess"; then
            echo "Entrez un entier positif ou nul."
            continue
        fi

        if (( 10#$guess < total )); then
            echo "Trop bas ! Essayez encore."
        elif (( 10#$guess > total )); then
            echo "Trop haut ! Essayez encore."
        else
            echo "Bravo ! Vous avez trouve $total fichiers."
            break
        fi
    done
}

play_game
