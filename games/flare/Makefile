COMMENT-main =		free/libre action roleplaying engine
COMMENT-data =		free/libre action roleplaying engine data
REVISION-data =		1
REVISION-main =		0

V = 			1.14
DISTNAME = 		flare.${V}
PKGNAME =		flare-${V}

CATEGORIES =		games

HOMEPAGE =		https://flarerpg.org/

# code GPLv3+, data CC BY-SA 3.0+
PERMIT_PACKAGE =	Yes

MAINTAINER =		Kirill Bychkov <kirby@openbsd.org>

WANTLIB-main += SDL2 SDL2_image SDL2_mixer SDL2_ttf c m pthread
WANTLIB-main += ${COMPILER_LIBCXX}

COMPILER =		base-clang ports-gcc

SITES =			${SITE_SOURCEFORGE:=flare-game/}
DISTFILES = 		flare-engine-v${V}${EXTRACT_SUFX} \
			flare-game-v${V}${EXTRACT_SUFX}

MODULES =		devel/cmake
RUN_DEPENDS-main =	devel/desktop-file-utils \
			games/flare,-data \
			x11/gtk+4,-guic
LIB_DEPENDS-main =	devel/sdl2-image \
			devel/sdl2-mixer \
			devel/sdl2-ttf

CONFIGURE_ARGS =	-DBINDIR=bin \
			-DDATADIR=share/flare \
			-DMANDIR=man

MULTI_PACKAGES = 	-main -data
PKG_ARCH-data = 	*

NO_TEST =		Yes

WRKDIST	= 		${WRKDIR}/flare-engine-v${V}

post-extract:
	@sed -i -e "s,\@FLARE_EXECUTABLE_PATH@,flare,g" \
		${WRKSRC}/distribution/flare.desktop.in
post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/applications/
	${INSTALL_DATA_DIR} ${PREFIX}/share/icons/hicolor/scalable/apps/
	${INSTALL_DATA}  ${WRKSRC}/distribution/flare.desktop.in \
		${PREFIX}/share/applications/flare.desktop
	${INSTALL_DATA}  ${WRKSRC}/distribution/flare_logo.svg \
		${PREFIX}/share/icons/hicolor/scalable/apps/flare.svg
	cd ${WRKDIR}/flare-game-v${V}/mods \
		&& pax -rw . ${PREFIX}/share/flare/mods/

.include <bsd.port.mk>
