BROKEN-sparc64=	fails in mpn_dm_1.c, error: lvalue required in asm statement
BROKEN-i386=	invalid use of a cast in a inline asm context requiring an l-value: remove the cast or build with -fheinous-gnu-extensions

COMMENT=	Scheme interpreter with Tk interface

STK_VERSION=	4.0.1
DISTNAME=	STk-${STK_VERSION}
REVISION=	20
CATEGORIES=	lang

HOMEPAGE=	http://kaolin.unice.fr/STk/

SITES=		${HOMEPAGE}Distrib/

# BSD-like licenses apply
PERMIT_PACKAGE=	Yes

WANTLIB=	ICE SM X11 c m xcb

CONFIGURE_STYLE=gnu

DESTDIRNAME=	root

NO_TEST=	Yes

STK_ARCH=	OpenBSD-$(MACHINE)
SUBST_VARS=	STK_VERSION STK_ARCH

.include <bsd.port.mk>
