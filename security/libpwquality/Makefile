COMMENT =		library to generate, and check strengh of passwords

MODPY_DISTV =	1.4.5
GH_PROJECT =		libpwquality
GH_ACCOUNT =		libpwquality
GH_TAGNAME =		libpwquality-${MODPY_DISTV}
DISTNAME =		libpwquality-${MODPY_DISTV}
REVISION =		3

SHARED_LIBS +=  pwquality            1.0      # 1.2

CATEGORIES =		security

MAINTAINER =		Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2+
PERMIT_PACKAGE =	Yes

WANTLIB =  c crack iconv intl pthread z

MODULES =		lang/python
MODPY_SETUPTOOLS =	Yes

USE_GMAKE =		Yes

BUILD_DEPENDS =		devel/gettext,-tools \
			shells/bash

LIB_DEPENDS =		security/cracklib

CONFIGURE_STYLE =	autoreconf
CONFIGURE_ARGS =	--with-python-binary=python${MODPY_VERSION} \
			--with-python-rev=${MODPY_VERSION} \
			--with-sconfigdir=${SYSCONFDIR} \
			--disable-pam
CONFIGURE_ENV =		LDFLAGS="-L${LOCALBASE}/lib"

DEBUG_PACKAGES =	${BUILD_PACKAGES}

FAKE_FLAGS =		secureconfdir=${PREFIX}/share/examples/libpwquality/

AUTOCONF_VERSION =	2.69
AUTOMAKE_VERSION =	1.16

.include <bsd.port.mk>
