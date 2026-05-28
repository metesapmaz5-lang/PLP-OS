#!/bin/bash

# --- AYARLAR ---
ESKI_ISO="/home/mete/İndirilenler/PLP-OS-Installer.iso"
YENI_ISO="PLP_OS_v1.1.iso"
# ---------------

echo "📦 PLP OS v1.1 ISO Paketleme Operasyonu Başlıyor..."

# xorriso kontrolü
if ! command -v xorriso &> /dev/null; then
    echo "❌ xorriso bulunamadı! Lütfen yükle: sudo apt install xorriso"
    exit 1
fi

# Geçici klasör oluşturup eski ISO'yu açıyoruz
rm -rf iso_icerik mnt_iso
mkdir -p iso_icerik mnt_iso

echo "📂 Orijinal ISO içeriği açılıyor..."
sudo mount -o loop "$ESKI_ISO" mnt_iso
cp -rT mnt_iso/ iso_icerik/
sudo umount mnt_iso
rmdir mnt_iso

# Yazma izinlerini veriyoruz
chmod -R +w iso_icerik/

echo "💉 Özelleştirilmiş simsiyah PLP OS dosyaları ISO'ya enjekte ediliyor..."

# Yeni initrd dosyalarını kopyalıyoruz
cp installer_custom/install/initrd.gz iso_icerik/install/initrd.gz
cp installer_custom/install/gtk/initrd.gz iso_icerik/install/gtk/initrd.gz

# Varsa açılış menüsü (isolinux/grub) dosyalarını da güncelliyoruz
if [ -f "installer_custom/boot/grub/grub.cfg" ] && [ -d "iso_icerik/boot/grub" ]; then
    cp installer_custom/boot/grub/grub.cfg iso_icerik/boot/grub/grub.cfg
fi
if [ -f "installer_custom/isolinux/menu.cfg" ] && [ -d "iso_icerik/isolinux" ]; then
    cp installer_custom/isolinux/menu.cfg iso_icerik/isolinux/menu.cfg
fi

echo "🧱 Hibrit ISO imajı inşa ediliyor (xorriso)..."
# ISO tipine göre esnek paketleme yapıyoruz
xorriso -as mkisofs \
    -r -V 'PLP_OS_v1.1' \
    -o "$YENI_ISO" \
    -J -joliet-long \
    -b isolinux/isolinux.bin \
    -c isolinux/boot.cat \
    -no-emul-boot -boot-load-size 4 -boot-info-table \
    -eltorito-alt-boot \
    -e boot/grub/efi.img \
    -no-emul-boot \
    -isohybrid-gpt-basdat \
    iso_icerik/ 2>/dev/null

# Temizlik
rm -rf iso_icerik

echo "⚡ TEBRİKLER ŞEF! Yeni ISO kapı gibi hazır: $YENI_ISO"
