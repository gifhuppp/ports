COMMENT=	library to determine file type

V=		5.46
DISTNAME=	file-${V}
PKGNAME=	libmagic-${V}
REVISION=	0

SHARED_LIBS +=  magic                5.1      # 1.0

CATEGORIES=	sysutils devel

HOMEPAGE=	https://www.darwinsys.com/file/

# BSD
PERMIT_PACKAGE=	Yes

WANTLIB =  c m z

SITES=		http://ftp.astron.com/pub/file/

CONFIGURE_STYLE= gnu
CONFIGURE_ARGS=	--enable-fsect-man5

DEBUG_PACKAGES=	${BUILD_PACKAGES}

post-install:
	mv ${PREFIX}/bin/{,e}file
	mv ${PREFIX}/man/man1/{,e}file.1

.include <bsd.port.mk>
