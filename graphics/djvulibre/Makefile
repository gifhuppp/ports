COMMENT=	view, decode and encode DjVu files

DISTNAME=	djvulibre-3.5.28
REVISION=	4
SHARED_LIBS=	djvulibre	27.0	# 28.0
CATEGORIES=	graphics print

HOMEPAGE=	https://djvu.sourceforge.net/

# GPLv2
PERMIT_PACKAGE=	Yes

SITES=		${SITE_SOURCEFORGE:=djvu/}

WANTLIB=	Lerc c iconv m jpeg pthread ${COMPILER_LIBCXX} tiff z lzma zstd

COMPILER=	base-clang ports-gcc base-gcc

LIB_DEPENDS=	converters/libiconv \
		graphics/jpeg \
		graphics/tiff

RUN_DEPENDS+=	x11/gtk+4,-guic

BUILD_DEPENDS+=	x11/gnome/librsvg

USE_GMAKE=	Yes

AUTOCONF_VERSION=	2.69

CONFIGURE_STYLE=	autoconf
CONFIGURE_ARGS=		--with-extra-includes=${LOCALBASE}/include \
			--with-jpeg=${LOCALBASE} \
			--with-tiff=${LOCALBASE}
CONFIGURE_ENV+=		LDFLAGS='${LDFLAGS} -L${LOCALBASE}/lib -liconv'

NO_TEST=	Yes

.include <bsd.port.mk>
