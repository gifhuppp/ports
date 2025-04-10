# Other architectures not fully supported yet
ONLY_FOR_ARCHS = amd64 i386 powerpc mips64

DISTVER =	20231021
PKGVER =	1.1.0.${DISTVER}
PCCVER =	1.2.0.DEVEL

# XXX: If a new release is made:
# DISTVER =	${PCCVER}
# PKGVER =	${PCCVER}
# PCCVER =	1.2.0

EXTRACT_SUFX =	.tgz

CATEGORIES ?=	lang

HOMEPAGE ?=	http://pcc.ludd.ltu.se/

# BSD
PERMIT_PACKAGE =	Yes

# do not include OSREV
CONFIG ?=		${MACHINE_ARCH:S/amd64/x86_64/}-unknown-openbsd

CONFIGURE_STYLE ?=	gnu
CONFIGURE_ARGS ?=	--build=${CONFIG}

NO_TEST ?=		Yes
