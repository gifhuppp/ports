BROKEN-sparc64 = error: 'u8string' in namespace 'std' does not name a type

COMMENT =	family-friendly bronze age kart game

V =		3.0.1
PKGNAME =	cromagrally-${V}
DISTNAME =	CroMagRally-${V}
DIST_TUPLE +=	github jorio CroMagRally ${V} .
DIST_TUPLE +=	github jorio Pomme ef94150e2dcec522e3099f4d03a4e8f2639f7232 \
		extern/Pomme

CATEGORIES =	games

HOMEPAGE =	https://pangeasoft.net/cromag

MAINTAINER =	izzy Meyer <izder456@disroot.org>

# game: CC BY-NC-SA 4.0; extern/Pomme: MIT, LGPLv2.1, BSD, Boost
PERMIT_PACKAGE = Yes

WANTLIB +=	${COMPILER_LIBCXX} GL SDL2 c m

# C++20
COMPILER =	base-clang ports-gcc

MODULES =	devel/cmake

LIB_DEPENDS =	devel/sdl2
RUN_DEPENDS =	devel/desktop-file-utils \
		x11/gtk+4,-guic

CFLAGS +=	-I${X11BASE}/include
CXXFLAGS +=	-I${X11BASE}/include

CONFIGURE_ARGS += -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=${LOCALBASE}

pre-configure:
	${SUBST_CMD} ${WRKSRC}/Source/Boot.cpp

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/CroMagRally/
	${INSTALL_DATA} ${WRKSRC}/*.md ${PREFIX}/share/doc/CroMagRally/
	${INSTALL_PROGRAM} ${WRKBUILD}/CroMagRally ${PREFIX}/bin/
	cp -R ${WRKBUILD}/Data ${PREFIX}/share/cromagrally
	${INSTALL_DATA_DIR} ${PREFIX}/share/icons/hicolor/512x512/apps/ \
		${PREFIX}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/packaging/io.jor.cromagrally.png \
		${PREFIX}/share/icons/hicolor/512x512/apps/
	${INSTALL_DATA} ${WRKSRC}/packaging/io.jor.cromagrally.desktop \
		${PREFIX}/share/applications/

.include <bsd.port.mk>
