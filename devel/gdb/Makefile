COMMENT=	GNU debugger
CATEGORIES=	devel

DISTNAME=	gdb-16.3

HOMEPAGE=	https://www.gnu.org/software/gdb/

MAINTAINER=	Pascal Stumpf <pascal@stumpf.co>, \
		Jeremie Courreges-Anglas <jca@wxcvbn.org>

# GPLv2 and GPLv3
PERMIT_PACKAGE=	Yes

SITES=		${SITE_GNU:=gdb/}
DIST_SUBDIR=	gdb
EXTRACT_SUFX=	.tar.xz

MODGNU_CONFIG_GUESS_DIRS=	${WRKSRC} ${WRKSRC}/gdb

WANTLIB += ${MODPY_WANTLIB} ${COMPILER_LIBCXX}
WANTLIB += c curses expat gmp kvm iconv intl m mpfr pthread util z zstd

DEBUG_PACKAGES=	${BUILD_PACKAGES}

# C++11
COMPILER=	base-clang ports-gcc

SEPARATE_BUILD= Yes
CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--program-prefix=e \
		--disable-install-libbfd \
		--disable-nls \
		--disable-sim \
		--without-guile \
		--without-isl \
		--without-lzma \
		--with-libgmp-type=shared \
		--with-auto-load-dir=${TRUEPREFIX}/share/gdb/auto-load \
		--enable-targets=all \
		--with-python=${MODPY_BIN} \
		--with-system-zlib
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib ${LDFLAGS}"

USE_GMAKE=	Yes
MAKE_FLAGS=	V=1
# Avoid using malloc replacement for no good reason
MAKE_ENV=	gl_cv_malloc_ptrdiff=yes

MODULES +=	lang/python

BUILD_DEPENDS =	sysutils/xxhash
LIB_DEPENDS +=	${MODPY_LIB_DEPENDS} \
		archivers/zstd \
		devel/gmp,-main \
		devel/mpfr
TEST_DEPENDS +=	devel/dejagnu

post-install:
	${MODPY_COMPILEALL} ${PREFIX}/share/gdb/python
	# The gstack script relies on finding the executable path from
	# a running process, something we do not support.
	rm -f ${PREFIX}/bin/egstack ${PREFIX}/man/man1/egstack.1

.include <bsd.port.mk>
