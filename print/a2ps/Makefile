COMMENT=	format files for printing on PostScript printers

DISTNAME=	a2ps-4.15.7

SHARED_LIBS +=  a2ps 3.0

CATEGORIES=	print

HOMEPAGE=	https://www.gnu.org/software/a2ps/

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv3 or later, includes AFM files from Adobe with still unclear
# terms (see ${WRKSRC}/afm/MustRead.html).
PERMIT_PACKAGE=	Yes

WANTLIB += c gc iconv intl m paper pthread

SITES=		${SITE_GNU:=a2ps/}

USE_GMAKE=	Yes

BUILD_DEPENDS=	print/psutils

RUN_DEPENDS=	print/psutils

LIB_DEPENDS=	devel/boehm-gc \
		devel/gettext,-runtime \
		print/libpaper

MODGNU_CONFIG_GUESS_DIRS=	${WRKSRC} ${WRKSRC}/ogonkify

CONFIGURE_STYLE=gnu

CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		ac_cv_path_grog=

CONFIGURE_ARGS=	--without-emacs \
		--with-lispdir=${PREFIX}/share/emacs/site-lisp

.for p in bzip2 gv ghostview dvips pdf2ps tex latex ps2pdf \
	  bzip distill netscape html2ps grog convert
CONFIGURE_ENV+= ac_cv_prog_COM_$p=no
.endfor

pre-configure:
	${SUBST_CMD} ${WRKSRC}/etc/a2ps{_,-site.}cfg.in

pre-build:
	/usr/bin/touch $(WRKSRC)/doc/*.info
	/usr/bin/touch $(WRKSRC)/doc/*.dvi

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/a2ps
	mv ${WRKINST}${SYSCONFDIR}/a2ps{,-site}.cfg \
		${PREFIX}/share/examples/a2ps

.include <bsd.port.mk>
