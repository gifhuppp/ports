COMMENT =	image viewer and screenshot tool for LXQt

NAME =		lximage-qt

WANTLIB += ${COMPILER_LIBCXX} GL ICE Qt6Core Qt6DBus Qt6Gui Qt6Network
WANTLIB += Qt6PrintSupport Qt6Svg Qt6SvgWidgets Qt6Widgets SM
WANTLIB += X11 Xext Xfixes c exif fm-qt6 gio-2.0 glib-2.0 gobject-2.0
WANTLIB += gthread-2.0 intl m menu-cache xcb xcb-composite xcb-cursor
WANTLIB += xcb-damage xcb-dpms xcb-dri2 xcb-dri3 xcb-ewmh xcb-glx
WANTLIB += xcb-icccm xcb-image xcb-keysyms xcb-present xcb-randr
WANTLIB += xcb-record xcb-render xcb-render-util xcb-res xcb-screensaver
WANTLIB += xcb-shape xcb-shm xcb-sync xcb-util xcb-xf86dri xcb-xfixes
WANTLIB += xcb-xinerama xcb-xinput xcb-xkb xcb-xtest xcb-xv xcb-xvmc

LIB_DEPENDS =	graphics/libexif \
		x11/lxqt/libfm-qt \
		x11/menu-cache \
		x11/qt6/qtsvg

RUN_DEPENDS =	devel/desktop-file-utils \
		x11/gtk+4,-guic

.include <bsd.port.mk>
