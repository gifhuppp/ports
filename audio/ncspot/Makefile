# ring-v0.17 does not support this arch
NOT_FOR_ARCHS =         sparc64

# missing landing pads and xonly violations
# aws-lc-rs 1.10.0, aws-lc-sys 0.22.0
USE_NOBTCFI =		Yes
USE_NOEXECONLY =	Yes

FIX_EXTRACT_PERMISSIONS = Yes

COMMENT =		ncurses Spotify client

GH_ACCOUNT =		hrkfdn
GH_PROJECT =		ncspot
GH_TAGNAME =		v1.2.1
REVISION =		1

CATEGORIES =		audio

# BSD
PERMIT_PACKAGE =	Yes

WANTLIB +=		${MODCARGO_WANTLIB} crypto curses dbus-1 m portaudio ssl

MODULES =		devel/cargo \
			lang/clang

# Needed by the build script of aws-lc-sys
BUILD_DEPENDS =		devel/cmake/core

LIB_DEPENDS=		audio/portaudio-svn \
			x11/dbus,-main

# libclang needed for bindgen used from aws-lc-sys
MAKE_ENV =		LIBCLANG_PATH=/usr/local/llvm${MODCLANG_VERSION}/lib
MODCLANG_COMPILER_LINKS = no

SEPARATE_BUILD =	Yes
NO_TEST =		Yes

CONFIGURE_STYLE =	cargo

MODCARGO_NO_DEFAULT_FEATURES =	Yes
MODCARGO_FEATURES =	cursive/termion-backend \
			mpris \
			portaudio_backend

.include "crates.inc"

post-patch:
	cp ${FILESDIR}/cpu_aarch64_openbsd.c ${MODCARGO_VENDOR_DIR}/aws-lc-sys-0.22.0/aws-lc/crypto/fipsmodule/cpucap/

DOCDIR =	${PREFIX}/share/doc/ncspot/

post-install:
	${INSTALL_DATA_DIR} ${DOCDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md ${DOCDIR}

.include <bsd.port.mk>
