L =	eo-en
LANG =	Esperanto/English
V =	1.0.2
REVISION =	0

BUILD_DEPENDS +=	textproc/apertium-lex-tools \
			textproc/vislcg3

EXTRACT_SUFX =	.tar.bz2

USE_GMAKE =	Yes

AUTOCONF_VERSION =	2.71
AUTOMAKE_VERSION =	1.16

CONFIGURE_STYLE =	autoreconf

post-extract:
	sed -i 's,/bin/bash,${LOCALBASE}/bin/bash,' \
		${WRKSRC}/multi-gen.sh

.include <bsd.port.mk>
