COMMENT =	libtorrent settings modification plugin for deluge

MODPY_EGG_VERSION =	2.0.0
REVISION =	0

GH_ACCOUNT =	ratanakvlun
GH_PROJECT =	deluge-ltconfig
GH_TAGNAME =	v${MODPY_EGG_VERSION}

CATEGORIES =	net

# GPLv3+
PERMIT_PACKAGE =	Yes

MODULES =		lang/python
MODPY_SETUPTOOLS =	Yes
RUN_DEPENDS =		net/deluge

post-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MODPY_BIN} ./${MODPY_SETUP} \
		bdist_egg

post-install:
	${INSTALL_DATA_DIR} ${WRKINST}${MODPY_SITEPKG}/deluge/plugins
	${INSTALL_DATA} ${WRKBUILD}/dist/*.egg \
		${WRKINST}${MODPY_SITEPKG}/deluge/plugins

.include <bsd.port.mk>
