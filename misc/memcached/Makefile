COMMENT=	distributed memory object caching system

DISTNAME=	memcached-1.6.38
CATEGORIES=	misc

# https://github.com/memcached/memcached
HOMEPAGE=	https://www.memcached.org/

MAINTAINER=	Giovanni Bechis <giovanni@openbsd.org>

# BSD
PERMIT_PACKAGE=	Yes

# uses pledge()
WANTLIB += c crypto event pthread ssl event_core

FLAVOR?=
FLAVORS=	sasl

SITES=		https://memcached.org/files/

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=		--disable-coverage \
			--disable-docs \
			--disable-werror \
			--enable-tls
# binary.t very slow on some systems (after printing "# Some chunked item tests")
TEST_TARGET=		test
LIB_DEPENDS=		devel/libevent2

.if ${FLAVOR:Msasl}
CONFIGURE_ARGS+=	--enable-sasl
LIB_DEPENDS+=		security/cyrus-sasl2
WANTLIB+=		sasl2
.else
CONFIGURE_ARGS+=	--disable-sasl
.endif

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/memcached
	${INSTALL_DATA} ${WRKSRC}/doc/*.txt ${PREFIX}/share/doc/memcached
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/memcached-tool ${PREFIX}/bin/memcached-tool
	${INSTALL_DATA} ${WRKSRC}/scripts/memcached-tool.1 ${PREFIX}/man/man1/

.include <bsd.port.mk>
