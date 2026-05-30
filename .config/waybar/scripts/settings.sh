#!/bin/bash

# Path to your custom logo or image
logo_path="$HOME/.config/hypr/imgs/hypr-settings.png"

# Function to show the main menu
show_main_menu() {
    while true; do
        main_menu="Hyprland\nWaybar configs\nWaybar styles"
        selected_config=$(echo -e "$main_menu" | yad --title="Settings" --text="" --width=600 --height=306 --fixed --list --column="Settings" --separator='\n' --borders=9 -timeout=5 --button="   Kill me i dare you ..." --center --image="$logo_path")

        # Check if the escape button was pressed or the dialog was closed
        if [ "$selected_config" == "" ]; then
            echo "Escape key pressed or dialog closed. Exiting script."
            exit
        fi

        echo "Selected: $selected_config"

        case $selected_config in
            "Hyprland")
                launch_hyprland_settings ;;
            "Waybar configs")
                launch_waybar_configs ;;
            "Waybar styles")
                launch_waybar_styles ;;
            *)
                ;;
        esac
    done
}

# Function to launch Hyprland+Waybar configs & styles submenu
launch_hyprland_settings() {
    # Define base directories
    local base_dir="$HOME/.config/hypr"
    local modules_dir="$HOME/.config/hypr/modules"

    while true; do
        # Define the submenu options
        submenu="Back to main menu\nhyprland.lua\nautostart.lua\nenv_var.lua\nmonitors.lua\nworkspaces.lua\nkey_binds.lua\nwindow_binds.lua\nwindow_rules.lua"
        
        # Display the YAD menu for selection
        selected_file=$(echo -e "$submenu" | yad --title="Hyprland Settings" --text="" --width=600 --height=306 --fixed --list --column="Settings" --separator='\n' --borders=9 -timeout=5 --button="   Kill me i dare you ..." --center --image="$logo_path") 
        
        # Check if the escape button was pressed or the dialog was closed
        if [ "$selected_file" == "" ]; then
            echo "Escape key pressed or dialog closed. Exiting script."
            exit
        fi

        case $selected_file in
            "Back to main menu")
                break ;;
            *)
                # Determine the correct path based on the filename
                if [ "$selected_file" == "hyprland.lua" ]; then
                    filepath="${base_dir}/${selected_file}"
                else
                    filepath="${modules_dir}/${selected_file}"
                fi

                # Check if the file actually exists
                if [ -f "$filepath" ]; then
                    echo "Opening $filepath"
                    
                    # Check if 'bat' is installed for syntax highlighting
                    if command -v bat &> /dev/null; then
                        # Open in Kitty with bat for colored viewing
                        kitty --hold -e bat --style=plain --color=always "$filepath" &
                    else
                        # Fallback to less
                        kitty --hold -e less "$filepath" &
                    fi
                else
                    # Error handling if file is missing
                    yad --title="Error" --text="File not found:\n$filepath" --button="OK" --center --image="dialog-error"
                    echo "Error: File not found at $filepath"
                fi
        ;;
        esac
    done
}

# Function to launch Waybar configs submenu
launch_waybar_configs() {
    while true; do
        submenu="Back to main menu\n~/.config/waybar/conf/w1-config-desktop.jsonc\n~/.config/waybar/conf/w2-config-laptop.jsonc"
        selected_submenu=$(echo -e "$submenu" | yad --title="Waybar Configs" --text="" --width=600 --height=306 --fixed --list --column="Configs" --separator='\n' --borders=9 -timeout=5 --button="   Kill me i dare you ..." --center --image="$logo_path")
        
        # Check if the escape button was pressed or the dialog was closed
        if [ "$selected_submenu" == "" ]; then
            echo "Escape key pressed or dialog closed. Exiting script."
            exit
        fi

        case $selected_submenu in
            "Back to main menu")
                break ;;
            *)
                echo "Launching nano for $selected_submenu"
                kitty nano "$selected_submenu" ;;
        esac
    done
}

# Function to launch Waybar styles submenu
launch_waybar_styles() {
    while true; do
        submenu="Back to main menu\n~/.config/waybar/style/w1-style.css\n~/.config/waybar/style/w2-style.css"
        selected_submenu=$(echo -e "$submenu" | yad --title="Waybar Styles" --text="" --width=600 --height=306 --fixed --list --column="Styles" --separator='\n' --borders=9 -timeout=5 --button="   Kill me i dare you ..." --center --image="$logo_path")
        
        # Check if the escape button was pressed or the dialog was closed
        if [ "$selected_submenu" == "" ]; then
            echo "Escape key pressed or dialog closed. Exiting script."
            exit
        fi

        case $selected_submenu in
            "Back to main menu")
                break ;;
            *)
                echo "Launching nano for $selected_submenu"
                kitty nano "$selected_submenu" ;;
        esac
    done
}


# Start the main menu loop
show_main_menu
