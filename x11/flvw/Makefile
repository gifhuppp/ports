COMMENT=		FLTK Virtual styles, list, table, and complex table Widgets

DISTNAME=		flvw-20000224
PKGNAME=		flvw-1.0
REVISION=		4

CATEGORIES=		x11 devel

HOMEPAGE=		https://flvw.sourceforge.net/

# GPL
PERMIT_PACKAGE=	Yes

SITES=			${SITE_SOURCEFORGE:=flvw/}

EXTRACT_SUFX=		.tgz

BUILD_DEPENDS=		x11/fltk
RUN_DEPENDS=		x11/fltk

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV=		CXXFLAGS="${CXXFLAGS} -DFLTK_1_0_COMPAT -I${LOCALBASE}/include" \
			LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib"

TEST_TARGET=		check
TEST_IS_INTERACTIVE= x11

WRKDIST=		${WRKDIR}/flvw
WRKSRC=			${WRKDIST}/1.0

do-test:
	@cd ${WRKBUILD}/test && exec ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${TEST_FLAGS} -f ${MAKE_FILE} ${TEST_TARGET}

do-install:
	${INSTALL_DATA} ${WRKBUILD}/lib/libflvw.a ${PREFIX}/lib
	${INSTALL_DATA_DIR} ${PREFIX}/include/FL
	${INSTALL_DATA} ${WRKSRC}/FL/*H ${PREFIX}/include/FL

.include <bsd.port.mk>
