# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/47d295c3b662449b4ee664f13a3b6c665e18b011 -> sops-3.8.1-47d295c.tar.gz
https://direct.funtoo.org/a1/bf/c8/a1bfc84a6b1644b9c3c0f5ab25302997149da8ae472b688afa770bc01f273ceb20b315675df10ade7dd253c6eb48300e45c453758866405704104632698ef86a -> sops-3.8.1-funtoo-go-bundle-5cf875ea4accd8e338228512ae992b7c7ede9bb44d32084f20ffbf3d90b061ebc99ca03ad1e3c0871ea25ff2efb7cc3890461b9d0860ae998646a6cdb3204eaa.tar.gz"
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