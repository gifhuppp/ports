COMMENT =	curses icb and irc client
DISTNAME =	swirc-3.5.5
CATEGORIES =	net
HOMEPAGE =	https://www.nifty-networks.net/swirc/

MAINTAINER =		Markus Uhlin <markus@nifty-networks.net>

# BSD-3, ISC and MIT.
PERMIT_PACKAGE =	Yes

# uses pledge()
WANTLIB =		${COMPILER_LIBCXX} c crypto curl curses hunspell-1.7 \
			iconv idn intl m panel pthread ssl

SITES =			https://www.nifty-networks.net/swirc/releases/
EXTRACT_SUFX =		.tgz

# C++17
COMPILER =		base-clang ports-gcc

BUILD_DEPENDS =		devel/gettext,-tools
LIB_DEPENDS =		devel/gettext,-runtime \
			devel/libidn \
			net/curl \
			textproc/hunspell

CFLAGS +=		-I${LOCALBASE}/include
LDFLAGS +=		-L${LOCALBASE}/lib

CONFIGURE_STYLE =	simple
CONFIGURE_ENV +=	CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" \
			LDFLAGS="${LDFLAGS}"

TEST_DEPENDS =		devel/cmocka
TEST_TARGET =		check

MAKE_FLAGS =		DEST_CONFMAN=${WRKINST}${PREFIX}/man/man5 \
			DEST_MANUAL=${WRKINST}${PREFIX}/man/man1 \
			INSTALL_DEPS=swirc src/swirc.1 swirc.conf.5 \
			PREFIX="${PREFIX}" CC="${CC}" CXX="${CXX}"

# show the commands being executed
MAKE_FLAGS +=		E=@true Q=''

.include <bsd.port.mk>
