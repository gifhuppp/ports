COMMENT =	simple text-based game of interstellar trading

DISTNAME =	trader-7.20
REVISION =	0

CATEGORIES =	games

HOMEPAGE =	https://www.zap.org.au/projects/trader/

MAINTAINER =	Frederic Cambus <fcambus@openbsd.org>

# GPLv3+
PERMIT_PACKAGE =	Yes

WANTLIB =  c curses iconv intl pthread

SITES =		https://ftp.zap.org.au/pub/trader/unix/

LIB_DEPENDS =	converters/libiconv \
		devel/gettext,-runtime

CONFIGURE_STYLE = gnu

# Prevent configure to error out because we have no <monetary.h>
CONFIGURE_ENV += ac_cv_header_monetary_h=yes

post-install:
	@rm -rf ${PREFIX}/share/applications ${PREFIX}/share/icons

.include <bsd.port.mk>
