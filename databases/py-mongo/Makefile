COMMENT=	Python driver for mongodb

MODPY_DISTV=	4.7.3
DISTNAME=	pymongo-${MODPY_DISTV}
PKGNAME=	py-${DISTNAME:S/py//}
REVISION=	1

CATEGORIES=	databases devel

HOMEPAGE=	https://github.com/mongodb/mongo-python-driver/

# Apache 2.0
PERMIT_PACKAGE=	Yes

WANTLIB=	pthread ${MODPY_WANTLIB}

MODPY_PI=	Yes

MODULES=	lang/python

MODPY_PYBUILD=	setuptools

# unported dep
MODPY_PYTEST_ARGS= --ignore test/mockupdb \
		--ignore test/auth_aws/test_auth_aws.py

# needs a running mongodb instance at 127.0.0.1:27017,
# and increased kern.somaxconn, various missing files from the tar.gz
# too it seems
TEST_IS_INTERACTIVE= Yes

.include <bsd.port.arch.mk>

.if ${PROPERTIES:Mle}
PKG_ARGS +=	-Dno_be=1
.else
PKG_ARGS +=	-Dno_be=0
.endif

.include <bsd.port.mk>
