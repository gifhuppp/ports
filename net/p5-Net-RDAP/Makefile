COMMENT=	Perl interface to the Registration Data Access Protocol

MODULES=	cpan
DISTNAME=	Net-RDAP-0.40
CATEGORIES=	net
PKG_ARCH=	*

# BSD
PERMIT_PACKAGE=	Yes

MAINTAINER=	Stuart Henderson <stu.ports@spacehopper.org>

RUN_DEPENDS=	devel/p5-DateTime-Tiny \
		devel/p5-File-Slurp \
		www/p5-HTTP-Date \
		www/p5-HTTP-Message \
		www/p5-LWP-Protocol-https \
		www/p5-libwww \
		mail/p5-MIME-Types \
		security/p5-Mozilla-CA-Fake \
		net/p5-Net-ASN \
		net/p5-Net-DNS \
		net/p5-Net-IP \
		www/p5-URI \
		textproc/p5-XML-LibXML

TEST_DEPENDS=	devel/p5-Carp-Always \
		net/p5-LWP-Online

.include <bsd.port.mk>
