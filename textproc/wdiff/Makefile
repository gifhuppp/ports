COMMENT=	word differences between text files

DISTNAME=	wdiff-1.2.2
CATEGORIES=	textproc
HOMEPAGE=	https://www.gnu.org/software/wdiff
SITES=		${SITE_GNU:=wdiff/}
REVISION=	4

# GPLv3+
PERMIT_PACKAGE=	Yes

WANTLIB =  c curses iconv intl pthread

LIB_DEPENDS=		devel/gettext,-runtime
TEST_DEPENDS=	misc/screen
CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		--prefix="${PREFIX}"
USE_GMAKE=		Yes

.include <bsd.port.mk>
