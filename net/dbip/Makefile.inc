V =		2025-08

CATEGORIES =	net

HOMEPAGE =	https://db-ip.com/db/lite.php

# CC BY 4.0
PERMIT_PACKAGE =	Yes

SITES =		https://download.db-ip.com/free/
EXTRACT_SUFX =	.gz

WRKDIST =	${WRKDIR}

NO_BUILD =	Yes

NO_TEST =	Yes

PREFIX =	${LOCALSTATEDIR}

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/db/dbip
	${INSTALL_DATA} ${WRKDIST}/*.mmdb ${PREFIX}/db/dbip
