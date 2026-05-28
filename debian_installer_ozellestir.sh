#!/bin/bash

# --- AYARLAR ---
DEBIAN_ISO="/home/mete/İndirilenler/PLP-OS-Installer.iso"
# ---------------

echo "🛠️  PLP-OS-Installer Üzerinde Gerçek Mavi Ekran Operasyonu Başlıyor..."

# 1. Eski geçici klasörleri temizleyip yenilerini açıyoruz
rm -rf initrd_ayıkla mnt_iso
mkdir -p initrd_ayıkla mnt_iso installer_custom/install/gtk

# 2. ISO içindeki iki adet initrd.gz dosyasını tek tek işleme alacağız
echo "📂 ISO içeriği bağlanıyor..."
sudo mount -o loop "$DEBIAN_ISO" mnt_iso

# Fonksiyon: initrd dosyasını aç, özelleştir ve paketle
ozellestir_initrd() {
    local kaynak="$1"
    local hedef="$2"
    
    echo "📦 $kaynak işleniyor..."
    rm -rf initrd_ayıkla && mkdir -p initrd_ayıkla
    
    # Açma
    cd initrd_ayıkla
    zcat "../$kaynak" | cpio -idmv &> /dev/null
    cd ..
    
    # Yazıyı Değiştirme
    mkdir -p initrd_ayıkla/etc
    echo "PLP OS: Your PC, Your Power" > initrd_ayıkla/etc/installer-version
    
    # Siyaha Boyama (Palette)
    mkdir -p initrd_ayıkla/etc/newt
    cat << 'THEME' > initrd_ayıkla/etc/newt/palette
root=white,black
border=white,black
window=white,black
shadow=black,black
title=white,black
button=black,white
actbutton=white,black
checkbox=white,black
actcheckbox=black,white
entry=black,white
label=white,black
listbox=white,black
actlistbox=black,white
textbox=white,black
acttextbox=black,white
helpline=white,black
roottext=white,black
emptyscale=black,white
fullscale=white,white
disentry=white,black
compactbutton=white,black
actsellistbox=black,white
THEME

    # Geri Paketleme
    cd initrd_ayıkla
    find . | cpio -H newc -o --quiet | gzip -9 > "../$hedef"
    cd ..
}

# Standart Installer için yapıyoruz
ozellestir_initrd "mnt_iso/install/initrd.gz" "installer_custom/install/initrd.gz"

# Graphical Installer için yapıyoruz
ozellestir_initrd "mnt_iso/install/gtk/initrd.gz" "installer_custom/install/gtk/initrd.gz"

# ISO'yu ayırıyoruz
sudo umount mnt_iso
rmdir mnt_iso
rm -rf initrd_ayıkla

echo "🔥 İŞLEM TAMAMEN BAŞARILI!"
echo "v1.1 için iki installer dosyası da 'installer_custom/install/' altında simsiyah yapıldı şef!"
