COMMENT=	network head-to-head version of T*tris

DISTNAME=	netris-0.52
REVISION=	3
CATEGORIES=	games

SITES=		https://distfiles.gentoo.org/distfiles/

# GPL
PERMIT_PACKAGE=	Yes

WANTLIB += c curses

CONFIGURE_STYLE=	simple
CONFIGURE_SCRIPT=	Configure
CONFIGURE_ARGS=		--cc "${CC}" --copt "${CFLAGS}"

NO_TEST=	Yes

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/netris ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKBUILD}/sr ${PREFIX}/bin/sample-robot
	${INSTALL_MAN} ${FILESDIR}/netris.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
