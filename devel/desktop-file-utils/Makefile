COMMENT=	utilities for dot.desktop entries

DISTNAME=	desktop-file-utils-0.28
REVISION=	0

EXTRACT_SUFX=	.tar.xz

CATEGORIES=	devel

HOMEPAGE=	http://freedesktop.org/wiki/Software/desktop-file-utils

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2
PERMIT_PACKAGE=	Yes

# uses pledge() and unveil()
WANTLIB += c gio-2.0 glib-2.0 intl

SITES=		https://freedesktop.org/software/desktop-file-utils/releases/

# -std=gnu11
COMPILER=	base-clang ports-gcc
COMPILER_LANGS=	c

MODULES=	devel/meson

LIB_DEPENDS=	devel/glib2

DEBUG_PACKAGES=	${BUILD_PACKAGES}

pre-configure:
	${SUBST_CMD} ${WRKSRC}/src/update-desktop-database.c

.include <bsd.port.mk>
