COMMENT =		calculate and print calendars

DISTNAME =		gcal-4.1
CATEGORIES =		astro
REVISION =		1

HOMEPAGE =		https://www.gnu.org/software/gcal/
MAINTAINER =		Brian Callahan <bcallah@openbsd.org>

# GPLv2+
PERMIT_PACKAGE = Yes

SITES =			${SITE_GNU:=gcal/}

BUILD_DEPENDS =		devel/gettext,-tools
LIB_DEPENDS =		converters/libunistring \
			devel/gettext,-runtime

WANTLIB =  c curses iconv intl m pthread unistring

CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS =	--enable-easc \
			--enable-libunistring
CONFIGURE_ENV =		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib -lunistring"

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/gcal
	${INSTALL_DATA} ${WRKBUILD}/data/gcalrc ${PREFIX}/share/examples/gcal
	${INSTALL_DATA} ${WRKBUILD}/data/*.rc ${PREFIX}/share/examples/gcal
	rm ${PREFIX}/lib/charset.alias

.include <bsd.port.mk>
