COMMENT=	optional static type checker for Python

# check textproc/py-charset-normalizer, it often has excessively tight
# version checks for mypy
MODPY_DISTV=	1.17.0
REVISION=	0
DISTNAME=	mypy-${MODPY_DISTV}
PKGNAME=	py-${DISTNAME}

CATEGORIES=	devel

# https://github.com/python/mypy
HOMEPAGE=	https://www.mypy-lang.org/

# MIT
PERMIT_PACKAGE=	Yes

MODULES=	lang/python

MODPY_PI=	Yes
MODPY_PYBUILD=	setuptools

# XXX - This has an optional rdep on textproc/py-orjson.
# 1. If this becomes a hard dependency, change py-charset-normalizer not to
#    depend on py-mypy for !rust arches.
# 2. There is a loop py-charset-normalizer -> py-mypy -> py-orjson -> maturin ->
#    rust -> cmake -> libuv -> py-sphinx -> py-requests -> py-charset-normalizer

BUILD_DEPENDS=	devel/py-types-psutil \
		devel/py-types-setuptools \
		${RUN_DEPENDS}

RUN_DEPENDS=	devel/py-typing-extensions \
		devel/py-mypy-extensions \
		devel/py-pathspec

# some tests want network access
PORTHOME=	${WRKDIR}

TEST_DEPENDS=	devel/py-attrs \
		devel/py-test-cov \
		devel/py-test-xdist \
		sysutils/py-filelock \
		sysutils/py-psutil \
		textproc/py-tomli

.include <bsd.port.mk>
