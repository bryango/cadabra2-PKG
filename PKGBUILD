# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>
# Contributor: Bryan Lai <bryanlais@gmail.com>

pkgname='cadabra2-git'
pkgver=2.3.0.r17.97bf651
_base=2.3.0
_since=2.2.8  # shallow clone since this version
pkgrel=1
pkgdesc="A computer algebra system (pre-release version) designed specifically for the solution of problems encountered in field theory."
arch=('i686' 'x86_64')
url="http://cadabra.science/"
license=('GPL')
conflicts=('cadabra2')
depends=(
  'boost-libs'
  'glibmm'
  'gmp'
  'gtkmm3'
  'jsoncpp'
  'mathjax'
  'pcre'
  'texlive-core'
  'python'
  'sqlite3'
)
makedepends=(
  'git'
  'boost'
  'cmake'
  'python-matplotlib'
  'python-sympy'
)
source=()
md5sums=()

prepare() {
  if \
    cd "$srcdir/${pkgname%-git}" \
    && git pull --rebase
  then : ; else
    cd "$srcdir" \
    && git clone --shallow-exclude="$_since" https://github.com/kpeeters/cadabra2.git \
    && cd cadabra2
  fi

  # git checkout "$_base"
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  rm -rf build
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSQLITE3_INCLUDE_DIR=/usr/include \
    -DENABLE_MATHEMATICA=ON
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make DESTDIR="${pkgdir}" install
}
