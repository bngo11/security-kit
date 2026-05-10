# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/7fe6e4c2a5adf7d2829b1251fa746f1bc294622d -> sops-3.13.0-7fe6e4c.tar.gz
https://direct.funtoo.org/e1/c9/86/e1c986cba950e9007649ee6cf61469bc37069187e3c04209ba416073b7bd972081161830521d13de99676a2d5589813d011ac4be9e97e3747fcd2e5d8ef94f55 -> sops-3.13.0-funtoo-go-bundle-2ab9aa77ccbf9393ec1a0d310d709efdf389abadac8cf60e60373af0ce75c12c1b8332ae2fb5c214e18fe451c37d15760f520fe5db41a193fe8b2adb81355c65.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-7fe6e4c"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}