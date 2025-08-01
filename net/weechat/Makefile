COMMENT-main=	fast, light and extensible chat client
COMMENT-lua=	Lua bindings for weechat
COMMENT-python=	Python bindings for weechat
COMMENT-ruby=	Ruby bindings for weechat
COMMENT-tcl=	Tcl bindings for weechat

V=		4.7.0
DISTNAME=	weechat-${V}

PKGNAME-main=	weechat-${V}
PKGNAME-lua=	weechat-lua-${V}
PKGNAME-python=	weechat-python-${V}
PKGNAME-ruby=	weechat-ruby-${V}
PKGNAME-tcl=	weechat-tcl-${V}

CATEGORIES=	net

HOMEPAGE=	https://www.weechat.org/

MAINTAINER=	Rafael Sadowski <rsadowski@openbsd.org>

# GPLv3
PERMIT_PACKAGE=	Yes

WANTLIB-main += aspell c cjson curl curses gcrypt gnutls iconv intl
WANTLIB-main += m perl pthread z zstd
WANTLIB-lua += ${MODLUA_WANTLIB}
WANTLIB-python += ${MODPY_WANTLIB}
WANTLIB-tcl += ${MODTCL_WANTLIB}
# uses link libruby*.so
WANTLIB-ruby += ${MODRUBY_WANTLIB}

SITES=		https://www.weechat.org/files/src/

# C++ in tests
COMPILER=	base-clang ports-gcc

MULTI_PACKAGES=	-main -lua -python -ruby -tcl


MODULES=	devel/cmake \
		lang/lua \
		lang/python \
		lang/ruby \
		lang/tcl

MODTCL_VERSION=	8.6

MODLUA_RUNDEP=	No
MODPY_RUNDEP=	No
MODRUBY_RUNDEP=	No

BUILD_DEPENDS=	devel/gettext,-tools \
		devel/cpputest \
		sysutils/flock

RUN_DEPENDS=	sysutils/flock \
		devel/desktop-file-utils

LIB_DEPENDS=	archivers/zstd \
		devel/cjson \
		devel/gettext,-runtime \
		net/curl \
		security/gnutls \
		security/libgcrypt \
		textproc/aspell/core

TEST_DEPENDS=	devel/cpputest

LIB_DEPENDS-lua=	${MODLUA_LIB_DEPENDS}
RUN_DEPENDS-lua=	net/weechat,-main ${MODLUA_RUN_DEPENDS}

LIB_DEPENDS-python=	${MODPY_LIB_DEPENDS}
RUN_DEPENDS-python=	net/weechat,-main ${MODPY_RUN_DEPENDS}

LIB_DEPENDS-ruby=	${MODRUBY_LIB_DEPENDS}
RUN_DEPENDS-ruby=	net/weechat,-main ${MODRUBY_RUN_DEPENDS}

LIB_DEPENDS-tcl=	${MODTCL_LIB_DEPENDS}
RUN_DEPENDS-tcl=	net/weechat,-main ${MODTCL_RUN_DEPENDS}

CONFIGURE_ARGS+=	-DENABLE_GUILE=OFF \
			-DENABLE_PHP=OFF \
			-DENABLE_TESTS=ON \
			-DHAVE_BACKTRACE=OFF

CONFIGURE_ARGS+=	-DTCL_TCLSH=${MODTCL_BIN} \
			-DTCL_INCLUDE_PATH=${MODTCL_INCDIR} \
			-DMODTCL_LIB=${MODTCL_LIB}

.include <bsd.port.arch.mk>
.if ${PROPERTIES:Mclang}
# needed for ruby 3 on llvm
CONFIGURE_ENV=		CFLAGS="${CFLAGS} -fdeclspec"
.endif

pre-configure:
	rm -f ${WRKSRC}/cmake/{FindLua,FindRuby,FindTCL}.cmake

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/weechat
	${INSTALL_DATA} ${WRKSRC}/doc/en/weechat_*.en.adoc \
	${PREFIX}/share/doc/weechat/

.include <bsd.port.mk>
