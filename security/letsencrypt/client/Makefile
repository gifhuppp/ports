COMMENT=	client for certificate authorities using ACME protocols

HOMEPAGE=	https://certbot.eff.org/

DISTNAME=	certbot-${MODPY_DISTV}

RUN_DEPENDS=	security/letsencrypt/py-acme=${MODPY_DISTV} \
		devel/py-configargparse \
		devel/py-configobj \
		security/py-cryptography \
		sysutils/py-distro \
		security/py-josepy \
		devel/py-parsedatetime \
		textproc/py-pyRFC3339 \
		devel/py-zopecomponent \
		devel/py-zopeinterface

do-configure:
	sed -i -e 's,/etc,${SYSCONFDIR},' \
		-e 's,/var/lib,${LOCALSTATEDIR}/db,' \
		${WRKSRC}/src/certbot/compat/misc.py

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/certbot
	${INSTALL_DATA} ${WRKSRC}/examples/*.{ini,sh,cnf} \
		${PREFIX}/share/examples/certbot
	ln -s certbot ${PREFIX}/bin/letsencrypt # add courtesy symlink

.include <bsd.port.mk>
