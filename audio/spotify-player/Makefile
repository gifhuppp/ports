BROKEN-sparc64 = ring-core/target.h:64:2: error: #error Unknown target CPU

COMMENT =		Spotify TUI client

GH_ACCOUNT =		aome510
GH_PROJECT =		spotify-player
GH_TAGNAME =		v0.20.6

CATEGORIES =		audio

MAINTAINER =		Pascal Stumpf <pascal@stumpf.co>

# MIT
PERMIT_PACKAGE =	Yes

WANTLIB += ${MODCARGO_WANTLIB} crypto dbus-1 m portaudio ssl

MODULES =		devel/cargo \
			lang/clang

# needed by the build script of aws-lc-sys
BUILD_DEPENDS =		devel/cmake/core

LIB_DEPENDS =		audio/portaudio-svn \
			x11/dbus,-main

SEPARATE_BUILD =	Yes

CONFIGURE_STYLE =	cargo

# libclang needed for bindgen used from aws-lc-sys
MAKE_ENV =		LIBCLANG_PATH=/usr/local/llvm${MODCLANG_VERSION}/lib
MODCLANG_COMPILER_LINKS = no

MODCARGO_NO_DEFAULT_FEATURES = Yes
MODCARGO_FEATURES =	portaudio-backend media-control fzf
MODCARGO_INSTALL_TARGET_PATHS =	./spotify_player

.include "crates.inc"

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/spotify-player
	${INSTALL_DATA} ${WRKSRC}/examples/*.toml \
		${PREFIX}/share/examples/spotify-player

.include <bsd.port.mk>
