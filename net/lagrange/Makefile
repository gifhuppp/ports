COMMENT =	SDL multi protocol navigator
VERSION =	1.18.5

DISTNAME =	lagrange-${VERSION}

CATEGORIES =	net x11

MAINTAINER =	Florian Viehweger <openbsd@out-of-creativity.de>

HOMEPAGE =	https://gmi.skyjake.fi/lagrange/

# BSD 2-Clause
PERMIT_PACKAGE =Yes

WANTLIB +=	ICE SDL2 SM X11 Xext c crypto curses fribidi harfbuzz m
WANTLIB +=	mpg123 opusfile pcre2-8 pthread ssl unistring webp z

DEBUG_PACKAGES =${BUILD_PACKAGES}

SITES =	https://git.skyjake.fi/skyjake/lagrange/releases/download/v${VERSION}/

COMPILER =	base-clang ports-gcc
COMPILER_LANGS=	c

MODULES =	devel/cmake

BUILD_DEPENDS =	archivers/zip

RUN_DEPENDS =	devel/desktop-file-utils \
		x11/gtk+4,-guic

LIB_DEPENDS =	audio/mpg123 \
		audio/opusfile \
		converters/libunistring \
		devel/fribidi \
		devel/harfbuzz \
		devel/pcre2 \
		devel/sdl2 \
		graphics/libwebp

CONFIGURE_ARGS +=	-DCMAKE_DISABLE_FIND_PACKAGE_Git=TRUE \
			-DENABLE_GUI=TRUE \
			-DENABLE_TUI=TRUE

# Don't enable SSE4.1, it fails at runtime on old amd64 machines and i386
CONFIGURE_ARGS +=	-DTFDN_ENABLE_SSE41=No

NO_TEST =	Yes

.include <bsd.port.mk>
