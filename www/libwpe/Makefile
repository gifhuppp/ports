COMMENT=	general-purpose library for the WPE-flavored port of WebKit

DISTNAME=	libwpe-1.16.2

CATEGORIES=	www wayland

SHARED_LIBS += wpe-1.0                   0.2 # 1.9.2

HOMEPAGE=	https://wpewebkit.org/

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# BSD
PERMIT_PACKAGE=	Yes

SITES=		https://wpewebkit.org/releases/
EXTRACT_SUFX=	.tar.xz

# COMPILER_LIBCXX? (no libc++ on gcc-only archs)
WANTLIB += 	xkbcommon c++

MODULES=	devel/meson

COMPILER=	base-clang ports-gcc

LIB_DEPENDS=	x11/xkbcommon

DEBUG_PACKAGES=	${BUILD_PACKAGES}

.include <bsd.port.mk>
