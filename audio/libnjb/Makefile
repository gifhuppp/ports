COMMENT=		communicate with some Creative and Dell audio players

DISTNAME=		libnjb-2.2.7
REVISION=		3
CATEGORIES=		audio devel

SHARED_LIBS +=  njb                  0.0      # 6.1

HOMEPAGE=		https://libnjb.sourceforge.net/

# BSD
PERMIT_PACKAGE=	Yes

WANTLIB += c curses pthread usb usb-1.0 z

SITES=			${SITE_SOURCEFORGE:=libnjb/}

LIB_DEPENDS=		devel/libusb-compat

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV=		LDFLAGS="-L${LOCALBASE}/lib" \
			CPPFLAGS="-I${LOCALBASE}/include" \
			HAVE_DOXYGEN="no"

FAKE_FLAGS=		pkgdocdir=${PREFIX}/share/doc/libnjb

.include <bsd.port.mk>
