COMMENT =	open source PS4 and PS5 remote play client

V =		v2.2.0
DISTNAME =	chiaki-${V}-src
PKGNAME =	${DISTNAME:S/-v/-/g:S/-src//g}
REVISION =	1

WRKDIST =	${WRKDIR}/chiaki

CATEGORIES =	games

HOMEPAGE =	https://git.sr.ht/~thestr4ng3r/chiaki

# AGPLv3 with OpenSSL exception
PERMIT_PACKAGE =	Yes

WANTLIB += ${COMPILER_LIBCXX} Qt5Concurrent Qt5Core Qt5Gui Qt5Multimedia
WANTLIB += Qt5Network Qt5OpenGL Qt5Svg Qt5Widgets SDL2 avcodec avutil c crypto
WANTLIB += m opus

SITES =		https://git.sr.ht/~thestr4ng3r/chiaki/refs/download/${V}/

DEBUG_PACKAGES =	${BUILD_PACKAGES}

MODULES =		devel/cmake \
			lang/python \
			x11/qt5

CONFIGURE_ARGS +=	-DCHIAKI_ENABLE_SETSU=no
BUILD_DEPENDS =		devel/protobuf-c \
			devel/py-protobuf \
			devel/py-setuptools
LIB_DEPENDS =		devel/sdl2 \
			audio/opus \
			graphics/ffmpeg \
			x11/qt5/qtmultimedia \
			x11/qt5/qtsvg
			
post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/chiaki
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/psn-account-id.py \
		${PREFIX}/share/examples/chiaki/

.include <bsd.port.mk>
