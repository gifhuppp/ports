COMMENT=	lightweight CalDAV and CardDAV server

VERSION=	0.10.1
DISTNAME=	baikal-${VERSION}
SITES=		https://github.com/sabre-io/Baikal/releases/download/${VERSION}/
DISTFILES=	${DISTNAME}.zip
CATEGORIES=	productivity www

HOMEPAGE=	http://sabre.io/baikal/

MAINTAINER =	Martin Reindl <martin@catai.org>
# GPLv3
PERMIT_PACKAGE=	Yes

MODULES=	lang/php

RUN_DEPENDS=	lang/php/${MODPHP_VERSION},-curl

WRKDIST=	${WRKDIR}/baikal
NO_BUILD=	Yes
NO_TEST=	Yes
PKG_ARCH=	*

PREFIX=	${VARBASE}/www
INSTDIR=	${PREFIX}/baikal
WRKSRC=	${WRKDIR}/baikal
SUBST_VARS=	INSTDIR

do-install:
	${INSTALL_DATA_DIR} ${INSTDIR}
	cd ${WRKSRC} && tar cf - . | (cd ${INSTDIR}; tar xf -)

.include <bsd.port.mk>
