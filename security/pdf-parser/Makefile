COMMENT =	parse a PDF document

MODPY_DISTV =	0.7.5
DISTNAME =	pdf-parser_V${MODPY_DISTV:S/./_/g}
PKGNAME =	pdf-parser-${MODPY_DISTV}
REVISION =	3

CATEGORIES =	security

HOMEPAGE =	http://blog.didierstevens.com/programs/pdf-tools/

MAINTAINER =	Remi Pointel <rpointel@openbsd.org>

# public domain
PERMIT_PACKAGE =	Yes

SITES =		https://didierstevens.com/files/software/

EXTRACT_SUFX =	.zip

MODULES =	lang/python
RUN_DEPENDS =	security/yara/python

NO_BUILD =	Yes
NO_TEST =	Yes

WRKDIST =	${WRKDIR}

MODPY_ADJ_FILES = pdf-parser.py

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/pdf-parser.py ${PREFIX}/bin/pdf-parser

.include <bsd.port.mk>
