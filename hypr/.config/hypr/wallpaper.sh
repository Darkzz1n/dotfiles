#!/bin/bash
WALLPAPER_DIR="$HOME/Imagens/Wallpapers"

# Lista wallpapers no Wofi
menu() {
    find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) \
        | awk '{print "img:"$0}'
}

main() {
    # Seleciona o wallpaper
    choice=$(menu | wofi -c ~/.config/wofi/wallpaper -s ~/.config/wofi/style-wallpaper.css --show dmenu --prompt "Select Wallpaper:" -n)
    selected_wallpaper=$(echo "$choice" | sed 's/^img://')
    [ -z "$selected_wallpaper" ] && exit 0

    # Troca o wallpaper e gera todas as cores via Matugen
    swww img "$selected_wallpaper" --transition-type any --transition-fps 60 --transition-duration .5
    matugen image "$selected_wallpaper"

    # Recarrega SwayNC
    swaync-client --reload-css

    # Atualiza Kitty
    cp ~/.config/kitty/colors.conf ~/.config/kitty/current-theme.conf
    pkill -SIGUSR1 kitty 2>/dev/null

    # Atualiza Cava com as duas cores principais da paleta Matugen
    color1=$(awk 'match($0, /@define-color base02 (.*);/,a){print a[1]}' ~/.config/matugen/templates/colors-waybar.css)
    color2=$(awk 'match($0, /@define-color base03 (.*);/,a){print a[1]}' ~/.config/matugen/templates/colors-waybar.css)
    cava_config="$HOME/.config/cava/config"
    sed -i "s/^gradient_color_1 = .*/gradient_color_1 = '$color1'/" "$cava_config"
    sed -i "s/^gradient_color_2 = .*/gradient_color_2 = '$color2'/" "$cava_config"
    pkill -USR2 cava 2>/dev/null
}

main
