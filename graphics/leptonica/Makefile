COMMENT=	image processing and analysis library

DISTNAME=	leptonica-1.85.0

SHARED_LIBS +=  leptonica            0.2      # 6.0

CATEGORIES=	graphics

HOMEPAGE=	http://www.leptonica.org/

# BSD-like (see leptonica-license.txt in WRKSRC)
PERMIT_PACKAGE=	Yes

WANTLIB += c gif jpeg m openjp2 png tiff webp webpmux z

SITES=		${HOMEPAGE}/source/

LIB_DEPENDS=	graphics/libwebp \
		graphics/giflib \
		graphics/openjp2 \
		graphics/tiff

TEST_DEPENDS=	shells/bash \
		math/gnuplot

CONFIGURE_STYLE=autoconf
AUTOCONF_VERSION=2.69
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -lm -lz"

.include <bsd.port.mk>
