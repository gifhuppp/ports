BROKEN-powerpc=	does not build, error: lvalue required as increment operand
BROKEN-powerpc64=	does not build, error: lvalue required as increment operand
# missing assembly for arch
NOT_FOR_ARCHS=	arm aarch64 riscv64

COMMENT=	Portable Forth Environment

DISTNAME=	pfe-0.33.71
REVISION=	3
CATEGORIES=    	lang

SHARED_LIBS +=  pfe                  33.71    # .33.71
SHARED_LIBS +=  pfe-0-forth          33.71    # .33.71

HOMEPAGE=	https://pfe.sourceforge.net/

# LGPLv2
PERMIT_PACKAGE=	Yes

WANTLIB=	c m curses

SITES=		${SITE_SOURCEFORGE:=pfe/}
EXTRACT_SUFX=	.tar.bz2

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		--mandir=${PREFIX}/man

# this renames floating.so to libfloating.so before linking with it
USE_LIBTOOL=	gnu

# requires gmake
NO_TEST=	Yes

.include <bsd.port.arch.mk>

# global register variables
.if ${PROPERTIES:Mclang}
CONFIGURE_ARGS+=	--without-regs
.endif

# XXX remove CVS Id  (patch-pfe_Makefile_in)
post-extract:
	perl -pi -e 's,^#.*Id: Makefile.am.*,,' ${WRKSRC}/pfe/Makefile.in

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/pfe/
	${INSTALL_DATA} ${WRKDIST}/doc/Forthprimer.pdf \
		${PREFIX}/share/doc/pfe/

.include <bsd.port.mk>
