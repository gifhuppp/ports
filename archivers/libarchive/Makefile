COMMENT=	multi-format archive and compression library

DISTNAME=	libarchive-3.8.1
SHARED_LIBS=	archive		13.3	# 21.1
CATEGORIES=	archivers
HOMEPAGE=	https://www.libarchive.org/

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# BSD
PERMIT_PACKAGE=	Yes

SITES=		https://www.libarchive.org/downloads/
EXTRACT_SUFX=	.tar.xz

WANTLIB=	b2 bz2 c crypto expat iconv lz4 lzma pthread z zstd
LIB_DEPENDS=	archivers/bzip2 \
		archivers/lz4 \
		archivers/xz \
		archivers/zstd \
		converters/libiconv \
		security/libb2

SEPARATE_BUILD=	Yes
CONFIGURE_STYLE=gnu
CONFIGURE_ARGS+=--without-nettle	# prefer OpenSSL
CONFIGURE_ARGS+=--without-xml2		# expat suffices
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
# Do not pick up headers from e2fsprogs
CONFIGURE_ENV+=	ac_cv_header_ext2fs_ext2_fs_h=no

MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/build/autoconf
DEBUG_PACKAGES = ${BUILD_PACKAGES}

# Note: Numerous regression tests fail because they require unsupported
# locales or character encodings.

.include <bsd.port.mk>
