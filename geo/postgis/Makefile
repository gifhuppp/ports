USE_NOBTCFI-aarch64 =	Yes# fortran

V =	3.5.3
COMMENT=	geographic objects support for PostgreSQL
DISTNAME=	postgis-${V}
CATEGORIES=	geo databases

HOMEPAGE=	http://www.postgis.net/

MAINTAINER=	Landry Breuil <landry@openbsd.org>

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB += c crypto curl expat freexl gdal geos geos_c geotiff gif iconv intl
WANTLIB += jpeg json-c lz4 lzma m nghttp2 openjp2 pcre2-8 png pq>=5.3 protobuf-c zstd
WANTLIB += proj pthread qhull_r spatialite sqlite3 ssl ${COMPILER_LIBCXX} tiff webp xml2 z
WANTLIB += hdf5 hdf5_hl minizip netcdf rttopo execinfo fontconfig freetype lcms2 poppler
WANTLIB += nghttp3 ngtcp2 ngtcp2_crypto_quictls jxl jxl_cms jxl_threads zip
WANTLIB += archive b2 brotlicommon brotlidec brotlienc bz2 hwy sharpyuv blosc deflate
WANTLIB += Lerc aom arrow arrow_acero arrow_dataset avif dav1d parquet snappy thrift
WANTLIB += boost_atomic-mt boost_chrono-mt boost_filesystem-mt
WANTLIB += boost_program_options-mt boost_serialization-mt boost_system-mt
WANTLIB += boost_thread-mt boost_timer-mt boost_unit_test_framework-mt
WANTLIB += SFCGAL gmp gmpxx mpfr

COMPILER =		base-clang ports-gcc base-gcc

SITES=		http://download.osgeo.org/postgis/source/

MODULES =	databases/postgresql

LIB_DEPENDS=	databases/sqlite3 \
		geo/gdal \
		geo/sfcgal \
		devel/proj \
		devel/gettext,-runtime \
		devel/protobuf-c \
		devel/json-c
RUN_DEPENDS=	databases/postgresql,-server
BUILD_DEPENDS=	${RUN_DEPENDS} \
		devel/cunit \
		textproc/docbook-xsl>=1.79.1p0 \
		textproc/wdg-sgml-lib \
		graphics/GraphicsMagick
TEST_DEPENDS =	devel/cunit

USE_GMAKE=	Yes
USE_LIBTOOL =	Yes
#for iconv.h and https://trac.osgeo.org/postgis/ticket/4573
CONFIGURE_ENV=	LDFLAGS=-L${LOCALBASE}/lib \
		CPPFLAGS=-I${LOCALBASE}/include
CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--with-xsldir=${PREFIX}/share/xsl/docbook/ \
		--libdir=${PREFIX}/lib/postgresql

SUBST_VARS +=	V

# ImageMagick fails policy checks with the convert command used in build.
# https://trac.osgeo.org/postgis/ticket/5593
pre-build:
	ln -s ${LOCALBASE}/bin/gm ${WRKDIR}/bin/convert

post-install:
	cd ${WRKSRC}/doc && WRKINST=${WRKINST} ${MAKE_PROGRAM} docs-install man-install

.include <bsd.port.mk>
