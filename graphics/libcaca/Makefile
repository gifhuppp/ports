COMMENT=		color ascii art library

V=			0.99.beta20
DISTNAME=		libcaca-${V}
PKGNAME=		${DISTNAME:S/beta//}
REVISION =		1
SHARED_LIBS +=	caca	2.0 # .0.99
CATEGORIES=		graphics

HOMEPAGE=		http://caca.zoy.org/wiki/libcaca

# LGPLv2.1/Do What The Fuck You Want To Public License
PERMIT_PACKAGE=	Yes

WANTLIB=		c curses m pthread z

SITES=		https://github.com/cacalabs/libcaca/releases/download/v${V}/

FLAVORS=		no_x11
FLAVOR?=

.if ${FLAVOR:Mno_x11}
CONFIGURE_ARGS+=	--disable-x11 \
			--disable-imlib2
.else
LIB_DEPENDS =    	graphics/imlib2
WANTLIB +=		X11 X11-xcb Xext freetype xcb xcb-shm Imlib2>=1
.endif

MAKE_FLAGS=		V=1

CONFIGURE_STYLE= 	gnu
CONFIGURE_ARGS+=	--disable-doc \
			--disable-slang \
			--disable-ruby \
			--disable-java \
			--disable-csharp \
			--disable-cxx \
			--disable-zzuf \
			--disable-cppunit

# Tests are bogus: assume gmake, assume Windows.
NO_TEST =		Yes

.include <bsd.port.mk>
