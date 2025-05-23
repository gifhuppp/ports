ONLY_FOR_ARCHS = aarch64 amd64
DPB_PROPERTIES = parallel

USE_WXNEEDED =	Yes

COMMENT =	Multiple Arcade Machine Emulator

V =		276
GH_ACCOUNT =	mamedev
GH_PROJECT =	mame
GH_TAGNAME =	mame0${V}
DISTNAME =	mame-0.${V}
CATEGORIES =	emulators

HOMEPAGE =	https://mamedev.org/

MAINTAINER =	Frederic Cambus <fcambus@openbsd.org>

# GPLv2+
PERMIT_PACKAGE =	Yes

WANTLIB += ${COMPILER_LIBCXX} FLAC GL SDL2 SDL2_ttf X11 Xext Xi
WANTLIB += Xinerama c expat fontconfig freetype jpeg m pugixml
WANTLIB += sqlite3 util z zstd

MODULES =	lang/python

MODPY_RUNDEP = No

BUILD_DEPENDS =	devel/asio \
		sysutils/ggrep \
		textproc/rapidjson

LIB_DEPENDS =	archivers/zstd \
		audio/flac \
		databases/sqlite3 \
		devel/sdl2 \
		devel/sdl2-ttf \
		graphics/jpeg \
		textproc/pugixml

CFLAGS +=	-I${PREFIX}/include -I${X11BASE}/include
CFLAGS +=	-Wno-unknown-warning-option -Wno-ignored-qualifiers -fno-ret-protector

MAKE_ENV =	NOWERROR=1 TOOLS=1 verbose=1 \
		OVERRIDE_CC="${CC}" OVERRIDE_CXX="${CXX}" OVERRIDE_LD="${CXX}" \
		OPT_FLAGS="${CXXFLAGS}" \
		PYTHON_EXECUTABLE="${MODPY_BIN}" \
		NO_USE_PORTAUDIO=1 \
		NO_USE_PULSEAUDIO=1 \
		USE_SYSTEM_LIB_ASIO=1 \
		USE_SYSTEM_LIB_EXPAT=1 \
		USE_SYSTEM_LIB_FLAC=1 \
		USE_SYSTEM_LIB_JPEG=1 \
		USE_SYSTEM_LIB_PUGIXML=1 \
		USE_SYSTEM_LIB_RAPIDJSON=1 \
		USE_SYSTEM_LIB_SQLITE3=1 \
		USE_SYSTEM_LIB_ZLIB=1 \
		USE_SYSTEM_LIB_ZSTD=1 \
		USE_PCAP=1 \
		USE_TAPTUN=1 \
		USE_QTDEBUG=0 # avoid depending on Qt

.include <bsd.port.arch.mk>
.if ${PROPERTIES:Mlp64}
MAKE_ENV +=	PTR64=1
.endif

CONFIGURE_STYLE = none

USE_GMAKE =	Yes

MAKE_FILE =	makefile

NO_TEST =	Yes

FIX_CRLF_FILES = makefile scripts/genie.lua \
		3rdparty/genie/build/gmake.bsd/genie.make \
		3rdparty/asio/include/asio/detail/config.hpp \
		docs/man/* keymaps/*

post-extract:
	@mv ${WRKSRC}/3rdparty/genie/build/gmake.freebsd \
		${WRKSRC}/3rdparty/genie/build/gmake.bsd
	@mv ${WRKSRC}/src/lib/util/png.h ${WRKSRC}/src/lib/util/localpng.h
	@sed -i 's,"util/png.h","png.h",' \
		${WRKSRC}/src/frontend/mame/ui/icorender.cpp
	@grep -Rl '"png\.h"' ${WRKSRC}/src | \
		xargs sed -i 's|"png.h"|"localpng.h"|'

pre-configure:
	@ln -s ${LOCALBASE}/bin/ggrep ${WRKDIR}/bin/grep

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mame ${PREFIX}/bin/mame
	${INSTALL_DATA} ${WRKSRC}/docs/man/mame.6 ${PREFIX}/man/man6
.for f in castool chdman floptool imgtool jedutil ldresample ldverify romcmp
	${INSTALL_PROGRAM} ${WRKSRC}/${f} ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/docs/man/${f}.1 ${PREFIX}/man/man1
.endfor
	${INSTALL_DATA_DIR} ${PREFIX}/share/mame
	@cp -r ${WRKSRC}/artwork ${PREFIX}/share/mame
	${INSTALL_DATA_DIR} ${PREFIX}/share/mame/keymaps
.for l in be br ch de es fr gb it pt se
	${INSTALL_DATA} ${WRKSRC}/keymaps/km_${l}_LINUX.map \
		${PREFIX}/share/mame/keymaps/km_${l}.map
.endfor
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/mame
	${SUBST_DATA} ${FILESDIR}/mame.ini \
		${PREFIX}/share/examples/mame/mame.ini

.include <bsd.port.mk>
