COMMENT=		command-line podcast downloader

DISTNAME=		castget-2.0.1
CATEGORIES=		net
REVISION=		2

HOMEPAGE=		https://castget.johndal.com/

SITES=			${SITE_SAVANNAH:=castget/}

EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		Caspar Schutijser <caspar@schutijser.com>

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB =  c crypto curl glib-2.0 iconv id3 intl lzma m nghttp2 nghttp3
WANTLIB += ngtcp2 ngtcp2_crypto_quictls pcre2-8 pthread ssl xml2 z

COMPILER=		base-clang ports-gcc base-gcc
COMPILER_LANGS=		c

LIB_DEPENDS=            audio/id3lib \
			devel/glib2 \
			net/curl \
			textproc/libxml

CONFIGURE_STYLE=        gnu
CONFIGURE_ENV=          CPPFLAGS="-lm -I${LOCALBASE}/include" \
                        LDFLAGS="-L${LOCALBASE}/lib"

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/castget
	${INSTALL_DATA} ${WRKSRC}/castgetrc.example \
		${PREFIX}/share/examples/castget

.include <bsd.port.mk>
