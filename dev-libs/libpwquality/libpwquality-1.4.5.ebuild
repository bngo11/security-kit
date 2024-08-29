# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )
DISTUTILS_USE_PEP517=setuptools

inherit pam python-r1 usr-ldscript ltprune

DESCRIPTION="Library for password quality checking and generating random passwords"
HOMEPAGE="https://github.com/libpwquality/libpwquality"
SRC_URI="https://github.com/libpwquality/libpwquality/releases/download/libpwquality-1.4.5/libpwquality-1.4.5.tar.bz2 -> libpwquality-1.4.5.tar.bz2"

LICENSE="|| ( BSD GPL-2 )"
SLOT="0"
KEYWORDS="*"
IUSE="pam python static-libs"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

BDEPEND="
	>=sys-devel/gettext-0.18.2
	virtual/pkgconfig
"
RDEPEND="
	>=sys-libs/cracklib-2.8:=[static-libs(+)?]
	pam? ( sys-libs/pam )
	python? ( ${PYTHON_DEPS} )
"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	# ensure pkgconfig files go in /usr
	sed -e 's:\(pkgconfigdir *=\).*:\1 '${EPREFIX}/usr/$(get_libdir)'/pkgconfig:' \
		-i src/Makefile.{am,in} || die "sed failed"

	if use python ; then
		# bug #830397
		export DISTUTILS_USE_PEP517=setuptools
		python_copy_sources
	fi
}

src_configure() {
	# Install library in /lib for pam
	configuring() {
		local sitedir
		econf \
			--libdir="${EPREFIX}/$(get_libdir)" \
			$(use_enable pam) \
			--with-securedir="${EPREFIX}/$(getpam_mod_dir)" \
			$(use_enable python python-bindings) \
			$(usex python "--with-pythonsitedir=$(use python && python_get_sitedir)" "") \
			$(use_enable static-libs static)
	}
	if_use_python_python_foreach_impl configuring
}

src_compile() {
	if_use_python_python_foreach_impl default
}

src_test() {
	if_use_python_python_foreach_impl default
}

src_install() {
	if_use_python_python_foreach_impl default
	if use static-libs; then
		# Do not install static libs in /lib
		mkdir -p "${ED}usr/$(get_libdir)"
		mv "${ED}$(get_libdir)/libpwquality.a" "${ED}/usr/$(get_libdir)/" || die
		gen_usr_ldscript libpwquality.so
	fi
	prune_libtool_files --modules
}

if_use_python_python_foreach_impl() {
	if use python; then
		python_foreach_impl run_in_build_dir "$@"
	else
		"$@"
	fi
}