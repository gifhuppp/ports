COMMENT=		Abstract Syntax Notation One structure parser library

DISTNAME=		libtasn1-4.20.0
CATEGORIES=		security

SHARED_LIBS +=  tasn1                4.2      # 12.4

HOMEPAGE=		https://www.gnu.org/software/libtasn1/

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv3+
PERMIT_PACKAGE=		Yes

WANTLIB += c

SITES=			${SITE_GNU:=libtasn1/}

CONFIGURE_STYLE=	gnu

DEBUG_PACKAGES=		${BUILD_PACKAGES}

.include <bsd.port.mk>
