COMMENT=	alarm library for the lua language

DISTNAME=	lalarm
DATE=		20061011
PKGNAME=	luaalarm-${DATE}
REVISION =	3
# don't use PKGNAME
DIST_SUBDIR=	luaalarm-${DATE}
WRKDIST=	${WRKDIR}/alarm
CATEGORIES=	devel

SITES=		${HOMEPAGE}5.0/
HOMEPAGE=	http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/

# PD
PERMIT_PACKAGE=	Yes

MODULES=	lang/lua

FLAVORS=	lua52 lua53
FLAVOR?=

pre-configure:
	${SUBST_CMD} ${WRKSRC}/Makefile

do-install:
	${INSTALL_DATA_DIR} ${MODLUA_LIBDIR}
	${INSTALL_DATA} ${WRKSRC}/alarm.so ${MODLUA_LIBDIR}

do-test:
	rm ${WRKDIST}/alarm.lua
	cd ${WRKDIST} && ${MODLUA_BIN} test.lua

.include <bsd.port.mk>
