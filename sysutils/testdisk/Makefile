COMMENT =	data recovery software

VERSION =	7.2
DISTNAME =	testdisk-${VERSION}
CATEGORIES =	sysutils

HOMEPAGE =	https://www.cgsecurity.org/
SITES =		${HOMEPAGE}
EXTRACT_SUFX =	.tar.bz2

MAINTAINER =	Landry Breuil <landry@openbsd.org>

# GPLv2
PERMIT_PACKAGE =	Yes

COMPILER =		base-clang ports-gcc
COMPILER_LANGS =	c

WANTLIB += c com_err curses ext2fs iconv jpeg ntfs-3g uuid z

SUBST_VARS +=		VERSION

CONFIGURE_STYLE =	gnu
CONFIGURE_ENV =		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib -luuid"
CONFIGURE_ARGS =	--disable-qt

LIB_DEPENDS =		converters/libiconv \
			sysutils/e2fsprogs>=1.42.7 \
			sysutils/ntfs-3g \
			graphics/jpeg


post-install:
			${INSTALL_DATA} ${WRKSRC}/documentation.html ${PREFIX}/share/doc/testdisk/
			# we disable qt, no need for those
			rm -Rf ${PREFIX}/share/icons/ ${PREFIX}/man/man8/qphotorec.8 ${PREFIX}/man/zh_CN/

.include <bsd.port.mk>
