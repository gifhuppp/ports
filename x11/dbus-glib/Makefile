COMMENT=		glib bindings for dbus message system

DISTNAME=		dbus-glib-0.114
EPOCH=			0

SHARED_LIBS +=  dbus-glib-1          5.0      # 5.6

CATEGORIES=		x11

HOMEPAGE=		https://www.freedesktop.org/wiki/Software/DBusBindings/

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2+
PERMIT_PACKAGE=	Yes

WANTLIB += c dbus-1 expat ffi gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += iconv intl pcre2-8 pthread z

SITES=			https://dbus.freedesktop.org/releases/dbus-glib/

LIB_DEPENDS=		devel/glib2 \
			x11/dbus

USE_GMAKE=		Yes

CONFIGURE_STYLE=	gnu

CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"

FAKE_FLAGS=		sysconfdir=${PREFIX}/share/examples/dbus-glib

.include <bsd.port.mk>
