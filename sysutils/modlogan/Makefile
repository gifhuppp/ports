COMMENT=	modular log analyzer

DISTNAME=	modlogan-0.8.13
REVISION=	13
CATEGORIES=	sysutils www

HOMEPAGE=	http://jan.kneschke.de/projects/modlogan/

SITES=		${HOMEPAGE}/download/

# GPLv2+
PERMIT_PACKAGE=	Yes

WANTLIB =  ${COMPILER_LIBCXX} Lerc adns bz2 c expat fontconfig
WANTLIB += freetype gd iconv intl jpeg lzma m pcre png pthread
WANTLIB += sharpyuv tiff webp z zstd

LIB_DEPENDS=	archivers/bzip2 \
		devel/gettext,-runtime \
		devel/pcre \
		graphics/gd \
		net/adns

CONFIGURE_STYLE= gnu
CONFIGURE_ARGS+= --libdir=${PREFIX}/lib/modlogan
CONFIGURE_ENV += LOCALBASE="${LOCALBASE}" \
		 CPPFLAGS="-I${X11BASE}/include" \
		 LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib"
MAKE_FLAGS=	INTLLIBS="-L${LOCALBASE}/lib -lintl -liconv"

NO_TEST=	Yes

EXAMPLES=	doc/*.conf doc/*-dist
DOCS=		doc/*.txt 

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/modlogan
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/modlogan
	cd ${WRKSRC} && ${INSTALL_DATA} ${EXAMPLES} \
	  ${PREFIX}/share/examples/modlogan
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} \
	  ${PREFIX}/share/doc/modlogan

.include <bsd.port.mk>
