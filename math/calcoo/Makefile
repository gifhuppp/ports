COMMENT=	RPN and algebraic scientific calculator

DISTNAME=	calcoo-1.3.18
REVISION=	12
CATEGORIES=	math
HOMEPAGE=	https://calcoo.sourceforge.net/

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# GPLv2+
PERMIT_PACKAGE=	Yes

SITES=		${SITE_SOURCEFORGE:=calcoo/}

LIB_DEPENDS=	x11/gtk+2

WANTLIB =  X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama Xrandr
WANTLIB += Xrender atk-1.0 c cairo fontconfig freetype gdk-x11-2.0
WANTLIB += gdk_pixbuf-2.0 gio-2.0 glib-2.0 gobject-2.0 gtk-x11-2.0
WANTLIB += harfbuzz intl m pango-1.0 pangocairo-1.0 pangoft2-1.0 z

SEPARATE_BUILD=	Yes
CONFIGURE_STYLE=gnu

.include <bsd.port.mk>
