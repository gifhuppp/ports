ONLY_FOR_ARCHS =	${GO_ARCHS}

COMMENT =	fast and flexible static site generator

MODGO_MODNAME =	github.com/gohugoio/hugo
MODGO_VERSION =	v0.148.2

DISTNAME =	hugo-${MODGO_VERSION}

CATEGORIES =	www

HOMEPAGE =	https://gohugo.io/

MAINTAINER =	Kirill A. Korinsky <kirill@korins.ky>

# Apache License 2.0
PERMIT_PACKAGE =	Yes

WANTLIB +=	${COMPILER_LIBCXX} c m pthread sass

COMPILER =	base-clang ports-gcc

MODULES =	lang/go

# has tests, but wants to use "mage" to run them
NO_TEST =	Yes

ALL_TARGET =	github.com/gohugoio/hugo

SEPARATE_BUILD =	Yes

MODGO_FLAGS +=	--tags extended,withdeploy
LIB_DEPENDS +=	www/libsass
MAKE_ENV +=	CGO_CPPFLAGS='-I${LOCALBASE}/include -DUSE_LIBSASS_SRC' CGO_LDFLAGS='-L${LOCALBASE}/lib -lm -lsass'

post-build:
	cd ${MODGO_WORKSPACE}/bin && ./hugo gen man

do-install:
	${INSTALL_PROGRAM} ${MODGO_WORKSPACE}/bin/hugo ${PREFIX}/bin/
	${INSTALL_MAN} ${MODGO_WORKSPACE}/bin/man/*.1 ${PREFIX}/man/man1/

.include "modules.inc"

.include <bsd.port.mk>
