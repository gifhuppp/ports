COMMENT=	gtk+3 spelling checker

DISTNAME=	gtkspell3-3.0.10
EXTRACT_SUFX=	.tar.xz

REVISION=	3

SHARED_LIBS +=  gtkspell3-3          0.3      # 2.0

CATEGORIES=	textproc x11

HOMEPAGE=	https://gtkspell.sourceforge.net/

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB += X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama
WANTLIB += Xrandr Xrender aspell atk-1.0 atk-bridge-2.0 atspi
WANTLIB += cairo cairo-gobject dbus-1 enchant-2 epoxy expat ffi
WANTLIB += fontconfig freetype fribidi gdk-3 gdk_pixbuf-2.0 gio-2.0
WANTLIB += glib-2.0 gmodule-2.0 gobject-2.0 graphite2 gthread-2.0
WANTLIB += gtk-3 harfbuzz iconv intl m pango-1.0 pangocairo-1.0
WANTLIB += pangoft2-1.0 pcre2-8 pixman-1 png pthread xcb xcb-render
WANTLIB += xcb-shm z Xau Xdmcp c++ c++abi execinfo jpeg
WANTLIB += epoll-shim wayland-client wayland-cursor wayland-egl
WANTLIB += xkbcommon

SITES=		${SITE_SOURCEFORGE:=gtkspell/}

MODULES=	textproc/intltool \
		x11/gnome

MODGNOME_TOOLS=	gobject-introspection vala

BUILD_DEPENDS=	devel/iso-codes
RUN_DEPENDS=	devel/iso-codes

USE_GMAKE=	Yes

LIB_DEPENDS=	textproc/enchant2 \
		x11/gtk+3

CONFIGURE_STYLE=gnu

PORTHOME=	${WRKBUILD}

.include <bsd.port.mk>
