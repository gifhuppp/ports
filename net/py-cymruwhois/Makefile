COMMENT=		client for the whois.cymru.com service

MODPY_EGG_VERSION=	1.6
DISTNAME=		cymruwhois-${MODPY_EGG_VERSION}
PKGNAME=		py-${DISTNAME}
REVISION=		8

CATEGORIES=		net

MAINTAINER=		Denis Fondras <denis@openbsd.org>

# MIT
PERMIT_PACKAGE=	Yes

MODULES=		lang/python
MODPY_PI=		Yes
MODPY_PYBUILD=		setuptools
MODPY_ADJ_FILES=	cymruwhois.py

FLAVORS=		python3
FLAVOR=			python3

TEST_DEPENDS=		devel/py-nose${MODPY_FLAVOR}

.include <bsd.port.mk>
