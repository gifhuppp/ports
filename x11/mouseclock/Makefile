COMMENT=	display the current time using the X11 root cursor

DISTNAME=	mouseclock-1.0
REVISION=	0
CATEGORIES=	x11

SITES=		${SITE_SUNSITE:=X11/clocks/}

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB=	X11 Xau Xdmcp Xext c 


CONFIGURE_STYLE=	imake noman
XMKMF=		xmkmf

NO_TEST=	Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/mouseclock
	${INSTALL_MAN} ${WRKSRC}/README ${PREFIX}/share/doc/mouseclock

.include <bsd.port.mk>
