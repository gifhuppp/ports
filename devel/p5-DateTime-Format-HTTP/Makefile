COMMENT= 	DateTime::Format extension to HTTP formats

MODULES=	cpan 
PKG_ARCH=	*
DISTNAME =	DateTime-Format-HTTP-0.43
CATEGORIES=	devel www

# perl
PERMIT_PACKAGE=	Yes

CONFIGURE_STYLE=modbuild

MAKE_ENV +=  TEST_POD=1 IS_MAINTAINER=1

RUN_DEPENDS=	www/p5-libwww \
		devel/p5-DateTime

.include <bsd.port.mk>
