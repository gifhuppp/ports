COMMENT=		AWS SDK for Python

MODPY_DISTV=		1.40.1
DISTNAME=		boto3-${MODPY_DISTV}
PKGNAME=		py-${DISTNAME}

CATEGORIES=		net devel

HOMEPAGE=		https://github.com/boto/boto3

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# Apache 2.0
PERMIT_PACKAGE=		Yes

MODULES=		lang/python

MODPY_PI=		Yes
MODPY_PYBUILD=		setuptools

RUN_DEPENDS=		devel/py-jmespath \
			net/py-botocore=${MODPY_DISTV} \
			net/py-s3transfer>=0.13.0,<0.14.0

.include <bsd.port.mk>
