COMMENT =		graphical toolkit for Tcl

P =			16
DISTNAME =		tk8.6.${P}
PKGNAME =		tk-8.6.${P}
SHARED_LIBS =		tk86 1.${P}
CATEGORIES =		x11 x11/tk
HOMEPAGE =		http://www.tcl-lang.org/
MAINTAINER =		Stuart Cassoff <stwo@users.sourceforge.net>

# BSD
PERMIT_PACKAGE =	Yes

WANTLIB =		X11 Xext Xft Xss c fontconfig freetype m pthread tcl86 z

SITES =			${SITE_SOURCEFORGE:=tcl/}
DISTFILES =		${DISTNAME}-src.tar.gz

LIB_DEPENDS =		tcl-8.6.${P}:lang/tcl/8.6

MAKE_FLAGS +=		TK_LIBRARY='$$(prefix)/lib/tcl/tk$$(VERSION)' \
			TCL_GENERIC_DIR='${LOCALBASE}/include/tcl8.6' \
			TCL_PLATFORM_DIR='$$(TCL_GENERIC_DIR)'

FAKE_FLAGS =		INSTALL_DATA_DIR="${INSTALL_DATA_DIR}" \
			INSTALL_LIBRARY="${INSTALL_DATA}" \
			INSTALL_DATA="${INSTALL_DATA}" \
			INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
			CONFIG_INSTALL_DIR='$$(SCRIPT_INSTALL_DIR)' \
			DEMO_INSTALL_DIR="${WRKINST}${TRUEPREFIX}/share/examples/tk8.6" \
			TK_PKG_DIR='tcl/tk$$(VERSION)'

TEST_FLAGS =		HOME=${TESTHOME} TESTFLAGS="${TESTFLAGS}"
SEPARATE_BUILD =	Yes
CONFIGURE_STYLE =	gnu old

CONFIGURE_ARGS +=	--includedir="${PREFIX}/include/tk8.6" \
			--mandir="${PREFIX}/lib/tcl/tk8.6/man" \
			--sysconfdir="${SYSCONFDIR}" \
			--enable-man-symlinks \
			--disable-rpath \
			--with-tcl="${LOCALBASE}/lib/tcl/tcl8.6" \
			SHLIB_VERSION="${LIBtk86_VERSION}"

TEST_IS_INTERACTIVE =	X11
WRKSRC =		${WRKDIST}/unix
TEST_TARGET =		test

TESTHOME =		${WRKDIR}/testhome

# Use TESTFLAGS to control the Tk tests
TESTFLAGS =

pre-test:
	mkdir -p ${TESTHOME}

.include <bsd.port.mk>
