COMMENT =		legacy support for kdelibs-4.x compatibility
DISTNAME =		kdelibs4support-${VERSION}
IS_PORTING_AID =	Yes
REVISION =		3

SHARED_LIBS =		KF5KDELibs4Support	8.0

WANTLIB += ${COMPILER_LIBCXX} ICE KF5Auth KF5AuthCore KF5Bookmarks
WANTLIB += KF5Codecs KF5Completion KF5ConfigCore KF5ConfigGui
WANTLIB += KF5ConfigWidgets KF5CoreAddons KF5Crash KF5DBusAddons
WANTLIB += KF5GlobalAccel KF5GuiAddons KF5I18n KF5IconThemes KF5ItemViews
WANTLIB += KF5JobWidgets KF5KIOCore KF5KIOFileWidgets KF5KIOGui
WANTLIB += KF5KIOWidgets KF5Notifications KF5Parts KF5Service
WANTLIB += KF5Solid KF5SonnetUi KF5TextWidgets KF5UnitConversion
WANTLIB += KF5WidgetsAddons KF5WindowSystem KF5XmlGui Qt5Concurrent
WANTLIB += Qt5Core Qt5DBus Qt5Designer Qt5Gui Qt5Network Qt5PrintSupport
WANTLIB += Qt5Svg Qt5Test Qt5Widgets Qt5X11Extras Qt5Xml SM X11
WANTLIB += Xext c m xcb

MODULES =	lang/python
MODPY_RUNDEP =	No

BUILD_DEPENDS =	devel/gettext,-tools \
		devel/kf5/kded>=${MODKF5_VERSION} \
		devel/kf5/kdesignerplugin>=${MODKF5_VERSION} \
		devel/kf5/kdoctools>=${MODKF5_VERSION} \
		devel/kf5/kemoticons>=${MODKF5_VERSION} \
		www/p5-URI

RUN_DEPENDS =	devel/kf5/kded>=${MODKF5_VERSION} \
		devel/kf5/kdesignerplugin>=${MODKF5_VERSION} \
		devel/kf5/kdoctools>=${MODKF5_VERSION} \
		devel/kf5/kemoticons>=${MODKF5_VERSION} \
		devel/kf5/kinit>=${MODKF5_VERSION} \
		devel/kf5/kitemmodels>=${MODKF5_VERSION}

LIB_DEPENDS =	devel/kf5/kauth>=${MODKF5_VERSION} \
		devel/kf5/kbookmarks>=${MODKF5_VERSION} \
		devel/kf5/kcodecs>=${MODKF5_VERSION} \
		devel/kf5/kcompletion>=${MODKF5_VERSION} \
		devel/kf5/kconfig>=${MODKF5_VERSION} \
		devel/kf5/kconfigwidgets>=${MODKF5_VERSION} \
		devel/kf5/kcrash>=${MODKF5_VERSION} \
		devel/kf5/kdbusaddons>=${MODKF5_VERSION} \
		devel/kf5/kglobalaccel>=${MODKF5_VERSION} \
		devel/kf5/kguiaddons>=${MODKF5_VERSION} \
		devel/kf5/ki18n>=${MODKF5_VERSION} \
		devel/kf5/kiconthemes>=${MODKF5_VERSION} \
		devel/kf5/kio>=${MODKF5_VERSION} \
		devel/kf5/knotifications>=${MODKF5_VERSION} \
		devel/kf5/kparts>=${MODKF5_VERSION} \
		devel/kf5/kservice>=${MODKF5_VERSION} \
		devel/kf5/ktextwidgets>=${MODKF5_VERSION} \
		devel/kf5/kunitconversion>=${MODKF5_VERSION} \
		devel/kf5/kwidgetsaddons>=${MODKF5_VERSION} \
		devel/kf5/kwindowsystem>=${MODKF5_VERSION} \
		devel/kf5/kxmlgui>=${MODKF5_VERSION} \
		x11/qt5/qtsvg \
		x11/qt5/qttools \
		x11/qt5/qtx11extras

CONFIGURE_ARGS =	-DCMAKE_DISABLE_FIND_PACKAGE_NetworkManager=ON

# sucks
TEST_IS_INTERACTIVE =	X11
PORTHOME =		${WRKDIR}

post-install:
	${MODPY_COMPILEALL} ${PREFIX}/lib/cmake/KF5KDELibs4Support

.include <bsd.port.mk>
