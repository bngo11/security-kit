# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/5436c0604f8ee278ad011cecf467f4cad020ae09 -> sops-3.12.2-5436c06.tar.gz
https://direct.funtoo.org/ae/f1/34/aef1348cf0d7e452e47f50e1a8b2e14f3a6139fd35d685953132519544bc8e434020d39944addfe75b14c2f0d4d83e22e6b8671e1639cac4ae285c176ce57d3b -> sops-3.12.2-funtoo-go-bundle-a5f471213e7563040939b531613e2e2c008a646fd3fa8b1db86b859f0c58f0bbd502e698a4e18d0b3811e0427230202e534c8c1d060358ab93503bd13fb6d1c8.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-5436c06"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}