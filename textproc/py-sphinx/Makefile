COMMENT=	Python documentation generator

MODPY_DISTV=	8.2.3
DISTNAME=	sphinx-${MODPY_DISTV}
PKGNAME=	py-sphinx-${MODPY_DISTV}

CATEGORIES=	textproc

HOMEPAGE=	https://www.sphinx-doc.org/

EPOCH=		0

# BSD
PERMIT_PACKAGE=	Yes

MODULES=	lang/python

MODPY_PI=	Yes
MODPY_PYBUILD=	flit_core

BUILD_DEPENDS=	devel/gettext,-tools

# needed until flit_core is updated
BUILD_DEPENDS+=	${RUN_DEPENDS}

RUN_DEPENDS+=	textproc/py-sphinxcontrib/applehelp \
		textproc/py-sphinxcontrib/devhelp \
		textproc/py-sphinxcontrib/jsmath \
		textproc/py-sphinxcontrib/htmlhelp \
		textproc/py-sphinxcontrib/serializinghtml \
		textproc/py-sphinxcontrib/qthelp \
		textproc/py-sphinxcontrib/websupport \
		www/py-jinja2 \
		textproc/py-pygments \
		textproc/py-docutils<0.22 \
		textproc/py-snowballstemmer \
		devel/py-babel \
		textproc/py-alabaster \
		graphics/py-imagesize \
		www/py-requests \
		textproc/py-roman-numerals \
		sysutils/py-packaging

TEST_DEPENDS=	devel/py-test-xdist \
		sysutils/py-psutil \
		textproc/py-defusedxml \
		lang/cython \
		devel/py-setuptools \
		devel/py-typing-extensions \
		print/texlive/texmf,-full
PORTHOME=	${WRKDIR}

.include <bsd.port.mk>
