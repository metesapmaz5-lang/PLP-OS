#!/bin/sh
# =====================================================================
# PLP-OS v1.0.0 "tyr" Post-Installation & Curated Menu Script
# =====================================================================

# Terminali temizle ve temiz bir arayüz sun
exec </dev/tty1 >/dev/tty1 2>&1
clear

echo "========================================================"
echo "          PARABELLUM LINUX PROJECT (PLP-OS)            "
echo "            Post-Install Configuration Menu             "
echo "========================================================"
echo ""

# ADIM 1: Masaüstü Ortamı (DE) Seçim Ekranı
echo "Please choose your Desktop Environment / Masaüstü Ortamı Seçiniz:"
echo "1) Vanilla KDE Plasma (Pure, non-bloated Plasma desktop)"
echo "2) Minimal XFCE (Ultra lightweight and fast)"
echo "3) LXQt-Core (The bare minimum Qt environment)"
echo "--------------------------------------------------------"
printf "Enter choice (1-3): "
read de_choice

case $de_choice in
    1)
        echo "--> Installing Vanilla KDE Plasma..."
        in-target apt-get install -y kde-plasma-desktop konsole privileges-cleaner
        ;;
    2)
        echo "--> Installing Minimal XFCE..."
        in-target apt-get install -y xfce4 xfce4-terminal privileges-cleaner
        ;;
    3)
        echo "--> Installing LXQt-Core..."
        in-target apt-get install -y lxqt-core qterminal privileges-cleaner
        ;;
    *)
        echo "Invalid choice. Defaulting to Minimal XFCE for safety..."
        in-target apt-get install -y xfce4 xfce4-terminal privileges-cleaner
        ;;
esac

echo ""
echo "========================================================"
echo "         OPTIONAL EXTRA PACKAGES / EK PAKETLER          "
echo "========================================================"
echo "Select extra tools to build your arsenal (y/n):"

# Firefox seçimi
printf "Install Firefox ESR? (y/n): "
read ch_fox
if [ "$ch_fox" = "y" ] || [ "$ch_fox" = "Y" ]; then
    in-target apt-get install -y firefox-esr
fi

# UFW Güvenlik Duvarı
printf "Install UFW Firewall? (y/n): "
read ch_ufw
if [ "$ch_ufw" = "y" ] || [ "$ch_ufw" = "Y" ]; then
    in-target apt-get install -y ufw
    in-target ufw enable
fi

# Vim Editör
printf "Install Vim Text Editor? (y/n): "
read ch_vim
if [ "$ch_vim" = "y" ] || [ "$ch_vim" = "Y" ]; then
    in-target apt-get install -y vim
fi

# Git Sürüm Kontrolü
printf "Install Git? (y/n): "
read ch_git
if [ "$ch_git" = "y" ] || [ "$ch_git" = "Y" ]; then
    in-target apt-get install -y git
fi

# =====================================================================
# ADIM 3: O EFSANE MANİFESTO VE KAPANIŞ MESAJI
# =====================================================================
clear
echo "====================================================================="
echo "             INSTALLATION COMPLETE / KURULUM TAMAMLANDI             "
echo "====================================================================="
echo ""
echo " As the PLP team, we have one request from you: we don't care about "
echo " your data. If you like our system, sharing the project with your "
echo " friends and the community would mean the world to us. It is entirely"
echo " up to you. Thank you for choosing PLP-OS!"
echo ""
echo " ------------------------------------------------------------------- "
echo ""
echo " PLP ekibi olarak sizden bir isteğimiz var; bizim derdimiz sizin     "
echo " verileriniz değil. Eğer sistemimizi severseniz, projeyi             "
echo " arkadaşlarınızla ve toplulukla paylaşmanız bizi çok mutlu eder.     "
echo " Paylaşıp paylaşmamak tamamen size bağlıdır.                         "
echo " PLP-OS'i tercih ettiğiniz için teşekkürler!                         "
echo ""
echo "====================================================================="
echo "Press ENTER to reboot your system and deploy PLP-OS..."
read final_block

# Temizlik ve çıkış
in-target apt-get clean
exit 0
