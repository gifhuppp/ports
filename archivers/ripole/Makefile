COMMENT=		extract attachments from OLE2 data files

DISTNAME=		ripole-0.2.2
REVISION=		2

CATEGORIES=		archivers

HOMEPAGE=		https://pldaniels.com/ripole/

# BSD
PERMIT_PACKAGE=	Yes

WANTLIB=		c

SITES=			${HOMEPAGE}

ALL_TARGET=		default
NO_TEST=		Yes

MAKE_ENV=		CFLAGS="${CFLAGS}"

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/ripole ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/ripole
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/ripole

.include <bsd.port.mk>
