COMMENT=		media aggregator and podcast client

MODPY_EGG_VERSION=	3.11.4
REVISION=		2

GH_ACCOUNT=		gpodder
GH_PROJECT=		gpodder
GH_TAGNAME=		${MODPY_EGG_VERSION}

CATEGORIES=		net www

HOMEPAGE=		https://gpodder.github.io/

MAINTAINER=		Tim Meunier <trondd@kagu-tsuchi.com>

# GPLv3+
PERMIT_PACKAGE=		Yes

MODULES=		lang/python \
			textproc/intltool

TEST_ENV=		PYTEST=py.test

RUN_DEPENDS=		devel/desktop-file-utils \
			devel/gettext,-runtime \
			devel/py-html5lib${MODPY_FLAVOR} \
			devel/py-gobject3${MODPY_FLAVOR} \
			www/py-requests${MODPY_FLAVOR} \
			net/mygpoclient \
			textproc/py-podcastparser${MODPY_FLAVOR} \
			www/yt-dlp \
			www/webkitgtk4 \
			x11/dbus-python${MODPY_FLAVOR} \
			x11/gtk+4,-guic
TEST_DEPENDS=		devel/py-coverage${MODPY_FLAVOR} \
			devel/py-minimock${MODPY_FLAVOR} \
			devel/py-test${MODPY_FLAVOR} \
			devel/py-test-cov${MODPY_FLAVOR} \
			textproc/py-podcastparser${MODPY_FLAVOR} \
			net/mygpoclient

USE_GMAKE=		Yes
MAKE_FILE=		makefile
MAKE_ENV=		LC_CTYPE=en_US.UTF-8 \
			PYTHON=${MODPY_BIN} \
			GPODDER_MANPATH_NO_SHARE="yes"

ALL_TARGET=		messages

TEST_TARGET=		unittest

do-install:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} DESTDIR=/ ${MAKE_PROGRAM} \
		-f ${MAKE_FILE} install
	sed -i s,${PREFIX},${TRUEPREFIX}, \
		${PREFIX}/share/applications/*.desktop
	${MODPY_COMPILEALL} ${PREFIX}/share/gpodder/extensions/

.include <bsd.port.mk>
