COMMENT =	online account providers for the KAccounts system

DISTNAME =	kaccounts-providers-${VERSION}

CATEGORIES =	net devel

MODKDE_TRANSLATIONS = yes
MODKF5_L10N_CONFLICT = yes
MODKDE_ICON_CACHE = yes

WANTLIB += ${COMPILER_LIBCXX} GL KF6CoreAddons KF6I18n KF6KIOCore
WANTLIB += KF6Package QCoro6Core Qt6Core Qt6DBus Qt6Gui Qt6Network
WANTLIB += Qt6OpenGL Qt6Positioning Qt6Qml Qt6QmlMeta Qt6QmlModels
WANTLIB += Qt6QmlWorkerScript Qt6Quick Qt6WebChannel Qt6WebChannelQuick
WANTLIB += Qt6WebEngineCore Qt6WebEngineQuick Qt6Xml accounts-qt6
WANTLIB += kaccounts6 m

MODULES +=	textproc/intltool

LIB_DEPENDS =	devel/kf6/kcoreaddons \
		devel/kf6/ki18n \
		devel/kf6/kio \
		devel/kf6/kpackage \
		devel/qcoro,qt6 \
		net/libaccounts-qt,qt6 \
		x11/kde-applications/kf6-kaccounts-integration>=${VERSION} \
		x11/qt6/qtdeclarative \
		x11/qt6/qtpositioning \
		x11/qt6/qtwebchannel \
		x11/qt6/qtwebengine

TEST_IS_INTERACTIVE =	X11

.include <bsd.port.mk>
