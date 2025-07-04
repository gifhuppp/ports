COMMENT =	client for the I2P anonymous network

GH_ACCOUNT =	PurpleI2P
GH_PROJECT =	i2pd
GH_TAGNAME =	2.57.0

CATEGORIES =	net
HOMEPAGE =	https://i2pd.website

# BSD
PERMIT_PACKAGE = Yes

WANTLIB += ${COMPILER_LIBCXX}
WANTLIB += boost_filesystem-mt boost_program_options-mt boost_system-mt
WANTLIB += boost_atomic-mt c crypto m miniupnpc ssl z

COMPILER =	base-clang ports-gcc
MODULES =	devel/cmake
LIB_DEPENDS =	devel/boost \
		net/miniupnp/miniupnpc

# for tests
USE_GMAKE =	Yes

CONFIGURE_ARGS =	-DWITH_UPNP=ON

WRKSRC =	${WRKDIST}/build

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/include/i2pd
	${INSTALL_DATA} ${WRKDIST}/libi2pd{,_client}/*.h \
		 ${PREFIX}/include/i2pd
.for dir in family reseed
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/i2pd/certificates/${dir}
	${INSTALL_DATA} ${WRKDIST}/contrib/certificates/${dir}/* \
		${PREFIX}/share/examples/i2pd/certificates/${dir}
.endfor
	${INSTALL_DATA} ${WRKDIST}/contrib/i2pd.conf \
		${PREFIX}/share/examples/i2pd/i2pd.conf
	${INSTALL_DATA} ${WRKDIST}/contrib/tunnels.conf \
		${PREFIX}/share/examples/i2pd/tunnels.conf

do-test:
	cd ${WRKDIST}/tests && ${MAKE_PROGRAM} CXX="${CXX}" \
		LDFLAGS="-L${LOCALBASE}/lib ${LDFLAGS}" \
		INCFLAGS="-I${LOCALBASE}/include -I../libi2pd ${CXXFLAGS}"

.include <bsd.port.mk>
