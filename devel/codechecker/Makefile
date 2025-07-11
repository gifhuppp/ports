COMMENT =	clang static code analyzer

GH_ACCOUNT =	Ericsson
GH_PROJECT =	codechecker
GH_TAGNAME =	v6.24.0
REVISION =	2

CATEGORIES =	devel

HOMEPAGE =	https://codechecker.readthedocs.io

MAINTAINER =	Moritz Buhl <mbuhl@openbsd.org>

# Apache 2.0 WITH LLVM-exception
PERMIT_PACKAGE =	Yes

DIST_SUBDIR =	codechecker-${GH_TAGNAME}
SITES.a =	https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.30.0/
SITES.b =	https://raw.githubusercontent.com/codemirror/CodeMirror/master/
DISTFILES.a =	codemirror.min.js codemirror.min.css \
		clike.min.js{/mode/clike/clike.min.js}
DISTFILES.b=	codemirror.LICENSE{LICENSE}

EXTRACT_ONLY =	${DISTNAME}${EXTRACT_SUFX}

MODULES =	lang/clang lang/python

MODCLANG_COMPILER_LINKS=	No
MODCLANG_BUILDDEP=		No
MODCLANG_RUNDEP=		Yes

SUBST_VARS+=	MODCLANG_VERSION

CONFIGURE_STYLE =	none

ALL_TARGET =	package package_api
USE_GMAKE =	Yes

RUN_DEPENDS =	databases/py-alembic \
		databases/py-sqlalchemy \
		devel/py-multiprocess \
		devel/py-portalocker \
		devel/py-sarif-tools \
		devel/py-thrift \
		sysutils/py-psutil \
		textproc/py-lxml \
		textproc/py-yaml

BUILD_DEPENDS =	devel/py-pip \
		devel/py-setuptools \
		devel/py-wheel

STATIC_DIR =	${WRKSRC}/tools/report-converter/codechecker_report_converter/report/output/html/static/vendor/codemirror

post-extract:
	${INSTALL_DATA_DIR} ${STATIC_DIR}
	${INSTALL_DATA} ${FULLDISTDIR}/*.{js,css,LICENSE} ${STATIC_DIR}/

pre-configure:
	${SUBST_CMD} ${WRKSRC}/config/package_layout.json

do-install:
	cp -rf ${WRKSRC}/build/CodeChecker ${PREFIX}/share/
	${MODPY_COMPILEALL} ${PREFIX}/share/CodeChecker
	ln -sf ${TRUEPREFIX}/share/CodeChecker/bin/CodeChecker \
		${PREFIX}/bin/codechecker
	find ${PREFIX}/share \( -name '*${PATCHORIG}' -or \
		-name '*.beforesubst' \) -delete

.include <bsd.port.mk>
