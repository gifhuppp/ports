COMMENT =		seafile client

GH_PROJECT =		seafile-client
# upstream keep on sliding tags to pull in new commits
# this commit is from the "v9.0.6" tag
GH_COMMIT =		4a4230f7229c3f55dcd486de061eb20ed4c3f34d
DISTNAME =		seafile-client-9.0.6pl20240525
EPOCH = 		0

WANTLIB += Qt5Core Qt5DBus Qt5Gui Qt5Network Qt5Widgets c
WANTLIB += crypto event_core event_extra gio-2.0 glib-2.0 gobject-2.0
WANTLIB += intl jansson m pthread seafile searpc sqlite3 ssl z
WANTLIB += ${COMPILER_LIBCXX}

MODULES =		devel/cmake x11/qt5
LIB_DEPENDS =		net/seafile/seafile \
			databases/sqlite3
RUN_DEPENDS =		devel/desktop-file-utils \
			x11/gtk+4,-guic
CONFIGURE_ARGS += 	-Wno-dev

NO_TEST =		Yes

post-configure:
	cd ${WRKSRC}/i18n/ && ${MODQT_LRELEASE} *.ts

.include <bsd.port.mk>
