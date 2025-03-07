COMMENT =		range library for C++14/17/20

GH_ACCOUNT =		ericniebler
GH_PROJECT =		range-v3
GH_TAGNAME =		0.12.0
CATEGORIES =		devel
REVISION =		0

# BSL 1.0 (boost software license)
PERMIT_PACKAGE =	Yes

MAINTAINER =		Klemens Nanni <kn@openbsd.org>

# C++14 or higher
COMPILER =		base-clang ports-gcc
COMPILER_LANGS =	c++

MODULES =		devel/cmake

# print more configure results, e.g. CXXFLAGS used
CONFIGURE_ARGS +=	-DRANGES_VERBOSE_BUILD=ON

# disable hardware specific optimizations
CONFIGURE_ARGS +=	-DRANGES_NATIVE=OFF

# avoid using doxygen (configure would still detect it)
CONFIGURE_ARGS +=	-DRANGE_V3_DOCS=OFF \
			-DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=ON

# avoid picking up git and fetching during tests
CONFIGURE_ARGS +=	-DCMAKE_DISABLE_FIND_PACKAGE_Git=ON

# avoid picking up boost due to this example (configure would still detect it)
CONFIGURE_ARGS +=	-DRANGES_BUILD_CALENDAR_EXAMPLE=OFF \
			-DCMAKE_DISABLE_FIND_PACKAGE_Boost=ON
# not needed for now
CONFIGURE_ARGS +=	-DRANGE_V3_EXAMPLES=OFF

# just header files
PKG_ARCH =		*

# compile tests only when testing
NO_BUILD =		Yes

pre-test:
	${MODCMAKE_BUILD_TARGET}

.include <bsd.port.mk>

.if ${PROPERTIES:Mclang}
# error: identifier '...' is reserved because it contains '__' [-Werror,-Wreserved-identifier]
# # error: '~...' overrides a destructor but is not marked 'override' [-Werror,-Wsuggest-destructor-override]
# # error: '...' overrides a member function but is not marked 'override' [-Werror,-Wsuggest-override]
CONFIGURE_FLAGS +=      -DRANGES_HAS_WERROR=0
# prevent warning spam
CXXFLAGS +=	-Wno-reserved-identifier \
		-Wno-suggest-destructor-override \
		-Wno-suggest-override
.endif
