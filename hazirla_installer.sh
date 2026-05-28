#!/bin/bash

# PLP OS v1.1 - Kurulum Ortamı Hazırlama Scripti
echo "🚀 PLP OS v1.1 Çalışma Alanı Hazırlanıyor..."

# 1. Gerekli klasör yapısını oluşturuyoruz
mkdir -p installer_custom/boot/grub
mkdir -p installer_custom/isolinux

# 2. GRUB Konfigürasyon dosyasını oluşturuyoruz (UEFI için)
echo "📝 GRUB Menüsü oluşturuluyor (En üstte Graphical Install + Siyah Tema)..."
cat << 'EOF' > installer_custom/boot/grub/grub.cfg
# PLP OS GRUB Konfigürasyonu

# Siyah Tema Ayarları
set menu_color_normal=white/black
set menu_color_highlight=black/white
set color_normal=white/black

# Varsayılan olarak en üstteki (0.) seçeneği seç
set default="0"
set timeout=5

# 1. SEÇENEK: EN ÜSTE GRAPHICAL INSTALL
menuentry "PLP OS (Graphical Install)" {
    set background_color=black
    linux    /install.amd/vmlinuz vga=788 --- quiet
    initrd   /install.amd/gtk/initrd.gz
}

# 2. Seçenek: Standart Metin Tabanlı Kurulum
menuentry "PLP OS (Text Install)" {
    set background_color=black
    linux    /install.amd/vmlinuz vga=788 --- quiet
    initrd   /install.amd/initrd.gz
}

# 3. Seçenek: Gelişmiş Seçenekler
submenu "Advanced options..." {
    set menu_color_normal=white/black
    set menu_color_highlight=black/white
    
    menuentry "PLP OS (Expert install)" {
        linux    /install.amd/vmlinuz priority=low --- quiet
        initrd   /install.amd/initrd.gz
    }
    menuentry "PLP OS (Rescue mode)" {
        linux    /install.amd/vmlinuz rescue/enable=true --- quiet
        initrd   /install.amd/initrd.gz
    }
}
EOF

# 3. Isolinux Konfigürasyon dosyasını oluşturuyoruz (Legacy/BIOS için)
echo "📝 Isolinux Menüsü oluşturuluyor (PLP OS: Your Power)..."
cat << 'EOF' > installer_custom/isolinux/menu.cfg
# PLP OS Isolinux Menüsü
# Siyah beyaz minimalist tema

menu title PLP OS: Your Power
   
label installgui
    menu label ^Graphical Install
    menu default
    kernel /install.amd/vmlinuz
    append vga=788 initrd=/install.amd/gtk/initrd.gz --- quiet

label install
    menu label ^Text Install
    kernel /install.amd/vmlinuz
    append vga=788 initrd=/install.amd/initrd.gz --- quiet

# Tema renk tanımlamaları (Siyah Arka Plan)
menu color screen	37;40      #white on black
menu color border	36;40      #cyan on black
menu color title	37;40      #white on black
menu color unsel	37;40      #white on black
menu color hotk		33;40      #yellow on black
menu color sel		40;37      #black on white
EOF

echo "✅ İşlem Tamamlandı! Dosyalar 'installer_custom' klasörüne başarıyla yazıldı."
