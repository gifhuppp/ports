COMMENT =	information about LXQt and the system its running on

NAME =		libdbusmenu-lxqt
VERSION =	0.3.0

SHARED_LIBS +=  dbusmenu-lxqt             0.0 # 0.0

WANTLIB += ${COMPILER_LIBCXX} GL Qt6Core Qt6DBus Qt6Gui Qt6Widgets
WANTLIB += m

RUN_DEPENDS =	devel/desktop-file-utils \
		x11/gtk+4,-guic

.include <bsd.port.mk>
