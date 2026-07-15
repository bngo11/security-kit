# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="nwipe secure disk eraser"
HOMEPAGE="https://github.com/martijnvanbrummelen/nwipe"
SRC_URI="https://github.com/martijnvanbrummelen/nwipe/tarball/6082bde060091e66365d852a1877f2ee80c67105 -> nwipe-0.42-6082bde.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="smartmontools"

RDEPEND="
	sys-apps/dmidecode
	sys-block/parted
	sys-libs/ncurses:=
	smartmontools? ( sys-apps/smartmontools )
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
			mv martijnvanbrummelen-nwipe* "${S}" || die
	fi
}

src_prepare() {
	default
	eautoreconf
}