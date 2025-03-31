# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/ed99d172b931897597ff6afa09b2819c9b626e6d -> sops-3.10.1-ed99d17.tar.gz
https://direct.funtoo.org/97/fe/fa/97fefa876a0d622e9e7d3c926134ff82deefa9f9bff126f26f3aa3883ef310d249a9bb30b7f8280c759bf0078c14df1aaa711ab00177544c8a8acc8038f086bf -> sops-3.10.1-funtoo-go-bundle-00e37b2792b9f36c9ec6987655f23727db532b3d9e898a302d509db516e365bf8cda879d0f9de66f372c5ba07a6d77c22c25513f09147402a132c3843d8f7a3e.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-ed99d17"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}