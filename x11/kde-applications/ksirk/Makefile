COMMENT =	world domination strategy game
DISTNAME =	ksirk-${VERSION}
CATEGORIES =	games

HOMEPAGE =	https://www.kde.org/applications/games/ksirk

SHARED_LIBS +=  iris_ksirk                2.0 # 2.0

WANTLIB += ${COMPILER_LIBCXX} GL KDEGames6 KDEGames6Private KF6Attica
WANTLIB += KF6ColorScheme KF6Completion KF6ConfigCore KF6ConfigGui
WANTLIB += KF6ConfigWidgets KF6CoreAddons KF6Crash KF6DBusAddons
WANTLIB += KF6GuiAddons KF6I18n KF6NewStuffCore KF6NewStuffWidgets
WANTLIB += KF6WidgetsAddons KF6XmlGui Qt6Core Qt6Core5Compat Qt6DBus
WANTLIB += Qt6Gui Qt6Multimedia Qt6Network Qt6Qml Qt6Svg Qt6SvgWidgets
WANTLIB += Qt6Widgets Qt6Xml c m

MODKDE_ICON_CACHE = yes
MODKDE_TRANSLATIONS = yes
MODKF5_L10N_CONFLICT = yes
MODKDE_DOCS = yes
MODKDE_DESKTOP_FILE = yes

LIB_DEPENDS =	devel/kf6/attica \
		devel/kf6/kcolorscheme \
		devel/kf6/kcompletion \
		devel/kf6/kconfig \
		devel/kf6/kconfigwidgets \
		devel/kf6/kcoreaddons \
		devel/kf6/kcrash \
		devel/kf6/kguiaddons \
		devel/kf6/ki18n \
		devel/kf6/knewstuff \
		devel/kf6/kdbusaddons \
		devel/kf6/kwidgetsaddons \
		devel/kf6/kxmlgui \
		x11/kde-applications/libkdegames>=${VERSION} \
		x11/qt6/qt5compat \
		x11/qt6/qtdeclarative \
		x11/qt6/qtmultimedia \
		x11/qt6/qtsvg

.include <bsd.port.mk>
