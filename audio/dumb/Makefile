COMMENT=	IT/MOD/XM player and library

DISTNAME=	dumb-0.9.3
REVISION=	3

CATEGORIES=	audio

HOMEPAGE=	https://dumb.sourceforge.net
SITES=		${SITE_SOURCEFORGE:=dumb/}

# free, with some not-seriously-intended joke clauses
PERMIT_PACKAGE=	Yes

COMPILER=	base-clang ports-gcc

WANTLIB=	${COMPILER_LIBCXX} alleg c m pthread

USE_GMAKE=	yes
LIB_DEPENDS=	games/allegro

MAKE_FLAGS =	CC="${CC}" 

NO_TEST=	Yes

.include <bsd.port.mk>
