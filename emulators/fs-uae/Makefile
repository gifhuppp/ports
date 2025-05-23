BROKEN-alpha =		error: invalid 'asm': invalid %xn code

# Amiga FPU initialisation uses RWX pages, maybe other cases too.
# https://github.com/FrodeSolheim/fs-uae/issues/232
USE_WXNEEDED =		Yes

COMMENT =		modern Amiga emulator
V =			3.1.66
MODPY_DISTV =	${V}
DISTNAME =		fs-uae-$V
EXTRACT_SUFX =		.tar.xz
CATEGORIES =		emulators
REVISION =		0

HOMEPAGE =		https://fs-uae.net/
MAINTAINER =		Edd Barrett <edd@openbsd.org>

# GPLv2, LGPLv2.1
PERMIT_PACKAGE =	Yes

WANTLIB += GL SDL2 X11 c glib-2.0 gthread-2.0 intl m mpeg2 mpeg2convert
WANTLIB += openal png pthread ${COMPILER_LIBCXX} z

COMPILER =		base-clang ports-gcc base-gcc

SITES =			${HOMEPAGE}files/FS-UAE/Stable/$V/

BUILD_DEPENDS =		devel/gettext,-tools \
			archivers/zip
LIB_DEPENDS =		devel/sdl2 \
			graphics/png \
			graphics/libmpeg2 \
			audio/openal \
			devel/glib2
RUN_DEPENDS =		devel/desktop-file-utils \
			x11/gtk+4,-guic

CONFIGURE_STYLE =	gnu
USE_GMAKE =		Yes

.include <bsd.port.arch.mk>
.if ${PROPERTIES:Mclang}
CXXFLAGS =		-std=gnu++03
.endif

.if ${MACHINE} == "sparc64"
CXXFLAGS +=		-fpermissive
.endif

CONFIGURE_ARGS =	--disable-jit \
			--disable-slirp

# Build system fails to pass down flags to include OpenAL stuff.
CFLAGS +=		-DHAVE_AL_AL_H -DHAVE_AL_ALC_H

MAKE_FLAGS +=		prefix=${PREFIX} CXXFLAGS="${CXXFLAGS}"
MAKE_FLAGS +=		CFLAGS="${CFLAGS}" CXX="${CXX}"

NO_TEST =		Yes

.include <bsd.port.mk>
