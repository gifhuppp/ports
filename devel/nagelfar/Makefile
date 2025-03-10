COMMENT =	syntax analysis tool for Tcl

DISTNAME =	nagelfar133
PKGNAME =	nagelfar-1.3.3
CATEGORIES =	devel
HOMEPAGE =	https://nagelfar.sourceforge.net/
MAINTAINER =	Stuart Cassoff <stwo@users.sourceforge.net>

# GPLv2 (Nagelfar)
# BSD (textSearch)
PERMIT_PACKAGE =Yes

SITES =		${SITE_SOURCEFORGE:=nagelfar/}
MODULES =	x11/tk
MODTK_VERSION =	8.6
RUN_DEPENDS =	${MODTK_RUN_DEPENDS}
NO_BUILD =	Yes
NO_TEST =	Yes
PKG_ARCH =	*

NF_LIB_DIR =	${PREFIX}/libdata/nagelfar
NF_DOC_DIR =	${PREFIX}/share/doc/nagelfar
NF_PDB_DIR =	${NF_LIB_DIR}/packagedb
TS_SRC_DIR =	${WRKSRC}/lib/textsearch
TS_DOC_DIR =	${PREFIX}/share/doc/textsearch
TS_EXA_DIR =	${PREFIX}/share/examples/textsearch
MOD_DIR =	${DESTDIR}${MODTCL_MODDIR}/86

do-configure:
	@${MODTCL_TCLSH_ADJ} ${WRKSRC}/nagelfar.tcl
	@${MODTCL_TCLSH_ADJ} ${TS_SRC_DIR}/examples/demo.tcl

do-install:
	${INSTALL_DATA_DIR} ${NF_LIB_DIR} ${NF_DOC_DIR} ${NF_PDB_DIR}
	${INSTALL_SCRIPT} ${WRKSRC}/nagelfar.tcl ${PREFIX}/bin/nagelfar
	${INSTALL_DATA} ${WRKSRC}/syntax*.tcl ${NF_LIB_DIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.txt ${NF_DOC_DIR}
	${INSTALL_DATA} ${WRKSRC}/COPYING ${NF_DOC_DIR}
	${INSTALL_DATA} ${WRKSRC}/packagedb/*.tcl ${NF_PDB_DIR}
	${INSTALL_DATA_DIR} ${TS_DOC_DIR} ${TS_EXA_DIR} ${MOD_DIR}
	${INSTALL_DATA} ${TS_SRC_DIR}/tcl/textsearch.tcl ${MOD_DIR}/textSearch-0.5.tm
	${INSTALL_DATA} ${TS_SRC_DIR}/doc/readme.txt ${TS_DOC_DIR}
	${INSTALL_DATA} ${TS_SRC_DIR}/licence.terms ${TS_DOC_DIR}
	${INSTALL_SCRIPT} ${TS_SRC_DIR}/examples/demo.tcl ${TS_EXA_DIR}

.include <bsd.port.mk>
