COMMENT=	G.729a voice codec for Asterisk
DISTNAME=	asterisk-g72x-1.4.4
PKGNAME=	${DISTNAME:S/g72x/g729/}
REVISION=	0
EXTRACT_SUFX=	.tar.bz2
CATEGORIES=	telephony
SITES=		http://asterisk.hosting.lv/src/

# https://github.com/arkadijs/asterisk-g72x
HOMEPAGE=	http://asterisk.hosting.lv/

# GPLv3+ frontend to patented algorithm; free to use for non-commercial purposes
PERMIT_DISTFILES=	tar contains non-compiled proprietary Intel code in ipp/ dir
PERMIT_PACKAGE=		Yes

WANTLIB += bcg729

NO_TEST=	Yes

# keep in sync with telephony/asterisk
COMPILER=	base-clang ports-gcc
COMPILER_LANGS=	c

AUTOCONF_VERSION= 2.69
AUTOMAKE_VERSION= 1.16

DEBUG_PACKAGES=	${BUILD_PACKAGES}

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	telephony/asterisk/20
LIB_DEPENDS=	telephony/bcg729

CONFIGURE_STYLE=  autoreconf
CONFIGURE_ARGS+= --with-asterisk-includes=${LOCALBASE}/include \
		--with-asterisk160 \
		--with-bcg729
CONFIGURE_ENV=	LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib"
LIBTOOL_FLAGS=	--tag=disable-static
AUTORECONF=	./autogen.sh

# to build astconv (when fixed for ast13+ API):
#post-build:
#	cd ${WRKSRC}; ${MAKE_PROGRAM} astconv CPPFLAGS=-I${LOCALBASE}/include \
#	    CFLAGS="${CFLAGS} -D_GNU_SOURCE -Wall -rdynamic" LDFLAGS=-lm

.include <bsd.port.arch.mk>

.if ${PROPERTIES:Mclang}
CFLAGS +=	-fblocks
LDFLAGS +=	-lBlocksRuntime
LIB_DEPENDS +=	devel/libdispatch
WANTLIB +=	BlocksRuntime
.endif

.include <bsd.port.mk>
