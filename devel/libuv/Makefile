COMMENT =	multi-platform library for asynchronous I/O

VER =		1.49.2
DISTNAME =	libuv-v${VER}
PKGNAME =	libuv-${VER}
CATEGORIES =	devel

SHARED_LIBS +=  uv                   5.0      # 1.0

HOMEPAGE =	https://libuv.org/

SITES =		https://dist.libuv.org/dist/v${VER}/

# BSD
PERMIT_PACKAGE = Yes

WANTLIB += pthread

# stdatomic.h
COMPILER =	base-clang ports-gcc
COMPILER_LANGS = c

BUILD_DEPENDS =	textproc/py-sphinx

DEBUG_PACKAGES = ${BUILD_PACKAGES}

USE_GMAKE =	Yes

CONFIGURE_STYLE = autoreconf
CONFIGURE_ENV =	cc_cv_cflags__g=no

AUTOCONF_VERSION = 2.71
AUTOMAKE_VERSION = 1.16
AUTORECONF =	sh autogen.sh

MAKE_FLAGS =	SPHINXOPTS=--no-color

post-build:
	cd ${WRKSRC} && ${MAKE_ENV} ${MAKE_PROGRAM} man -C docs

post-install:
	${INSTALL_MAN} ${WRKSRC}/docs/build/man/libuv.1 ${PREFIX}/man/man1/

.include <bsd.port.mk>
