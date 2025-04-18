# Check individual packages for overrides when bumping this!
PKGNAMEBASE=	${DISTNAME:C/aspell[0-9]/aspell/}
PKGNAME?=	${PKGNAMEBASE:C/-([0-9])$/.\1/}
EPOCH?=		1
FIX_EXTRACT_PERMISSIONS=Yes

DIST_SUBDIR?=	aspell

EXTRACT_SUFX?=	.tar.bz2

HOMEPAGE?=	https://aspell.sourceforge.net/

# GPLv2 - LGPLv2 - FDL - CC ShareAlike
PERMIT_PACKAGE?=	Yes

NO_TEST?=	Yes

CONFIGURE_STYLE?=simple

RUN_DEPENDS?=	textproc/aspell/core
BUILD_DEPENDS?=	${RUN_DEPENDS}
