COMMENT=	lightweight regexp matching library with additional features

DISTNAME=		tre-0.8.0
EXTRACT_SUFX=		.tar.bz2
CATEGORIES=		textproc
REVISION=		5

HOMEPAGE=		http://laurikari.net/tre/

SITES=			${HOMEPAGE}

MAINTAINER=		Matthias Kilian <kili@openbsd.org>

# 2-clause BSD
PERMIT_PACKAGE=	Yes

SHARED_LIBS +=	tre                  7.0      # 5.0

WANTLIB=		c iconv intl pthread

LIB_DEPENDS=		devel/gettext,-runtime

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--enable-static

.include <bsd.port.mk>
