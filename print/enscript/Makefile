COMMENT=		convert ASCII files to PostScript

DISTNAME=		enscript-1.6.6
CATEGORIES=		print
REVISION=		3

HOMEPAGE=		https://www.gnu.org/software/enscript/

# GPLv3
PERMIT_PACKAGE=	Yes

SITES=			${SITE_GNU:=enscript/}

LIB_DEPENDS=		devel/gettext,-runtime

WANTLIB=  c iconv intl m pthread

CONFIGURE_STYLE=	gnu

FAKE_FLAGS=		sysconfdir=${TRUEPREFIX}/share/examples/enscript

.include <bsd.port.mk>
