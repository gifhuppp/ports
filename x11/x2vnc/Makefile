COMMENT=	one keyboard and/or mouse, multiple X and VNC displays

DISTNAME=	x2vnc-1.6.1
REVISION=	3
CATEGORIES=	x11

# GPL
PERMIT_PACKAGE=	Yes

WANTLIB=	X11 Xau Xdmcp Xext Xss c

SITES=		http://fredrik.hubbe.net/x2vnc/

HOMEPAGE=	http://fredrik.hubbe.net/x2vnc.html

CONFIGURE_STYLE=	imake

ALL_TARGET=	x2vnc x2vnc._man

NO_TEST=	Yes

do-install:
	${INSTALL_MAN} ${WRKSRC}/x2vnc._man ${PREFIX}/man/man1/x2vnc.1
	${INSTALL_PROGRAM} ${WRKSRC}/x2vnc ${PREFIX}/bin

.include <bsd.port.mk>
