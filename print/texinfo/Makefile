COMMENT =		official documentation format of the GNU project

DISTNAME =		texinfo-7.1
REVISION =		1

CATEGORIES =		print

HOMEPAGE =		https://www.gnu.org/software/texinfo/

# GPLv3
PERMIT_PACKAGE =	Yes

WANTLIB += c iconv intl curses pthread unistring

SITES =			${SITE_GNU:=texinfo/}

BUILD_DEPENDS =		devel/help2man \
			lang/gawk
RUN_DEPENDS =		print/texlive/base
LIB_DEPENDS =		converters/libunistring \
			devel/gettext,-runtime 
TEST_DEPENDS =		${RUN_DEPENDS}

FAKE_FLAGS =		TEXMF=${PREFIX}/share/texmf-local

LIBTOOL_FLAGS =		--tag=disable-static
CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS =	--program-prefix=g
CONFIGURE_ENV =		ac_cv_prog_AWK=gawk

INSTALL_TARGET =	install install-tex

# gtexindex is a shell script which hardcodes texindex.awk
post-install:
	cd ${PREFIX}/info && for i in *.info*; do mv $$i g$$i; done
	cd ${PREFIX}/share/texinfo && mv gtexindex.awk texindex.awk

.include <bsd.port.mk>
