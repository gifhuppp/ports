COMMENT=	Python interface to the OpenSSL library

MODPY_DISTV=	25.0.0
REVISION=	1
DISTNAME=	pyopenssl-${MODPY_DISTV}
PKGNAME=	py-openssl-${MODPY_DISTV}
CATEGORIES=	security devel

HOMEPAGE=	https://github.com/pyca/pyopenssl

# Apache 2
PERMIT_PACKAGE=	Yes

WANTLIB += ${MODPY_WANTLIB}
WANTLIB += crypto pthread ssl

# typing-extensions for py<3.13
RUN_DEPENDS=	security/py-cryptography \
		devel/py-typing-extensions
BUILD_DEPENDS=	${RUN_DEPENDS}

MODULES=	lang/python
MODPY_PI=	Yes
MODPY_PYBUILD=	setuptools
# deselect a few tests which cause problems:
# - test_it_works_*: DTLS tests which error out and stop others from running
# (add -v to see individual test names)
MODPY_PYTEST_ARGS= -k 'not test_it_works_at_all and not test_it_works_with_srtp'

TEST_DEPENDS=	devel/py-flaky \
		devel/py-pretend

.include <bsd.port.mk>
