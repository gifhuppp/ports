COMMENT =	library and tools to access the QEMU Copy-On-Write (QCOW)

VERSION = 	20191221
DISTNAME =	libqcow-alpha-${VERSION}
PKGNAME =	${DISTNAME:S/-alpha//}
REVISION =	5

SHARED_LIBS +=  qcow                       0.0 # 1.0

CATEGORIES =	sysutils security

HOMEPAGE =	https://github.com/libyal/libqcow/wiki

SITES =		https://github.com/libyal/libqcow/releases/download/${VERSION}/

MAINTAINER =	Remi Pointel <rpointel@openbsd.org>

# LGPLv3+
PERMIT_PACKAGE =	Yes

WANTLIB =  ${MODPY_WANTLIB}
WANTLIB += bfio c crypto fuse iconv intl m pthread util z

CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS +=	--enable-python3

WRKDIST =	${WRKDIR}/${PKGNAME}

MODULES +=	lang/python

BUILD_DEPENDS =	devel/gettext,-tools \
		devel/py-setuptools

LIB_DEPENDS +=	devel/libbfio

TEST_DEPENDS +=	shells/bash

pre-test:
	sed -i s,#!/bin/bash,#!/${LOCALBASE}/bin/bash, ${WRKSRC}/tests/test_*.sh

.include <bsd.port.mk>
