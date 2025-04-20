# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/be6df93d68dddb481c5d1bc8e4b255c5c00fde2c -> sops-3.10.2-be6df93.tar.gz
https://direct.funtoo.org/93/90/13/9390130ae0f9cc99dc831e6573a7ff36f1e4e68c7f8555ad25f4551177698652651f1c40d9633ce2b4eb6bdfd2bd322ce2231806e31a666a68a3da9008fc87fa -> sops-3.10.2-funtoo-go-bundle-d29ad94b704cb073f83366bbc6d522f75ff9d23cdc3e6010ee1929972120a5139205fefd8c2cdca70118c3c8563c5b3c95be48e224a8dbf61d88a494f40896b0.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-be6df93"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}