COMMENT =	next-generation web UI for icinga

GH_ACCOUNT =	Icinga
GH_PROJECT =	icingaweb2
GH_TAGNAME =	v2.12.5
PKGNAME =	icinga-web2-${GH_TAGNAME:S/v//}

MODULES=	lang/php

MODPHP_PDO_ALLOWED = mysql pgsql
MODPHP_PDO_PREF =    mysql

RUN_DEPENDS =	lang/php/${MODPHP_VERSION},-intl \
		net/icinga/icinga-php-library>=0.13 \
		net/icinga/icinga-php-thirdparty>=0.12 \
		${MODPHP_PDO_DEPENDS}

NO_TEST =	Yes
NO_BUILD =	Yes

PREFIX =	${VARBASE}/www

do-configure:
	@sed -i 's,^#!/usr/bin/env php.*,#!${MODPHP_BIN},' \
	    ${WRKSRC}/bin/icingacli

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/icinga-web2 ${PREFIX}/conf/modules.sample
	${SUBST_DATA} \
		${FILESDIR}/icingaweb2.conf ${PREFIX}/conf/modules.sample/icingaweb2.conf.dist \
		${FILESDIR}/icingaweb2.fpm.conf ${PREFIX}/conf/modules.sample/icingaweb2.fpm.conf.dist
	cd ${WRKSRC}; pax -rw ./ ${PREFIX}/icinga-web2/
	find ${PREFIX}/icinga-web2 \( -name '*${PATCHORIG}' -or -name '*.beforesubst' \) -delete
	ln -s ${TRUEPREFIX}/icinga-web2/bin/icingacli ${WRKINST}/usr/local/bin/

.include <bsd.port.mk>
