COMMENT =		transparent file encryption in Git

DISTNAME =		git-crypt-0.7.0
CATEGORIES =		devel

HOMEPAGE =		https://www.agwa.name/projects/git-crypt/
MAINTAINER =		Paco Esteban <paco@openbsd.org>

# GPL v3+
PERMIT_PACKAGE =	Yes

WANTLIB +=		${COMPILER_LIBCXX} c crypto m

SITES =			https://www.agwa.name/projects/git-crypt/downloads/

# C++11
COMPILER =		base-clang ports-gcc

BUILD_DEPENDS =		textproc/libxslt \
			textproc/docbook-xsl

RUN_DEPENDS =		devel/git

MAKE_ENV =		ENABLE_MAN=yes \
			DOCBOOK_XSL=${PREFIX}/share/xsl/docbook/manpages/docbook.xsl \
			BINDIR=${TRUEPREFIX}/bin \
			MANDIR=${TRUEPREFIX}/man \
			CXXFLAGS="${CXXFLAGS}"

CXXFLAGS +=		-DOPENSSL_API_COMPAT

NO_TEST =		Yes

.include <bsd.port.mk>
