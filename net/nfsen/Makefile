COMMENT=	web-based front end for the nfdump netflow tools

GH_ACCOUNT=	phaag
GH_PROJECT=	nfsen
GH_TAGNAME=	v.1.3.11
REVISION=	0
CATEGORIES=	net www
HOMEPAGE=	https://nfsen.sourceforge.net/

# BSD
PERMIT_PACKAGE=	Yes

MODULES=	perl lang/php
RUN_DEPENDS=	net/rrdtool \
		mail/p5-Mail-Tools \
		net/p5-Socket6 \
		net/nfdump,-nfprofile \
		net/nfdump>=1.6.20
BUILD_DEPENDS=	${RUN_DEPENDS}

NO_BUILD=	Yes
NO_TEST=	Yes
WWWDIR=		${WRKINST}/var/www/htdocs
PKG_ARCH=	*

pre-configure:
	@${SUBST_CMD} ${WRKSRC}/etc/nfsen-dist.conf
	@cd ${WRKSRC}/html; [ -r index.php ] || echo \
	    '<?php header("Location: nfsen.php"); ?>' > index.php

# XXX installer requires /dev/log causing problems for ports builds in a jail

do-install:
	${INSTALL_DATA_DIR} ${WWWDIR}/
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/nfsen
	${INSTALL_DATA_DIR} ${PREFIX}/${P5SITE}/NfSen/installer-items
	cd ${WRKSRC} && INSTPREFIX=${WRKINST}/ ./install.pl ./etc/nfsen-dist.conf copy < /dev/null
	${INSTALL_DATA} ${WRKINST}/etc/nfsen.conf ${PREFIX}/share/examples/nfsen
	rm ${WRKINST}/etc/nfsen*
	${INSTALL_SCRIPT} ${WRKSRC}/install.pl ${PREFIX}/bin/install-nfsen.pl
	perl -pi \
	    -e 's,use lib "./libexec";,use lib "${TRUEPREFIX}/${P5SITE}/NfSen";,;' \
	    -e 's,use lib "./installer-items";,use lib "${TRUEPREFIX}/${P5SITE}/NfSen/installer-items";,' \
	    ${PREFIX}/bin/install-nfsen.pl
	${INSTALL_SCRIPT} ${WRKSRC}/installer-items/* ${PREFIX}/${P5SITE}/NfSen/installer-items
	${INSTALL_SCRIPT} ${WRKSRC}/contrib/PortTracker/PortTracker.pm ${PREFIX}/lib/nfsen/plugins/
	${INSTALL_SCRIPT} ${WRKSRC}/contrib/PortTracker/PortTracker.php ${WWWDIR}/nfsen/plugins/
	-mv ${WWWDIR}/nfsen/conf.php ${WWWDIR}/nfsen/conf.php.dist
	find ${WRKINST} -name '*${PATCHORIG}' -delete
	chown -R ${SHAREOWN}:${SHAREGRP} ${WRKINST}/var/www/htdocs/nfsen
	chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/bin ${PREFIX}/lib ${PREFIX}/libdata

.include <bsd.port.mk>
