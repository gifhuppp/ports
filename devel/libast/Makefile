COMMENT=		library of assorted spiffy things

DISTNAME=		libast-0.7
PKGNAME=		${DISTNAME}
REVISION =		12
SHARED_LIBS +=	ast                  3.0      # .2.1
CATEGORIES=		devel

HOMEPAGE=		https://eterm.sourceforge.net/

# BSD
PERMIT_PACKAGE=	Yes

WANTLIB += ICE Imlib2 SM X11 X11-xcb Xext freetype m pcre pthread
WANTLIB += xcb xcb-shm z

SITES=			http://www.eterm.org/download/

LIB_DEPENDS=		devel/pcre \
			graphics/imlib2

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	LDFLAGS=-L${LOCALBASE}/lib

.include <bsd.port.mk>
