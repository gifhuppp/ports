COMMENT=	command-line tool for installing Python packages

MODPY_DISTV=	25.2
DISTNAME=	pip-${MODPY_DISTV}
PKGNAME=	py-${DISTNAME}
CATEGORIES=	devel

HOMEPAGE=	https://pip.pypa.io/en/stable/

# MIT
PERMIT_PACKAGE=	Yes

MODULES=	lang/python
MODPY_PYBUILD=	setuptools
MODPY_PI=	Yes

# No test suites in pypi tarball
NO_TEST=	Yes

post-install:
	ln -s pip3 ${PREFIX}/bin/pip${MODPY_VERSION}

.include <bsd.port.mk>
