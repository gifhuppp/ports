COMMENT =	hunt gold, dodge enemies and solve puzzles
DISTNAME =	kgoldrunner-${VERSION}
CATEGORIES =	games

HOMEPAGE =	https://www.kde.org/applications/games/kgoldrunner

WANTLIB += ${COMPILER_LIBCXX} GL KDEGames6 KF6ColorScheme KF6ConfigCore
WANTLIB += KF6ConfigGui KF6ConfigWidgets KF6CoreAddons KF6Crash
WANTLIB += KF6DBusAddons KF6GuiAddons KF6I18n KF6IconThemes KF6KIOCore
WANTLIB += KF6WidgetsAddons KF6XmlGui Qt6Core Qt6DBus Qt6Gui Qt6Network
WANTLIB += Qt6Qml Qt6Widgets Qt6Xml c m

MODKDE_DESKTOP_FILE = yes
MODKDE_ICON_CACHE = yes
MODKDE_TRANSLATIONS = yes
MODKF5_L10N_CONFLICT = yes
MODKDE_DOCS = yes

LIB_DEPENDS =	devel/kf6/ki18n \
		devel/kf6/kcrash \
		devel/kf6/kdbusaddons \
		devel/kf6/kcolorscheme \
		devel/kf6/kconfig \
		devel/kf6/kcoreaddons \
		devel/kf6/kguiaddons \
		devel/kf6/kxmlgui \
		devel/kf6/kiconthemes \
		devel/kf6/kio \
		devel/kf6/kwidgetsaddons \
		devel/kf6/kconfigwidgets \
		x11/qt6/qtdeclarative \
		x11/kde-applications/libkdegames>=${VERSION}

.include <bsd.port.mk>
