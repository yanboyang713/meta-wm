# Maintainer: Boyang Yan <yanboyang713@gmail.com>
pkgname=meta-wm
_pkgname=chadwm
#_output_dir=~/.config/chadwm
pkgver=0.1
pkgrel=1
epoch=1
pkgdesc="Meta-WM's version of ChadWM (DWM Modif)"
arch=('x86_64' 'i686')
url="https://github.com/yanboyang713/meta-wm.git"
license=('MIT')
depends=('picom' 'feh' 'acpi' 'rofi' 'pavucontrol' 'dash' 'imlib2' 'xorg-xsetroot' 'wget' 'xorg-server')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('dwm')
conflicts=('dwm')
source=("$_pkgname::git+https://github.com/yanboyang713/meta-wm.git")
sha256sums=('SKIP')

#pkgver() {
#	cd "$_pkgname"
#	printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build() {
    echo "pkgdir: " ${pkgdir}
    echo "_pkgname: " ${_pkgname}
	cd "$_pkgname"


    mkdir -p "${pkgdir}/opt/${pkgname}"
	#cp -rf * "${pkgdir}/opt/${pkgname}"

	make
    #if [ -d "~/.config/" ]
    #then
    #    echo "Directory ~/.config/ exists."
    #else
    #    echo "Error: Directory ~/.config/ does not exists."
    #    mkdir ~/.config/
    #fi

	#mkdir "$_output_dir"
	#cp -r "./" "$_output_dir"
	#cd "$_output_dir/chadwm"
}

package() {
	#cd "$_output_dir/chadwm"
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
