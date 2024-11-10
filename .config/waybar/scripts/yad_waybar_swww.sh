#!/bin/bash

# Path to your custom logo or image
logo_path="$HOME/.config/hypr/imgs/hypr-settings.png"

# Function to show the main menu
show_main_menu() {
    while true; do
        main_menu="Swww options"
        selected_config=$(echo -e "$main_menu" | yad --title="Swww" --text="" --width=600 --height=306 --fixed --list --column="Swww" --separator='\n' --borders=9 -timeout=5 --button="   Kill me i dare you ..." --center --image="$logo_path")
        # Check if the escape button was pressed or the dialog was closed
        if [ "$selected_config" == "" ]; then
            echo "Escape key pressed or dialog closed. Exiting script."
            exit
        fi

        echo "Selected: $selected_config"

        case $selected_config in
            "Swww options")
                launch_swww_options ;;
            *)
                ;;
        esac
    done
}

# Function to launch Swww options submenu
launch_swww_options() {
    while true; do
        submenu="Back to main menu\nKill swww\nChange Wallpaper Directory\nInitialize swww"
        selected_submenu=$(echo -e "$submenu" | yad --title="Change your settings" --text="" --width=600 --height=306 --fixed --list --column="Change your settings" --separator='\n' --borders=9 -timeout=5 --button="   Kill me i dare you ..." --center --image="$logo_path") 
        
        # Check if the escape button was pressed or the dialog was closed
        if [ "$selected_submenu" == "" ]; then
            echo "Escape key pressed or dialog closed. Exiting script."
            exit
        fi

        case $selected_submenu in
            "Back to main menu")
                break ;;
            "Kill swww")
                echo "Killing swww"
                pkill swww ;;
            "Change Wallpaper Directory")
                echo "Launching nano for random-wallpaper"
                kitty nano ~/.config/hypr/scripts/random-wallpaper ;;
            "Initialize swww")
                echo "Initializing swww"
                swww init ;;
            *)
                ;;
        esac
    done
}

# Start the main menu loop
show_main_menu
