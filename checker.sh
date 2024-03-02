#!/bin/bash

get_speed() {
    speed=$(speedtest | awk -F': ' '/Download:/{printf $2"\n"}' | sed 's/\([0-9]*\)\..*/\1/')
    echo "$speed"
}

send_notification() {
    message="La velocidad de Internet es baja! Actualmente es $1 Mbps. Y deberian ser 1000."
    # Cada espacio es un nuevo numero
    numbers="me <other-number>"
    echo $message

    for number in $numbers; do
        npx mudslide@latest send "$number" "$message"
    done
}

main() {
    # Numero de veces se ejecuta el checker
    count=0

    while [ $count -lt 2 ]; do
        limit="300"
        speed=$(get_speed)
        message_default="La velocidad de Internet es $speed Mbps."

        if [[ "$speed" -lt "$limit" ]]; then
            echo "La velocidad es menor a $limit Mbps"
            send_notification "$speed"
        else
            echo "La velocidad es mayor o igual a $limit Mbps"
            npx mudslide@latest send me "$message_default"
        fi

        # Wait and second try
        sleep 600
        count=$(( $count + 1 ))
        
    done
}

main
