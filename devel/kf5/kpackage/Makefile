COMMENT =		installation and loading of content packages in KDE
DISTNAME =		kpackage-${VERSION}

SHARED_LIBS =		KF5Package		7.3

WANTLIB += ${COMPILER_LIBCXX} KF5Archive KF5CoreAddons KF5I18n
WANTLIB += Qt5Core Qt5DBus c m

BUILD_DEPENDS =	devel/gettext,-tools \
		devel/kf5/kdoctools>=${MODKF5_VERSION}

RUN_DEPENDS =	devel/kf5/kdoctools>=${MODKF5_VERSION}

LIB_DEPENDS =	devel/kf5/karchive>=${MODKF5_VERSION} \
		devel/kf5/kcoreaddons>=${MODKF5_VERSION} \
		devel/kf5/ki18n>=${MODKF5_VERSION}

PORTHOME =		${WRKDIR}
TEST_IS_INTERACTIVE =	X11

.include <bsd.port.mk>
