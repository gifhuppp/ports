COMMENT =	library and QML module for Accounts-SSO and SignOn-SSO

DISTNAME =	kaccounts-integration-${VERSION}
PKGNAME =	kf6-kaccounts-integration-${VERSION}

CATEGORIES =	net devel

SHARED_LIBS +=  kaccounts6                0.0 # 0.0

WANTLIB += ${COMPILER_LIBCXX} GL KF6ColorScheme KF6ConfigCore
WANTLIB += KF6ConfigGui KF6ConfigWidgets KF6CoreAddons KF6DBusAddons
WANTLIB += KF6I18n KF6KCMUtils KF6KCMUtilsCore KF6KCMUtilsQuick
WANTLIB += KF6KIOCore KF6Wallet KF6WidgetsAddons QCoro6Core Qt6Core
WANTLIB += Qt6DBus Qt6Gui Qt6Network Qt6Qml Qt6Widgets Qt6Xml
WANTLIB += accounts-qt6 m signon-qt6

MODKDE_TRANSLATIONS = yes
MODKF5_L10N_CONFLICT = yes
MODKDE_DESKTOP_FILE = yes

LIB_DEPENDS =	devel/kf6/kcmutils \
		devel/kf6/kcolorscheme \
		devel/kf6/kconfig \
		devel/kf6/kconfigwidgets \
		devel/kf6/kcoreaddons \
		devel/kf6/kdbusaddons \
		devel/kf6/ki18n \
		devel/kf6/kio \
		devel/kf6/kwallet \
		devel/kf6/kwidgetsaddons \
		devel/qcoro,qt6 \
		net/libaccounts-qt,qt6 \
		net/signond-qt6 \
		x11/qt6/qtdeclarative

TEST_IS_INTERACTIVE =	X11

.include <bsd.port.mk>
