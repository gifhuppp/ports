COMMENT =	tool for reverse-engineering and analysing firmware blobs

MODPY_DISTV =	2.3.4
GH_ACCOUNT =	ReFirmLabs
GH_PROJECT =	binwalk
GH_TAGNAME =	v${MODPY_DISTV}
REVISION =	4

CATEGORIES =	sysutils

MAINTAINER =	Jasper Lievisse Adriaanse <jasper@openbsd.org>

# MIT
PERMIT_PACKAGE =Yes

MODULES =	lang/python
MODPY_PYBUILD =	setuptools

MODPY_PYTEST =		Yes
MODPY_PYTEST_ARGS =	testing/tests

# There are a bunch of utilities which aren't ported yet but which would
# benefit the binwalk user:
# sasquatch for non-standard SquashFS images
# ubi_reader (+ py-lzo) for UBIFS
# yaffshiv for YAFFS
RUN_DEPENDS =	devel/capstone/python \
		security/py-cryptodome \
		sysutils/jefferson

TEST_ENV =	PYTHONPATH=${WRKSRC}/lib
PORTHOME =	${WRKDIR}

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/binwalk
	${INSTALL_DATA} ${WRKDIST}/src/scripts/examples/* \
		${PREFIX}/share/examples/binwalk/

.include <bsd.port.mk>
