COMMENT=	common libraries for the CMU speech recognition engines

VERSION=	0.6
DISTNAME=	sphinxbase-${VERSION}
PKGNAME=	cmu-sphinxbase-${VERSION}
REVISION=	9
CATEGORIES=	audio
SHARED_LIBS= 	sphinxbase	1.0 \
		sphinxad	1.0

HOMEPAGE=	https://cmusphinx.sourceforge.net/

# CMU
PERMIT_PACKAGE=	Yes

WANTLIB += ${MODFORTRAN_WANTLIB}
WANTLIB += blas c iconv lapack m pthread sndio z

SITES=		${SITE_SOURCEFORGE:=cmusphinx/}

MODULES=	fortran
MODFORTRAN_COMPILER = gfortran


LIB_DEPENDS=	converters/libiconv \
		math/lapack \
		${MODFORTRAN_LIB_DEPENDS}

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		--without-python
CONFIGURE_ENV=		CPPFLAGS=-I${LOCALBASE}/include	\
			LDFLAGS=-L${LOCALBASE}/lib 	\
			LIBS="-lblas -lm -lgfortran -lsndio" \
			HAVE_DOXYGEN="no"

pre-build:
	@cp ${FILESDIR}/ad_sndio.c ${WRKSRC}/src/libsphinxad/

.include <bsd.port.mk>
