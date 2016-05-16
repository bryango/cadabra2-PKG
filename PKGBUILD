# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname='cadabra2-git'
pkgver=r701.a17ad42
pkgrel=2
pkgdesc="A computer algebra system (pre-release version) designed specifically for the solution of problems encountered in field theory."
arch=('i686' 'x86_64')
url="http://cadabra.phi-sci.com/"
license=('GPL')
provides=('cadabra2')
conflicts=('cadabra2')
depends=('python2-matplotlib' 'gtkmm3' 'jsoncpp' 'mathjax' 'boost-libs' 'python2-sympy')
makedepends=('cmake' 'gcc' 'boost')
source=("$pkgname::git+https://github.com/kpeeters/cadabra2" "package.patch")
md5sums=('SKIP'
         '7eaf565d2558304a454d2669effa2630')
install=package.install


pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
 cd "${srcdir}/${pkgname}"
 patch -Np1 -i ../package.patch
}

build() {
  cd $pkgname
  mkdir -p build
  cd build
  cmake -DCMAKE_SKIP_RPATH=true -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "../config/cadabra2.desktop" "$pkgdir/usr/share/applications/cadabra2.desktop"
  install -Dm644 ../images/64x64/cadabra2.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/cadabra2.png"
  install -Dm644 ../images/256x256/cadabra2.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/cadabra2.png"
  install -Dm644 ../images/cadabra2.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/cadabra2.svg"
}
