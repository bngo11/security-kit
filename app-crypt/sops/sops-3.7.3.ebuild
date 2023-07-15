# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/e1edc059487ddd14236dfe47267b05052f6c20b4 -> sops-3.7.3-e1edc05.tar.gz
https://direct.funtoo.org/4d/c4/24/4dc424c4a9094077237de5274325a82c68178fa9a7991b74303c4137b666516fe2684c78b2815c75a9360b5ab1ec9cb3c07168b6ba0e3ce8cf059617974206d8 -> sops-3.7.3-funtoo-go-bundle-d0ebadd07f3b6ea56568cc6980108daed6918d0e4a8bb792837caea24f96e377fb644967923f7b90242503469501042d13239b0761f75f1c2b21d35e4dd53ebc.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-e1edc05"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}