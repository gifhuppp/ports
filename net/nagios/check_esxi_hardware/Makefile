PKG_ARCH=	*

COMMENT=	monitoring plugin to check the status of ESX/i hardware

GH_ACCOUNT=	Napsty
GH_PROJECT=	check_esxi_hardware
GH_TAGNAME=	20250716

CATEGORIES=	net

HOMEPAGE=	http://www.claudiokuenzler.com/nagios-plugins/check_esxi_hardware.php

# GPLv2+
PERMIT_PACKAGE=	Yes

NO_BUILD=	Yes
NO_TEST=	Yes

RUN_DEPENDS=	devel/py-wbem \
		sysutils/py-packaging

MODULES=	lang/python

MODPY_ADJ_FILES= check_esxi_hardware.py

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/libexec/nagios
	${INSTALL_SCRIPT} ${WRKSRC}/check_esxi_hardware.py \
		${PREFIX}/libexec/nagios/check_esxi_hardware
	ln -s check_esxi_hardware ${PREFIX}/libexec/nagios/check_esxi_hardware.py

.include <bsd.port.mk>
