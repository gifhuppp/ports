COMMENT=	dancers shell or distributed shell

DISTNAME =	dsh-0.25.10
CATEGORIES=	sysutils net
REVISION =	2

HOMEPAGE=	http://www.netfort.gr.jp/~dancer/software/dsh.html.en
SITES=		http://www.netfort.gr.jp/~dancer/software/downloads/

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB =  c dshconfig iconv intl pthread

LIB_DEPENDS=		devel/gettext,-runtime \
			devel/libdshconfig

CONFIGURE_STYLE= 	gnu
CONFIGURE_ENV =         CPPFLAGS="-I${LOCALBASE}/include" \
                        LDFLAGS="-L${LOCALBASE}/lib" \
			LIBS="-lintl -liconv"

FAKE_FLAGS=		sysconfdir=${TRUEPREFIX}/share/examples

post-configure:
	@perl -pi -e 's,rsh,ssh,' ${WRKSRC}/dsh.conf

.include <bsd.port.mk>
