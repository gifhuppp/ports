COMMENT=	tools to extend pipe capabilities

DISTNAME=	shunt-1.7.3
REVISION=	1
CATEGORIES=	sysutils

HOMEPAGE=	http://www.serice.net/shunt/

MAINTAINER=	Josh Grosse <josh@jggimi.net>

# BSD
PERMIT_PACKAGE=	Yes

SITES=		${HOMEPAGE}

# uses pledge()
WANTLIB=	c

USE_GMAKE=	Yes

NO_TEST=	Yes

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/bin/* /${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/shunt
	${INSTALL_DATA} ${WRKSRC}/README.TXT ${PREFIX}/share/doc/shunt

.include <bsd.port.mk>
