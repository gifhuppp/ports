COMMENT=	Xfce4 settings daemon

XFCE_PROJECT=	xfconf
SHARED_LIBS =	xfconf-0 1.0 # 2.0

# GPLv2
PERMIT_PACKAGE=	Yes

MODULES=	x11/xfce4
LIB_DEPENDS=	x11/xfce4/libxfce4util
BUILD_DEPENDS += devel/gobject-introspection lang/vala
MODXFCE_PURGE_LA=	lib/gio/modules

CONFIGURE_ARGS=	--disable-perl-bindings --disable-linker-opts
CONFIGURE_ARGS+=--enable-gsettings-backend
WANTLIB += c ffi gio-2.0 glib-2.0 gmodule-2.0
WANTLIB += gobject-2.0 gthread-2.0 pcre2-8 pthread xfce4util z iconv intl

.include <bsd.port.mk>
