COMMENT=		simulation of water waves on the X Window desktop

DISTNAME=		xdesktopwaves-1.4
CATEGORIES=		x11
REVISION=		0

HOMEPAGE=		https://xdesktopwaves.sourceforge.net/

# GPLv2
PERMIT_PACKAGE=	Yes

SITES=			${SITE_SOURCEFORGE:=xdesktopwaves/}

WANTLIB=		X11 Xext c m
NO_TEST=		Yes

# cpuid check code clobbers %ebx, used by PIE
.if ${MACHINE_ARCH:Mi386}
MAKE_FLAGS+=		XDW_MAX_OPTIMIZATION=0
.endif

.include <bsd.port.mk>
