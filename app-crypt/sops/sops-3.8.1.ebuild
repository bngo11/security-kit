# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/47d295c3b662449b4ee664f13a3b6c665e18b011 -> sops-3.8.1-47d295c.tar.gz
https://direct.funtoo.org/3b/02/11/3b02119e34c04430a4ba55b0af56b8d890ec502b63e46722c9400dea1316348c1c7855efbb4a15593b7ce86bcb3ebc1c36915b08941818ab335698e313ccff25 -> sops-3.8.1-funtoo-go-bundle-5cf875ea4accd8e338228512ae992b7c7ede9bb44d32084f20ffbf3d90b061ebc99ca03ad1e3c0871ea25ff2efb7cc3890461b9d0860ae998646a6cdb3204eaa.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-47d295c"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}