COMMENT =	lightweight Qt terminal emulator based on QTermWidget

NAME =		qterminal

WANTLIB += ${COMPILER_LIBCXX} GL Qt6Core Qt6DBus Qt6Gui Qt6Widgets
WANTLIB += X11 c canberra m qtermwidget6 util LayerShellQtInterface

LIB_DEPENDS =	x11/lxqt/qtermwidget>=2.0.1 \
		x11/kde-plasma/layer-shell-qt \
		audio/libcanberra

RUN_DEPENDS =	devel/desktop-file-utils \
		x11/gtk+4,-guic

MODCMAKE_LDFLAGS =	-L${LOCALBASE}/lib

.include <bsd.port.mk>
