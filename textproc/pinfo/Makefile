COMMENT=		info viewer with lynx-style navigation

DISTNAME=		pinfo-0.6.9
REVISION=		3
CATEGORIES=		textproc devel

HOMEPAGE=		https://alioth.debian.org/frs/?group_id=30592

MAINTAINER=		Marc Espie <espie@openbsd.org>

SITES=	https://alioth-archive.debian.org/releases/pinfo/pinfo/pinfo-0.6.9/ \
	${SITE_FREEBSD}

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB=  c curses iconv intl pthread readline

LIB_DEPENDS=		devel/gettext,-runtime

AUTOCONF_VERSION=	2.59
CONFIGURE_STYLE=	autoconf

MAKE_FLAGS+=	INTLLIBS='-L${LOCALBASE}/lib -lintl -liconv'

post-install:
		${INSTALL_DATA_DIR} ${PREFIX}/share/examples/pinfo
		${INSTALL_DATA} ${WRKSRC}/src/pinforc \
			${PREFIX}/share/examples/pinfo/

.include <bsd.port.mk>
