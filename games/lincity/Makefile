COMMENT=		Rich city simulation game for X

DISTNAME=		lincity-1.13.1
CATEGORIES=		games
HOMEPAGE=		https://lincity.sourceforge.net/
REVISION=		4

# GPLv2 only
PERMIT_PACKAGE=	Yes

WANTLIB =  ICE SM X11 Xext c iconv intl m png pthread xcb z

SITES=			${SITE_SOURCEFORGE:=lincity/}

LIB_DEPENDS=		devel/gettext,-runtime \
			graphics/png

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		CPPFLAGS="-I${LOCALBASE}/include -I${X11BASE}/include" \
				LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib"
post-extract:
	@cd ${WRKSRC}; ln -s lincity.6 xlincity.6

.include <bsd.port.mk>
