COMMENT=	documentation system for C, C++, IDL and Java

DISTNAME=	doc++-3.4.10
REVISION =	14
CATEGORIES=	devel

HOMEPAGE=	https://docpp.sourceforge.net/

# GPLv2+
PERMIT_PACKAGE=	Yes
WANTLIB=	c intl m ${COMPILER_LIBCXX}

SITES=		${SITE_SOURCEFORGE:=docpp/}

COMPILER =	base-clang ports-gcc base-gcc

RUN_DEPENDS=	print/ghostscript/gnu \
		print/texlive/base

CONFIGURE_STYLE= gnu
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

BUILD_DEPENDS=	devel/gettext,-tools

LIB_DEPENDS=	devel/gettext,-runtime

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/doc++
	${INSTALL_DATA} ${WRKSRC}/doc/manual/html/* ${PREFIX}/share/doc/doc++
	${INSTALL_DATA_DIR} ${PREFIX}/share/texmf-local/tex/latex/doc++
	${INSTALL_DATA} ${WRKSRC}/doc/*.sty \
		${PREFIX}/share/texmf-local/tex/latex/doc++

.include <bsd.port.mk>
