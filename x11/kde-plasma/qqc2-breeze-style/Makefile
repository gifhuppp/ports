COMMENT =	Breeze QQC2 Style
DISTNAME =	qqc2-breeze-style-${VERSION}

MODKDE_TRANSLATIONS = Yes
MODKDE_ICON_CACHE = Yes

WANTLIB += ${COMPILER_LIBCXX} GL KF6ColorScheme KF6ConfigCore
WANTLIB += KF6GuiAddons KF6IconThemes KirigamiPlatform Qt6Core
WANTLIB += Qt6DBus Qt6Gui Qt6Network Qt6OpenGL Qt6Qml Qt6QmlMeta
WANTLIB += Qt6QmlModels Qt6QmlWorkerScript Qt6Quick Qt6QuickControls2
WANTLIB += Qt6QuickTemplates2 m

BUILD_DEPENDS =	devel/kf6/kquickcharts \
		devel/kf6/kcoreaddons

RUN_DEPENDS =	devel/kf6/kquickcharts \
		devel/kf6/kcoreaddons

LIB_DEPENDS =	devel/kf6/kcolorscheme \
		devel/kf6/kconfig \
		devel/kf6/kguiaddons \
		devel/kf6/kiconthemes \
		devel/kf6/kirigami \
		x11/qt6/qtdeclarative

.include <bsd.port.mk>
