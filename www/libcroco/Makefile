# !!! CANNOT BE REMOVED until legacy arches move to the new librsvg version

COMMENT=		generic CSS parsing library for GNOME project

GNOME_PROJECT=		libcroco
GNOME_VERSION=		0.6.13
REVISION=		3

SHARED_LIBS +=  croco-0.6            4.0      # 3.1

CATEGORIES=		www textproc devel

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# LGPLv2.1
PERMIT_PACKAGE=	Yes

WANTLIB += c glib-2.0 iconv intl lzma m pcre2-8 pthread xml2 z

MODULES=		x11/gnome

LIB_DEPENDS=		devel/glib2 \
			textproc/libxml

CONFIGURE_STYLE=	gnu

.include <bsd.port.arch.mk>
.if !${PROPERTIES:Mlld}
# error: -Bsymbolic-functions requested but not supported by ld
CONFIGURE_ARGS +=	--disable-Bsymbolic
.endif

.include <bsd.port.mk>
