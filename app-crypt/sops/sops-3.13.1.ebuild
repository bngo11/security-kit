# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/f78e23a8c9523be0ca02517826290efaf6eb70d5 -> sops-3.13.1-f78e23a.tar.gz
https://direct.funtoo.org/b9/5c/bc/b95cbcc243e33cf8e469b5f27cf8a7ff48e9677568abacc3cec8e92c12766c4201e9fa2c0c89e5d58e122f2689ee750dffa077b8ad98ff6f2575e63e4fdf038c -> sops-3.13.1-funtoo-go-bundle-3e01cd17e18916bb9639be5c48cc078eeb1852a0e30c173002d17e4cf12f8997a6d3bf2c604b41750b69d1b8cecff0c344a9c8c7caafc829252824e5f738db31.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-f78e23a"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}