COMMENT=		internationalized string handling

DISTNAME=		libidn-1.43

SHARED_LIBS +=  idn                  18.0     # 18.6

CATEGORIES=		devel

HOMEPAGE=		https://www.gnu.org/software/libidn/

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv3
PERMIT_PACKAGE=	Yes

WANTLIB += c iconv intl pthread

SITES=			${SITE_GNU:=libidn/}

LIB_DEPENDS=		devel/gettext,-runtime

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		--disable-csharp \
			--disable-java \
			--disable-valgrind-tests

DEBUG_PACKAGES=		${BUILD_PACKAGES}

.include <bsd.port.mk>
