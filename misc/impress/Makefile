COMMENT=	publishing and presentation tool

VERSION=	1.1b9
DISTNAME=	impress-${VERSION}
REVISION=	2
DISTFILES=	imp${VERSION}.tar.gz
CATEGORIES=	misc

SITES=		${HOMEPAGE}

HOMEPAGE=	http://www.ntlug.org/~ccox/impress/

PERMIT_PACKAGE=	Yes

MODULES=	x11/tk
RUN_DEPENDS=	${MODTK_RUN_DEPENDS}

NO_TEST=	Yes

pre-configure:
	@${MODTCL_WISH_ADJ} ${WRKSRC}/src/impress.tcl

.include <bsd.port.mk>
