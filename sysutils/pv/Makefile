COMMENT =		monitor the progress of data through a pipeline

DISTNAME =		pv-1.9.34
CATEGORIES =		sysutils

HOMEPAGE =		https://www.ivarch.com/programs/pv.shtml

# Artistic License 2.0
PERMIT_PACKAGE=	Yes

SITES =			https://www.ivarch.com/programs/sources/

WANTLIB =		c curses iconv intl m pthread

CONFIGURE_STYLE =	gnu

LIB_DEPENDS =		converters/libiconv \
			devel/gettext,-runtime

.include <bsd.port.mk>
