# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit toolchain-funcs multilib-minimal

MY_PV="${PV//_/-}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="SELinux binary policy representation library"
HOMEPAGE="https://github.com/SELinuxProject/selinux/wiki"
SRC_URI="https://github.com/SELinuxProject/selinux/releases/download/${MY_PV}/${MY_P}.tar.gz"

KEYWORDS="*"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
SLOT="0/2"

# tests are not meant to be run outside of the full SELinux userland repo
RESTRICT="test"

src_prepare() {
	eapply_user
	multilib_copy_sources
}

multilib_src_compile() {
	tc-export CC AR RANLIB

	local -x CFLAGS="${CFLAGS} -fno-semantic-interposition"

	emake \
		LIBDIR="\$(PREFIX)/$(get_libdir)" \
		SHLIBDIR="/$(get_libdir)"
}

multilib_src_install() {
	emake DESTDIR="${D}" \
		LIBDIR="\$(PREFIX)/$(get_libdir)" \
		SHLIBDIR="/$(get_libdir)" \
		install
}
