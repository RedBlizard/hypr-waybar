#!/bin/bash

# Path to your custom logo or image
logo_path="$HOME/.config/hypr/imgs/hypr-settings.png"

# Function to show the main menu
show_main_menu() {
    while true; do
        main_menu="Awww options"
        selected_config=$(echo -e "$main_menu" | yad --title="Awww" --text="" --width=600 --height=306 --fixed --list --column="Awww" --separator='\n' --borders=9 -timeout=5 --button="   Kill me i dare you ..." --center --image="$logo_path")
        # Check if the escape button was pressed or the dialog was closed
        if [ "$selected_config" == "" ]; then
            echo "Escape key pressed or dialog closed. Exiting script."
            exit
        fi

        echo "Selected: $selected_config"

        case $selected_config in
            "Awww options")
                launch_awww_options ;;
            *)
                ;;
        esac
    done
}

# Function to launch A\www options submenu
launch_awww_options() {
    while true; do
        submenu="Back to main menu\nKill awww\nChange Wallpaper Directory\nInitialize awww"
        selected_submenu=$(echo -e "$submenu" | yad --title="Change your settings" --text="" --width=600 --height=306 --fixed --list --column="Change your settings" --separator='\n' --borders=9 -timeout=5 --button="   Kill me i dare you ..." --center --image="$logo_path") 
        
        # Check if the escape button was pressed or the dialog was closed
        if [ "$selected_submenu" == "" ]; then
            echo "Escape key pressed or dialog closed. Exiting script."
            exit
        fi

        case $selected_submenu in
            "Back to main menu")
                break ;;
            "Kill awww")
                echo "Killing awww"
                pkill awww ;;
            "Change Wallpaper Directory")
                echo "Launching nano for random-wallpaper"
                kitty nano ~/.config/hypr/scripts/random-wallpaper ;;
            "Initialize awww")
                echo "Initializing awww"
                export HYPRLAND_INSTANCE_SIGNATURE=$(ls /run/user/$UID/hypr | head -n1)
                hyprctl dispatch exec "awww-daemon" ;;
            *)
                ;;
        esac
    done
}

# Start the main menu loop
show_main_menu
