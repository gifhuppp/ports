COMMENT=	quality TLS certs while you wait, for the discerning

MODPY_EGG_VERSION=	1.2.0

DISTNAME=	trustme-${MODPY_EGG_VERSION}
PKGNAME=	py-${DISTNAME}

CATEGORIES=	security devel

HOMEPAGE=	https://github.com/python-trio/trustme

# Either MIT or Apache License 2.0
PERMIT_PACKAGE=	Yes

MODULES=	lang/python

MODPY_PI=	Yes
MODPY_PYBUILD=	hatchling

FLAVORS=	python3
FLAVOR=		python3

RUN_DEPENDS=	net/py-idna${MODPY_FLAVOR} \
		security/py-cryptography${MODPY_FLAVOR} \
		security/py-openssl${MODPY_FLAVOR}
TEST_DEPENDS=	security/py-service_identity${MODPY_FLAVOR}

.include <bsd.port.mk>
