COMMENT=	CD player for X11
DISTNAME=	xcdplayer-2.2
REVISION=	6
CATEGORIES=	audio

SITES=		${SITE_R5CONTRIB}
EXTRACT_SUFX=	.tar.Z

PERMIT_PACKAGE=	Yes

WANTLIB=		ICE SM X11 Xau Xdmcp Xaw Xext Xmu Xpm Xt c

CONFIGURE_STYLE=imake
NO_TEST=	Yes

pre-patch:
	@cp ${FILESDIR}/*.[ch] ${WRKSRC}
	@mv ${WRKSRC}/xcdplayer.1 ${WRKSRC}/xcdplayer.man

.include <bsd.port.mk>
