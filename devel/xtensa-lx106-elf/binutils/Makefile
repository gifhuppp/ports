BROKEN-sparc64 = Error: can't resolve .L.str.48

COMMENT =	binutils for ${CONFIG} cross-development

VERSION =	2.32
DISTNAME =	binutils-${VERSION}
PKGNAME =	${CONFIG}-binutils-${VERSION}
REVISION =	1

GH_ACCOUNT =	bminor
GH_PROJECT =	binutils-gdb
GH_COMMIT =	2846942c7c83d007106cdcf1108ceedb50e1d4ec

WANTLIB += ${COMPILER_LIBCXX} c curses expat m

CONFIGURE_ARGS +=	--disable-multilib \
			--with-gnu-as \
			--with-gnu-ld \
			--disable-werror

.include <bsd.port.mk>
