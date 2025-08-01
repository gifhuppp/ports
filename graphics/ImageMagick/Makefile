BROKEN-arm=	libm functions (cabs etc) not detected, fallback code is broken

COMMENT=	image processing tools

VER=		6.9.13
DASHVER=	26
REVISION=	0
DISTNAME=	ImageMagick-${VER}-${DASHVER}
PKGNAME=	ImageMagick-${VER}.${DASHVER}
PORTROACH=	site:https://imagemagick.org/archive/releases/ limit:6.*
EXTRACT_SUFX=	.tar.xz

SHARED_LIBS +=	MagickCore-6.Q16     8.2      # 7.0
SHARED_LIBS +=	MagickWand-6.Q16     4.2      # 7.0
SHARED_LIBS +=	Magick++-6.Q16       5.2      # 9.0

CATEGORIES=	graphics

HOMEPAGE=	https://imagemagick.org/

SITES=		https://imagemagick.org/archive/releases/ \
		https://ftp.acc.umu.se/mirror/imagemagick.org/ftp/ \
		ftp://sunsite.icm.edu.pl/packages/ImageMagick/

# https://imagemagick.org/script/license.php
PERMIT_PACKAGE=	Yes

WANTLIB += ${COMPILER_LIBCXX} ICE Lerc SM X11 Xau Xdmcp Xext Xt aom
WANTLIB += bz2 c de265 djvulibre expat fontconfig sharpyuv freetype
WANTLIB += heif iconv jasper jbig jpeg lcms2 lzma m openh264 openjp2
WANTLIB += perl png raw_r tiff webp webpdemux webpmux x265 xcb
WANTLIB += xml2 z zstd

COMPILER=	base-clang ports-gcc
MODULES=	perl
TEST_TARGET=	check

LIB_DEPENDS=	archivers/bzip2 \
		archivers/xz \
		archivers/zstd \
		converters/libiconv \
		graphics/djvulibre \
		graphics/jbigkit \
		graphics/lcms2 \
		graphics/libraw>=0.19.5p0 \
		graphics/libwebp \
		graphics/openjp2 \
		graphics/png \
		graphics/tiff \
		multimedia/libheif \
		textproc/libxml
BUILD_DEPENDS=	print/ghostscript/gnu

ALL_TARGET=	all perl-build

CONFIGURE_STYLE= autoconf
LIBTOOL_FLAGS=	--tag=disable-static
AUTOCONF_VERSION= 2.72
USE_GMAKE=	Yes
CONFIGURE_ARGS=	--without-gcc-arch \
		--with-gs-font-dir=${LOCALBASE}/share/fonts/ghostscript \
		--with-perl \
		--with-perl-options='MAKE=${MAKE_PROGRAM}' \
		--with-quantum-depth=16 \
		--with-security-policy=limited \
		--without-dps \
		--without-flif \
		--without-fpx \
		--without-gvc \
		--without-lqr \
		--without-openexr \
		--without-pango \
		--without-raqm \
		--without-rsvg \
		--without-wmf \
		--disable-openmp

CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include/libxml2 -I${LOCALBASE}/include" \
		LDFLAGS="-L${WRKBUILD}/magick/.libs -L${WRKBUILD}/wand/.libs -L${LOCALBASE}/lib" \
		ac_cv_path_LaunchDelegate=no

FAKE_FLAGS=	CONFIGURE_PATH=${PREFIX}/share/examples/ImageMagick

pre-configure:
	cd ${WRKSRC}; ${SUBST_CMD} $$(find . -name '*.pc.in')

post-install:
	${INSTALL_DATA} ${WRKSRC}/config/policy-*.xml \
	    ${PREFIX}/share/examples/ImageMagick/

.include <bsd.port.mk>
