COMMENT=	validating DNS resolver library

DISTNAME=	unbound-1.22.0
PKGNAME=	lib${DISTNAME}

SHARED_LIBS +=  unbound              4.1      # 9.3

CATEGORIES=	net

HOMEPAGE=	https://www.unbound.net/

MAINTAINER=	Stuart Henderson <stu.ports@spacehopper.org>

# BSD
PERMIT_PACKAGE=	Yes

WANTLIB += crypto event pthread ssl

SITES=		https://www.unbound.net/downloads/

SEPARATE_BUILD=	 Yes
CONFIGURE_STYLE= gnu
DEBUG_PACKAGES=	${BUILD_PACKAGES}

# in sync with src/usr.sbin/unbound, apart from --enable-allsymbols
# (enabled in src) and --with-pthreads (enabled here)
CONFIGURE_ARGS+= \
		--enable-event-api \
		--enable-shared \
		--with-ssl=/usr \
		--with-libevent=/usr \
		--with-libexpat=/usr \
		--with-pthreads \
		--without-pythonmodule \
		--with-libunbound-only \
		--with-chroot-dir=/var/unbound \
		--with-pidfile="" \
		--with-rootkey-file=/var/unbound/db/root.key \
		--with-conf-file=/var/unbound/etc/unbound.conf \
		--with-username=_unbound

CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

post-install:
	${INSTALL_DATA} ${WRKBUILD}/contrib/libunbound.pc ${PREFIX}/lib/pkgconfig/

.include <bsd.port.mk>
