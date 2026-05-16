# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/f78e23a8c9523be0ca02517826290efaf6eb70d5 -> sops-3.13.1-f78e23a.tar.gz
https://direct.funtoo.org/8d/34/02/8d3402ea511bfcfbce4a9756bb08734e3244198348df045f02fb197d8a55516167919d5a9be88c83bdbc94d9a43d6ff45375617c25b0cad288c27cdf4ec73825 -> sops-3.13.1-funtoo-go-bundle-3e01cd17e18916bb9639be5c48cc078eeb1852a0e30c173002d17e4cf12f8997a6d3bf2c604b41750b69d1b8cecff0c344a9c8c7caafc829252824e5f738db31.tar.gz"
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