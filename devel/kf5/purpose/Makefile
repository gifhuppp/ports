COMMENT =	framework to create integrate services and actions
DISTNAME =	purpose-${VERSION}
REVISION =	0

SHARED_LIBS +=  KF5Purpose                3.0
SHARED_LIBS +=  KF5PurposeWidgets         2.0
SHARED_LIBS +=  PhabricatorHelpers        2.0
SHARED_LIBS +=  ReviewboardHelpers        2.0

WANTLIB += ${COMPILER_LIBCXX} KF5Completion KF5ConfigCore KF5CoreAddons
WANTLIB += KF5I18n KF5JobWidgets KF5KIOCore KF5KIOGui KF5KIOWidgets
WANTLIB += KF5Notifications KF5Service KF5Solid KF5WidgetsAddons
WANTLIB += KF5WindowSystem Qt5Concurrent Qt5Core Qt5DBus Qt5Gui
WANTLIB += Qt5Network Qt5Qml Qt5Widgets X11 c m

# Special case, KAccounts depends on intltool-merge
MODULES +=	textproc/intltool

BUILD_DEPENDS =	devel/gettext,-tools \
		textproc/intltool \
		devel/kf5/kirigami2>=${MODKF5_VERSION} \
		x11/qt5/qtquickcontrols

RUN_DEPENDS =	x11/qt5/qtquickcontrols \
		devel/kf5/kirigami2>=${MODKF5_VERSION} \
		x11/gtk+4,-guic

LIB_DEPENDS =	devel/kf5/kcompletion>=${MODKF5_VERSION} \
		devel/kf5/kconfig>=${MODKF5_VERSION} \
		devel/kf5/kcoreaddons>=${MODKF5_VERSION} \
		devel/kf5/ki18n>=${MODKF5_VERSION} \
		devel/kf5/kio>=${MODKF5_VERSION} \
		devel/kf5/kjobwidgets>=${MODKF5_VERSION} \
		devel/kf5/knotifications>=${MODKF5_VERSION} \
		devel/kf5/kservice>=${MODKF5_VERSION} \
		devel/kf5/kwidgetsaddons>=${MODKF5_VERSION} \
		devel/kf5/kwindowsystem>=${MODKF5_VERSION} \
		devel/kf5/solid>=${MODKF5_VERSION} \
		x11/qt5/qtdeclarative

CONFIGURE_ARGS +=	-DCMAKE_DISABLE_FIND_PACKAGE_KAccounts=ON

# sucks
TEST_IS_INTERACTIVE =	X11
PORTHOME =		${WRKDIR}

.include <bsd.port.mk>
