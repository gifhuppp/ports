COMMENT =	KDE Filesharing via Samba
DISTNAME =	kdenetwork-filesharing-${VERSION}
CATEGORIES =	devel

WANTLIB += ${COMPILER_LIBCXX} GL KF6AuthCore KF6Completion KF6ConfigCore
WANTLIB += KF6CoreAddons KF6I18n KF6JobWidgets KF6KIOCore KF6KIOGui
WANTLIB += KF6KIOWidgets KF6Service KF6Solid KF6WidgetsAddons
WANTLIB += Qt6Core Qt6DBus Qt6Gui Qt6Network Qt6OpenGL Qt6Qml
WANTLIB += Qt6QmlMeta Qt6QmlModels Qt6QmlWorkerScript Qt6Quick
WANTLIB += Qt6QuickWidgets Qt6Widgets c m

MODKDE_TRANSLATIONS = yes
MODKF5_I18N_CONFLICT = yes
MODKF5_L10N_CONFLICT = yes

BUILD_DEPENDS =	devel/qcoro,qt6

RUN_DEPENDS =	net/samba \
		x11/dbus,-suid

LIB_DEPENDS =	devel/kf6/kcompletion \
		devel/kf6/kauth \
		devel/kf6/kconfig \
		devel/kf6/kcoreaddons \
		devel/kf6/ki18n \
		devel/kf6/kio \
		devel/kf6/kjobwidgets \
		devel/kf6/kservice \
		devel/kf6/kwidgetsaddons \
		devel/kf6/solid \
		x11/qt6/qtdeclarative

.include <bsd.port.mk>
