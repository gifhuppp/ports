V =		2.22.0
COMMENT =	SDL2 TrueType fonts library
DISTNAME =	SDL2_ttf-${V}
PKGNAME =	sdl2-ttf-${V}
CATEGORIES =	devel graphics fonts
REVISION =	0

SHARED_LIBS +=	SDL2_ttf		0.1 # 10.2

HOMEPAGE =	https://www.libsdl.org/projects/SDL_ttf/
MAINTAINER =	Thomas Frohwein <thfr@openbsd.org>

# zlib
PERMIT_PACKAGE=	Yes

WANTLIB += SDL2 X11 Xcursor Xext Xfixes Xi Xrandr Xrender Xss iconv
WANTLIB += m pthread samplerate sndio usbhid xcb

SITES =		https://www.libsdl.org/projects/SDL_ttf/release/

COMPILER =	base-clang ports-gcc

LIB_DEPENDS =	converters/libiconv \
		devel/sdl2

SEPARATE_BUILD =	Yes
CONFIGURE_STYLE =	gnu

pre-configure:
	${SUBST_CMD} ${WRKSRC}/sdl2_ttf-config.cmake.in

.include <bsd.port.mk>
