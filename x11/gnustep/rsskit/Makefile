COMMENT =	framework for reading different types of RSS formats

REVISION =	15
DISTNAME =	RSSKit-0.4

SHARED_LIBS +=	RSSKit	0.0

HOMEPAGE =	http://gap.nongnu.org/grr/
SITES =		${SITE_SAVANNAH:=gap/}

MODULES =		x11/gnustep
MODGNUSTEP_IS_FRAMEWORK = Yes
WANTLIB += 	gnustep-base objc2 pthread

MAKE_FLAGS =	RSSKit_INTERFACE_VERSION=${LIBRSSKit_VERSION}

.include <bsd.port.mk>
