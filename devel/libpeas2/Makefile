COMMENT=	GObject plugins library

GNOME_PROJECT=	libpeas
GNOME_VERSION=	2.0.7
PKGNAME=	${GNOME_PROJECT}2-${GNOME_VERSION}

CATEGORIES=	devel

SHARED_LIBS += peas-2                    0.0 # 0.0.7

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# LGPLv2.1
PERMIT_PACKAGE=	Yes

WANTLIB += c++abi gio-2.0 gjs glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += intl mozjs-128 ${MODPY_WANTLIB}

MODULES=	devel/meson \
		lang/python \
		x11/gnome

BUILD_DEPENDS=	devel/py-gobject3

RUN_DEPENDS=	devel/py-gobject3

LIB_DEPENDS=	${MODPY_LIB_DEPENDS} \
		devel/spidermonkey128 \
		x11/gnome/gjs

MODGNOME_TOOLS=	gobject-introspection gtk-update-icon-cache vala

CONFIGURE_ARGS= -Dlua51=false \
		-Dvapi=true

DEBUG_PACKAGES=	${BUILD_PACKAGES}

.include <bsd.port.mk>
