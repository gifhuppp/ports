COMMENT=		convert text strings to printed bars

DISTNAME=		barcode-0.99
CATEGORIES=		graphics
REVISION=		3

# GPLv3+
PERMIT_PACKAGE=	Yes

WANTLIB =  c iconv intl m paper pthread

SITES=			${SITE_GNU:=barcode/}

LIB_DEPENDS=		devel/gettext,-runtime \
			print/libpaper

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib" \
			ac_cv_func_calloc_0_nonnull=yes

post-install:
	rm ${PREFIX}/bin/sample

.include <bsd.port.mk>
