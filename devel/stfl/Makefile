COMMENT=	Structured Terminal Forms Language/Library

DISTNAME=	stfl-0.24
REVISION=	1

SHARED_LIBS+=	stfl 0.0

CATEGORIES=	devel

HOMEPAGE=	http://www.clifford.at/stfl/

# LGPLv3
PERMIT_PACKAGE=	Yes

WANTLIB += curses iconv pthread

SITES=		http://www.clifford.at/stfl/

LIB_DEPENDS=	converters/libiconv

ALL_TARGET=	libstfl.so.${LIBstfl_VERSION}
USE_GMAKE=	Yes
NO_TEST=	Yes

MAKE_FLAGS=	FOUND_SPL=0 \
		FOUND_SWIG=0 \
		FOUND_PERL5=0 \
		FOUND_PYTHON=0 \
		FOUND_RUBY=0

pre-configure:
	${SUBST_CMD} ${WRKSRC}/Makefile

post-build:
	cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} \
		${MAKE_PROGRAM} ${MAKE_FLAGS} ${MAKEFILE} stfl.pc

do-install:
	${INSTALL_DATA} ${WRKBUILD}/libstfl.so.${LIBstfl_VERSION} ${PREFIX}/lib
	${INSTALL_DATA} ${WRKSRC}/stfl.h ${PREFIX}/include/
	${INSTALL_DATA_DIR} ${PREFIX}/lib/pkgconfig
	${INSTALL_DATA} ${WRKSRC}/stfl.pc ${PREFIX}/lib/pkgconfig
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/stfl
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/stfl

.include <bsd.port.mk>
