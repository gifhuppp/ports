COMMENT=	multidict implementation

MODPY_DISTV=	6.6.3
DISTNAME=	multidict-${MODPY_DISTV}
PKGNAME=	py-${DISTNAME}
CATEGORIES=	www devel

WANTLIB +=	pthread ${MODPY_WANTLIB}

# Apache2
PERMIT_PACKAGE=	Yes

MODULES=	lang/python
MODPY_PYBUILD=	setuptools
MODPY_PI=	Yes

#TEST_DEPENDS=	${FULLPKGNAME}:${BUILD_PKGPATH}
TEST_DEPENDS=	devel/py-test-cov \
		devel/py-objgraph
MODPY_TEST_LINK_SO= Yes

.include <bsd.port.mk>
