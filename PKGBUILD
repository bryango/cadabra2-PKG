# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname='cadabra2-git'
pkgver=r467.f8f50cf
pkgrel=1
pkgdesc="A computer algebra system designed specifically for the solution of problems encountered in field theory."
arch=('i686' 'x86_64')
url="http://cadabra.phi-sci.com/"
license=('GPL')
provides=('cadabra')
conflicts=('cadabra2' 'cadabra' 'cadabra-git')
depends=('python2-matplotlib' 'python2-mpmath' 'gtkmm3' 'jsoncpp' 'mathjax' 'boost-libs' 'gtk-update-icon-cache')
makedepends=('cmake' 'gcc' 'boost')
source=("$pkgname::git+https://github.com/kpeeters/cadabra2" "package.patch" "cadabra.desktop")
md5sums=('SKIP'
         '1f7d7e0baa868d12e6eb53c7a594605c'
         '04718d712ef65dbe5513ae674cc6ec33')
install=package.install


pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# prepare() {
#   cd "${srcdir}/${pkgname}"
#   patch -Np1 -i ../package.patch
# }

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
  install -Dm644 "${srcdir}/cadabra.desktop" "$pkgdir/usr/share/applications/cadabra.desktop"
  install -Dm644 ../images/cadabra.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/cadabra.png"
  install -Dm644 ../images/cadabra.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/cadabra.svg"
}
