COMMENT =		module for creating and manipulating graphs and networks

MODPY_EGG_VERSION =	2.7.1
DISTNAME =		networkx-${MODPY_EGG_VERSION}
PKGNAME =		py-${DISTNAME}

CATEGORIES =		math

HOMEPAGE =		https://networkx.github.io/

# BSD
PERMIT_PACKAGE =	Yes

MODULES =		lang/python
MODPY_PI =		Yes
MODPY_PYBUILD =	setuptools

FLAVORS =		python3
FLAVOR =		python3

RUN_DEPENDS =		devel/py-decorator${MODPY_FLAVOR}

TEST_DEPENDS =		devel/py-test-cov${MODPY_FLAVOR}

.include <bsd.port.mk>
