USE_NOBTCFI-aarch64 =	Yes# fortran

COMMENT =	GNU Astronomy Utilities
DISTNAME =	gnuastro-0.18
CATEGORIES =	astro
REVISION =	6

SHARED_LIBS +=	gnuastro                  3.1 # 16.0

HOMEPAGE =	https://www.gnu.org/software/gnuastro/
MAINTAINER =	Brian Callahan <bcallah@openbsd.org>

# GPLv3+
PERMIT_PACKAGE =	Yes

WANTLIB += ${COMPILER_LIBCXX} Lerc bz2 c cfitsio crypto curl git2
WANTLIB += gsl gslcblas jpeg llhttp lzma m nghttp2 nghttp3 ngtcp2
WANTLIB += ngtcp2_crypto_quictls pcre2-8 ssh2 ssl tiff wcs z zstd

SITES =		${SITE_GNU:=gnuastro/}

# Claimed to be too old; uses it anyway.
BUILD_DEPENDS =	print/ghostscript/gnu

LIB_DEPENDS =	archivers/bzip2 \
		archivers/zstd \
		astro/wcslib \
		devel/gsl \
		devel/libgit2/libgit2 \
		graphics/jpeg \
		graphics/tiff \
		security/libssh2

CONFIGURE_STYLE =	gnu

USE_GMAKE =	Yes

FAKE_FLAGS =	sysconfdir="${PREFIX}/share/examples/gnuastro"

# Move bash completion file to the appropriate directory.
# Also, rename it to something more identifiable.
post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/bash-completion/completions
	${INSTALL_DATA} ${PREFIX}/share/gnuastro/completion.bash \
		${PREFIX}/share/bash-completion/completions/gnuastro
	rm -rf ${PREFIX}/share/gnuastro

.include <bsd.port.mk>
