COMMENT=	MIT Object Tcl

V=		1.14
DISTNAME=	otcl-src-$V
PKGNAME=	otcl-$V
SHARED_LIBS=	otcl 2.0
CATEGORIES=	lang
MAINTAINER =	Stuart Cassoff <stwo@users.sourceforge.net>
REVISION=	1

HOMEPAGE=	https://otcl-tclcl.sourceforge.net/otcl/

# BSD-like
PERMIT_PACKAGE=	Yes

MODULES +=	x11/tk
WANTLIB=	X11 Xext c m ${MODTK_WANTLIB}
LIB_DEPENDS =	${MODTK_LIB_DEPENDS}

SITES=		${SITE_SOURCEFORGE:=otcl-tclcl/}
WRKDIST=	${WRKDIR}/otcl-$V

CONFIGURE_STYLE= gnu dest
CONFIGURE_ARGS+= --x-includes=${X11BASE}/include \
		--with-tcl=${LOCALBASE} \
		--with-tk=${LOCALBASE} \
		--with-tcl-ver=${MODTCL_VERSION} \
		--with-tk-ver=${MODTCL_VERSION} \
		--x-libraries=${X11BASE}/lib
CONFIGURE_ENV=	LIBotcl_VERSION=${LIBotcl_VERSION}

NO_TEST=	Yes

.include <bsd.port.mk>
