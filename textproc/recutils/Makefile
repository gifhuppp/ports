COMMENT =	tools to access human-editable plaintext record files

DISTNAME =	recutils-1.9
REVISION =	0

SHARED_LIBS +=  rec                       1.0 # 1.0

CATEGORIES =	textproc

HOMEPAGE =	https://www.gnu.org/software/recutils/

# GPLv3+
PERMIT_PACKAGE =	Yes

WANTLIB =  c gcrypt gpg-error iconv intl m pthread readline

SITES =			${SITE_GNU:=recutils/}

BUILD_DEPENDS =		devel/check

LIB_DEPENDS =		security/libgcrypt

CONFIGURE_STYLE =	gnu

DEBUG_PACKAGES =	${BUILD_PACKAGES}

.include <bsd.port.mk>
