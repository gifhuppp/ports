COMMENT=	binary visual display editor, based on vi

DISTNAME=	bvi-1.5.0
CATEGORIES=	editors
HOMEPAGE=	https://bvi.sourceforge.net/

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# GPLv3+
PERMIT_PACKAGE=	Yes

WANTLIB=	c curses

SITES=		${SITE_SOURCEFORGE:=bvi/}
EXTRACT_SUFX=	.src.tar.gz

CONFIGURE_STYLE=gnu

DEBUG_PACKAGES=	${BUILD_PACKAGES}

NO_TEST=	Yes

.include <bsd.port.mk>
