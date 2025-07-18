COMMENT =	communications server for Jabber/XMPP written in Lua
DISTNAME =	prosody-13.0.2
CATEGORIES =	net
HOMEPAGE =	https://prosody.im/

MAINTAINER =	Lucas Gabriel Vuotto <lucas@sexy.is>

SITES =		https://prosody.im/downloads/source/

# MIT
PERMIT_PACKAGE =	Yes

MODULES =		lang/lua
MODLUA_VERSION =	5.4

MODLUA_RUN_DEPENDS +=	converters/luastruct \
			databases/luadbi \
			devel/luafs \
			devel/luarocks \
			net/luaunbound \
			security/luasec \
			textproc/luaexpat
LIB_DEPENDS =		textproc/icu4c

# fails, depends on busted not yet in
NO_TEST =		Yes
TEST_DEPENDS =		${MODLUA_RUN_DEPENDS}

WANTLIB += crypto icudata icui18n icuuc

CONFIGURE_STYLE =	simple
CONFIGURE_ARGS +=	--prefix="${PREFIX}" \
			--sysconfdir="${SYSCONFDIR}/prosody" \
			--datadir="${VARBASE}/prosody" \
			--with-lua="${LOCALBASE}" \
			--with-lua-include="${MODLUA_INCL_DIR}" \
			--lua-version="${MODLUA_VERSION}" \
			--no-example-certs \
			--idn-library=icu \
			--c-compiler="${CC}" \
			--linker="${CC}" \
			--ldflags="-L/usr/lib -L${LOCALBASE}/lib -shared" \
			--cflags="${CFLAGS} -I${LOCALBASE}/include -fPIC -std=c99"

MAKE_FILE =		makefile

FAKE_FLAGS +=		CONFIG=${DESTDIR}${PREFIX}/share/examples/prosody

pre-configure:
	cd ${WRKSRC}; sed -i -e 's,^#!/usr/bin/env lua,#!${MODLUA_BIN},' -e \
		's,^lua ,${MODLUA_BIN} ,' prosody prosodyctl \
		tools/migration/prosody-migrator.lua

post-patch:
	${SUBST_CMD} ${WRKSRC}/util/prosodyctl.lua

post-build:
	${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${MAKE_FLAGS} \
		-C ${WRKSRC}/tools/migration

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/prosody
	${INSTALL_DATA} ${WRKSRC}/README \
		${PREFIX}/share/doc/prosody
	${INSTALL_DATA} ${WRKSRC}/certs/makefile \
		${PREFIX}/share/examples/prosody/certs/Makefile
	${INSTALL_DATA} ${WRKSRC}/certs/openssl.cnf \
		${PREFIX}/share/examples/prosody/certs
	${INSTALL_SCRIPT} ${WRKSRC}/tools/migration/prosody-migrator.install \
		${PREFIX}/sbin/prosody-migrator
	${INSTALL_DATA} ${WRKSRC}/tools/migration/migrator.cfg.lua.install \
		${PREFIX}/share/examples/prosody/migrator.cfg.lua

.include <bsd.port.mk>
