V =	1.1.0
COMMENT =	unit testing for PostgreSQL
DISTNAME =	pgtap-${V}
CATEGORIES =	databases
EXTRACT_SUFX =	.zip

HOMEPAGE =	https://pgtap.org/

# PostgreSQL
PERMIT_PACKAGE=	Yes

SITES =		https://api.pgxn.org/dist/pgtap/${V}/
MODULES =	databases/postgresql

SUBST_VARS +=	V
USE_GMAKE =	Yes

BUILD_DEPENDS =	databases/postgresql
RUN_DEPENDS =	databases/postgresql,-server \
		databases/p5-TAP-Parser-SourceHandler-pgTAP

TEST_DEPENDS =	${BUILD_PKGPATH}
TEST_ENV +=	ALLOW_MISSING_EXTENSIONS=1
MODPOSTGRESQL_TEST_CMD = ${LOCALBASE}/bin/psql -c 'CREATE EXTENSION pgtap; ALTER DATABASE postgres OWNER TO postgres' && \
	${MAKE_PROGRAM} ${ALL_TEST_FLAGS} -f ${MAKE_FILE} ${TEST_TARGET}

.include <bsd.port.mk>
