COMMENT =	menu library inspired by dmenu
CATEGORIES =	x11

SHARED_LIBS +=	bemenu                    2.0 # 0.6.7

GH_ACCOUNT =	Cloudef
GH_PROJECT =	bemenu
GH_TAGNAME =	0.6.23

# Library and bindings: LGPLv3+
# Everything else: GPLv3+
PERMIT_PACKAGE =	Yes

WANTLIB += X11 Xinerama c cairo curses glib-2.0 gobject-2.0 harfbuzz
WANTLIB += intl m pango-1.0 pangocairo-1.0

BUILD_DEPENDS =	textproc/scdoc

LIB_DEPENDS =	devel/harfbuzz \
		devel/pango

USE_GMAKE =	Yes
MAKE_FILE =	GNUmakefile
MAKE_FLAGS =	LIBbemenu_VERSION="${LIBbemenu_VERSION}"

FAKE_FLAGS =	DESTDIR= mandir="/man/man1"

NO_TEST =	Yes

.include <bsd.port.mk>
