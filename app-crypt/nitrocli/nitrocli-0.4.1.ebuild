# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 cargo

DESCRIPTION="A command line tool for interacting with Nitrokey devices."
HOMEPAGE="https://github.com/d-e-s-o/nitrocli"
SRC_URI="https://github.com/d-e-s-o/nitrocli/tarball/c54a65831453bf334e75438ac22e18e5cde724d7 -> nitrocli-0.4.1-c54a658.tar.gz
https://direct.funtoo.org/f8/ad/a9/f8ada9261f75a5db9d00c228c7ae6bf0d1004de8081b959cc2785d81e9dc7894c1a5db86cc49b035405b6facc09918f1f35ee970ea90d32ea496e82b60e691e8 -> nitrocli-0.4.1-funtoo-crates-bundle-81e81e494ffc0a8fd33e2a22539679b4d103ca693965c663e725d3e2eeaf5ed6a0cf966ff4945a0d0e388ec44443f1c7ae58ce0001dd7cd2c024ac3c57fbe41e.tar.gz"

LICENSE="Apache-2.0 BSD-2 CC0-1.0 GPL-3+ LGPL-3 MIT"
SLOT="0"
KEYWORDS="*"

DEPEND="
	dev-libs/hidapi
"
# We require gnupg for /usr/bin/gpg-connect-agent.
RDEPEND="
	${DEPEND}
	app-crypt/gnupg
"
BDEPEND="virtual/rust"

DOCS=( README.md CHANGELOG.md )

# Uses a plugged-in Nitrokey and runs tests on it. These tests assumes a
# pristine configuration and will modify the device's state. Not meant
# to be run as part of the installation.
RESTRICT="test"
QA_FLAGS_IGNORED="/usr/bin/nitrocli"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/d-e-s-o-nitrocli-* ${S} || die
}

src_install() {
	cargo_src_install --bin=nitrocli
	einstalldocs

	target/release/shell-complete bash > nitrocli.bash || die
	newbashcomp nitrocli.bash ${PN}

	doman "doc/nitrocli.1"
}