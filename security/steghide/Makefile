COMMENT =		software able to hide data in various kind of files

DISTNAME =		steghide-0.5.1
REVISION =		11
CATEGORIES =		security
HOMEPAGE =		https://steghide.sourceforge.net/

# BSD
PERMIT_PACKAGE =	Yes

WANTLIB =		c iconv intl jpeg m mhash mcrypt ${COMPILER_LIBCXX} z

COMPILER =		base-clang ports-gcc base-gcc

SITES =			${SITE_SOURCEFORGE:=steghide/}

BUILD_DEPENDS =		devel/gettext,-tools
LIB_DEPENDS =		devel/gettext,-runtime \
			security/libmcrypt \
			security/mhash \
			graphics/jpeg
CONFIGURE_STYLE =	autoconf
AUTOCONF_VERSION =	2.57
CONFIGURE_ENV =		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib -liconv -lintl" \
			ac_cv_prog_ac_cv_prog_doxygen=no

CXXFLAGS +=		-std=c++03

.include <bsd.port.mk>
