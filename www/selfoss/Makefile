COMMENT=	rss reader, live stream, mashup, aggregation webapp

V=		2.19
DISTNAME=	selfoss-$V

CATEGORIES=	www

HOMEPAGE=	http://selfoss.aditu.de/

# GPLv3
PERMIT_PACKAGE=	Yes

SITES=		https://github.com/SSilence/selfoss/releases/download/$V/
EXTRACT_SUFX=	.zip
WRKDIST=	${WRKDIR}/selfoss

MODULES=	lang/php

RUN_DEPENDS=	lang/php/${MODPHP_VERSION},-gd \
		${MODPHP_PDO_DEPENDS}

NO_BUILD=	Yes
NO_TEST=	Yes
PKG_ARCH=	*

PREFIX=		${VARBASE}/www
INSTDIR=	${PREFIX}/selfoss
TINSTDIR=	${TRUEPREFIX}/selfoss
SUBST_VARS=	INSTDIR MODPHP_VERSION TINSTDIR

do-install:
	cp -Rp ${WRKDIST} ${INSTDIR}
	${SUBST_CMD} -m 0644 -c ${FILESDIR}/selfoss.conf ${INSTDIR}/selfoss.conf.dist
	chown -R ${SHAREOWN}:${SHAREGRP} ${INSTDIR}

.include <bsd.port.mk>
