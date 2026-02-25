# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/731259fd5f7ca60068e9f4211de6d34a9e43d88c -> sops-3.12.1-731259f.tar.gz
https://direct.funtoo.org/b9/b4/50/b9b4504ef58e441729a9f007868a6a97dc7a92eae5d9b2676bf42b69639905c20e2f0b3fae074df1fe9560b42fe26f45178fee13234eded6d1434917705e2735 -> sops-3.12.1-funtoo-go-bundle-f7a791163fe0defb03c69d69bb2786573b340c0d72f93d84f6255b654271098bc6b51a9cc28b1518b693647bbb9cca14a53ef157c470fcab1f08419f7f40cb99.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-731259f"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}