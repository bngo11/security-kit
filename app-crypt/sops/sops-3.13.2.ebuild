# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/cb95a590d8f201b852670791bdfbcc462086272f -> sops-3.13.2-cb95a59.tar.gz
https://direct.funtoo.org/9f/05/e1/9f05e1fd931ace106c4d27e3327d67b9dfab52410315fed4256c79f65a3d3830ad475d8b4c3512a804dbcc1b591c29e2a998066984138580ed02ccf443e51da8 -> sops-3.13.2-funtoo-go-bundle-ad2b1948c1c10dde7013e161935a038a936182fbf646d0ab36fa4a1f6d803d1d493719fd1a702d9fcd967aa60210fb0d2023d8fe34ec7cccf11e283b21984369.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-cb95a59"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}