COMMENT=		client for MPD to submit tracks to Last.fm
CATEGORIES=		audio
DISTNAME=		scmpc-0.4.1
REVISION=		3

HOMEPAGE=		http://cmende.github.io/scmpc/

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB =  c confuse curl glib-2.0 iconv intl mpdclient pthread

SITES=			https://bitbucket.org/cmende/scmpc/downloads/

CONFIGURE_STYLE=	gnu

LIB_DEPENDS=		devel/glib2 \
			audio/libmpdclient \
			devel/libconfuse \
			net/curl

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/scmpc/
	${INSTALL_DATA} ${WRKSRC}/scmpc.conf.example \
		${PREFIX}/share/examples/scmpc/

.include <bsd.port.mk>
