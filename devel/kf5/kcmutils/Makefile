COMMENT =	utility classes for KDE control modules
DISTNAME =	kcmutils-${VERSION}

SHARED_LIBS =   KF5KCMUtils               7.1
SHARED_LIBS +=  KF5KCMUtilsCore           0.0 # 0.0

WANTLIB += ${COMPILER_LIBCXX} KF5Auth KF5AuthCore KF5Codecs KF5ConfigCore
WANTLIB += KF5ConfigGui KF5ConfigWidgets KF5CoreAddons KF5Declarative
WANTLIB += KF5GuiAddons KF5I18n KF5ItemViews KF5Package KF5QuickAddons
WANTLIB += KF5Service KF5WidgetsAddons KF5XmlGui Qt5Core Qt5DBus
WANTLIB += Qt5Gui Qt5Network Qt5Qml Qt5QmlModels Qt5Quick Qt5QuickWidgets
WANTLIB += Qt5Widgets Qt5Xml c m

BUILD_DEPENDS =	devel/gettext,-tools \
		x11/qt5/qtquickcontrols

RUN_DEPENDS =	x11/qt5/qtquickcontrols

LIB_DEPENDS =	devel/kf5/kconfigwidgets>=${MODKF5_VERSION} \
		devel/kf5/kcoreaddons>=${MODKF5_VERSION} \
		devel/kf5/kdeclarative>=${MODKF5_VERSION} \
		devel/kf5/ki18n>=${MODKF5_VERSION} \
		devel/kf5/kitemviews>=${MODKF5_VERSION} \
		devel/kf5/kpackage>=${MODKF5_VERSION} \
		devel/kf5/kservice>=${MODKF5_VERSION} \
		devel/kf5/kxmlgui>=${MODKF5_VERSION} \
		x11/qt5/qtdeclarative

.include <bsd.port.mk>
