COMMENT =	XBEL bookmarks format support for KDE
DISTNAME =	kbookmarks-${VERSION}

SHARED_LIBS +=  KF6Bookmarks              0.0 # 0.0
SHARED_LIBS +=  KF6BookmarksWidgets       0.0 # 0.0

WANTLIB += ${COMPILER_LIBCXX} GL KF6ConfigCore KF6ConfigGui KF6CoreAddons
WANTLIB += KF6WidgetsAddons Qt6Core Qt6Gui Qt6Widgets Qt6Xml m

BUILD_DEPENDS =	devel/gettext,-tools

LIB_DEPENDS =	devel/kf6/kconfig>=${MODKF6_VERSION} \
		devel/kf6/kcoreaddons>=${MODKF6_VERSION} \
		devel/kf6/kwidgetsaddons>=${MODKF6_VERSION}

TEST_IS_INTERACTIVE =	X11
PORTHOME =		${WRKDIR}

.include <bsd.port.mk>
