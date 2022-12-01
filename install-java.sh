#!/bin/bash

echo "this will install openjdk (java whatever version you want) onto your system do you wish to continue (y/n)?"
    read var1
##asks you what system you are using (might try to find out how to auto detect)
if [[ $var1 == "y" ]]; then
    echo "are you using a debian system (ubuntu/raspian/anything that uses apt) or arch? Please type 1 for debian/apt or 2 for arch pacman"
    read var2
    echo "please note that if you areon arch, it will install the latest jdk and you can just skip the next step"
    sleep 3
    echo "what version of java do you wish to install (7|8|16|17|just a version number that exsists)"
    read javaver
    if [[ $var2 == "1" ]]; then
##debian part
    echo "it is highly reccomended that you update your system before continuing this installation, do you wish to update (y/n)?"
    read var3
        if [[ $var3 == "y" ]]; then
             echo "updating your system"
                sudo apt update
                sudo apt-get full-upgrade -y
                sleep 1
                echo "update complete, resuming java installation"
                    sleep 1
                    sudo apt-get install openjdk-$javaver-jdk -y
                    sudo apt update
                    echo "done!"
        else
            echo "update skipped, still installing java tho"
                sleep 1
                sudo apt-get install openjdk-$javaver-jdk
                echo "you really should update but otherwise, done!"
        fi
##arch part
    else
        echo "it is highly reccomended that you update your system before continuing this installation, do you wish to update (y/n)"
        read var3
            if [[ $var3 == "y" ]]; then
                echo "updating your system"
                    sudo pacman -Syu -y
                    echo "update complete, resuming java installation"
                        sleep 1
                            sudo pacman -sS java | grep jdk
                            sudo pacman -S jdk-openjdk -y
                            sudo pacman -Syu -y
                            echo "done!"
            else
                echo "update skipped, still installing java tho (i dont use arch so idk if this will break but good luck!"
                    sleep 3
                        sudo pacman -sS java | grep jdk
                        sudo pacman -S jdk-openjdk -y
                        echo "done!"
            fi
    fi
else
    echo "installation canceled (if you wish to use this script again you can use the command ./install-java.sh however you should probably delete the file and reuse the script command"
fi