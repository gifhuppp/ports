BROKEN-i386 =	uint128_t

COMMENT =	reverse engineering framework in Python

MODPY_DISTV =	0.1.3
DISTNAME =	miasm-${MODPY_DISTV}pl20221105
# XXX see post-extract below! it looks like proper tarballs are expected
# to contain a VERSION file and if that doesn't exist it tries to extract
# a version from git and use that to generation the version number for
# setuptools. however it does that in an illegal format.
# XXX if updating, check if that can be removed, or at least make sure
# this port Makefile is changed to use a suitable version number.
PKGNAME =	py-${DISTNAME}
EPOCH =		0

GH_ACCOUNT =	cea-sec
GH_PROJECT =	miasm
GH_COMMIT =	d82c9ef57fa48eb254e2547f8a128bbc75b7e966
REVISION =	3

CATEGORIES =	security devel

HOMEPAGE =	https://github.com/cea-sec/miasm

MAINTAINER =	Remi Pointel <rpointel@openbsd.org>

# GPLv2
PERMIT_PACKAGE =	Yes

WANTLIB += pthread ${MODPY_WANTLIB}

MODULES =	lang/python
MODPY_PYBUILD =	setuptools

RUN_DEPENDS =	devel/py-llvmlite \
		devel/py-parsing

TEST_DEPENDS =	devel/py-cparser \
		devel/py-parameterized

post-extract:
	[ -e ${WRKSRC}/miasm/VERSION ] || echo ${MODPY_DISTV} > ${WRKSRC}/miasm/VERSION

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/${MODPY_PY_PREFIX}miasm
	cp -r ${WRKSRC}/example ${PREFIX}/share/${MODPY_PY_PREFIX}miasm/

do-test:
	cd ${WRKSRC}/test && PYTHONPATH=${WRKSRC} ${MODPY_BIN} ./test_all.py -m

.include <bsd.port.mk>
