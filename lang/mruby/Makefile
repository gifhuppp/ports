BROKEN-arm =		SIGBUS

COMMENT =		lightweight, embeddable implementation of ruby

GH_ACCOUNT =		mruby
GH_PROJECT =		mruby
GH_TAGNAME =		3.3.0

REVISION =		2

CATEGORIES =		lang
HOMEPAGE =		https://mruby.org/

# MIT
PERMIT_PACKAGE =	Yes

WANTLIB += c curses m readline

MODULES =		lang/ruby
BUILD_DEPENDS =		devel/bison
MODRUBY_RUNDEP =	No

MAKE_ENV =		CC="${CC}" \
			LD="${CC}"

NO_CONFIGURE =		Yes
SUBST_VARS =		RUBY

do-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${RAKE} --verbose

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/* ${PREFIX}/bin/
	${INSTALL_DATA_DIR} ${PREFIX}/{lib,include,share/doc}/mruby/ 
	${INSTALL_DATA} ${WRKSRC}/build/host/lib/libmruby*.a ${PREFIX}/lib/
	cp -R ${WRKSRC}/mrb{lib,gems} ${PREFIX}/lib/mruby/
	cp -R ${WRKSRC}/include/* ${PREFIX}/include
	${INSTALL_DATA} ${WRKSRC}/doc/guides/* ${PREFIX}/share/doc/mruby/ 

do-test:
	cd ${WRKSRC} && RUBY=${RUBY} ${RAKE} test

.include <bsd.port.mk>
