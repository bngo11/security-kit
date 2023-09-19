# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/61f4b939b069cc45daa517bd4a968a335ff7ec30 -> sops-3.8.0-61f4b93.tar.gz
https://direct.funtoo.org/26/6d/ab/266dabe3855f13b8ae9db241573292dafc735f621a97b147e2fe6ad2fe07df741fb4a53c57cb292a185e3a87a325f4ba54116308191ea5cc9c12a1a770f192ff -> sops-3.8.0-funtoo-go-bundle-5203dd154baabbad2eb8469bb753b688c19fc054b9e840228e9bec4d443b1546a54e94ac99a0f98701941e9e97666e6334075a9fe48957a55d58b8a6ec5ab147.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-61f4b93"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}