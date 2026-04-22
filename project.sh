#!/bin/bash

# Function to display the main menu
main_menu() {
    CHOICE=$(whiptail --title "Main Menu" --menu "" 20 78 12 \
        "Add User" "Add a user to the system." \
        "Modify User" "Modify an existing user." \
        "Delete User" "Delete an existing user." \
        "List Users" "List all users on the system." \
        "Add Group" "Add a user group to the system." \
        "Modify Group" "Modify a group and its list of members." \
        "Delete Group" "Delete an existing group." \
        "List Groups" "List all groups on the system." \
        "Disable User" "Lock the user account." \
        "Enable User" "Unlock the user account." \
        "Change Password" "Change Password of a user." \
        "About" "Information about this program." 3>&1 1>&2 2>&3)

    return_code=$?
    # If user hits ESC or Cancel, exit
    if [ $return_code -ne 0 ]; then
        exit
    fi

    case $CHOICE in
        "Add User") add_user ;;
        "Modify User") modify_user ;;
        "Delete User") delete_user ;;
        "List Users") list_users ;;
        "Add Group") add_group ;;
        "Modify Group") modify_group ;;
        "Delete Group") delete_group ;;
        "List Groups") list_group ;;
        "Disable User") disable_user ;;
        "Enable User") enable_user ;;
        "Change Password") change_password ;;
        "About") whiptail --msgbox "User Manager CLI v1.0\nCreated for Bash Project." 20 40 ;;
    esac
}

add_user() {
    username=$(whiptail --inputbox "Enter username:" 20 40 3>&1 1>&2 2>&3)
    if [ -n "$username" ]; then
        useradd "$username" && echo "User added successfully"
    fi
}


modify_user() {
    username=$(whiptail --inputbox "Enter username to modify:" 20 40 3>&1 1>&2 2>&3)
    newname=$(whiptail --inputbox "Enter new username:" 20 40 3>&1 1>&2 2>&3)

    if [ -n "$username" ] && [ -n "$newname" ]; then
        usermod -l "$newname" "$username" && echo "User modified"
    fi
}

delete_user() {
    username=$(whiptail --inputbox "Enter username to delete:" 20 40 3>&1 1>&2 2>&3)
    if [ -n "$username" ]; then
        userdel "$username" && echo "User deleted"
    fi
}

list_users() {
    cut -d: -f1 /etc/passwd > /tmp/listusers.txt
    whiptail --textbox /tmp/listusers.txt 20 50 --scrolltext
    rm -f /tmp/listusers.txt
}

add_group() {
    group=$(whiptail --inputbox "Enter group name:" 20 40 3>&1 1>&2 2>&3)
    if [ -n "$group" ]; then
        groupadd "$group" && echo "Group added"
    fi
}

modify_group() {
    group=$(whiptail --inputbox "Enter group name to modify:" 20 40 3>&1 1>&2 2>&3)
    newgroup=$(whiptail --inputbox "Enter new group name:" 20 40 3>&1 1>&2 2>&3)

    if [ -n "$group" ] && [ -n "$newgroup" ]; then
        groupmod -n "$newgroup" "$group" && echo "Group modified"
    fi
}

delete_group() {
    group=$(whiptail --inputbox "Enter group name to delete:" 20 40 3>&1 1>&2 2>&3)
    if [ -n "$group" ]; then
        groupdel "$group" && echo "Group deleted"
    fi
}

list_group() {
    cut -d: -f1 /etc/group > /tmp/listgroups.txt
    whiptail --textbox /tmp/listgroups.txt 20 50 --scrolltext
    rm -f /tmp/listgroups.txt
}

disable_user() {
    username=$(whiptail --inputbox "Enter username to disable:" 10 40 3>&1 1>&2 2>&3)
    if [ -n "$username" ]; then
        usermod -L "$username" && echo "User disabled"
    fi
}

enable_user() {
    username=$(whiptail --inputbox "Enter username to enable:" 10 40 3>&1 1>&2 2>&3)
    if [ -n "$username" ]; then
        usermod -U "$username" && echo "User enabled"
    fi
}

change_password() {
    username=$(whiptail --inputbox "Enter username:" 10 40 3>&1 1>&2 2>&3)
    if [ -n "$username" ]; then
        passwd "$username"
    fi
}

while true; do
    main_menu
done