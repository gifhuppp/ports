# Runtime failures on i386 in IO#pos and IO#rewind
ONLY_FOR_ARCHS = amd64

COMMENT =	pure-Java implementation of the Ruby language

V =		10.0.1.0
DISTNAME =	jruby-dist-${V}-bin
PKGNAME =	jruby-${V}
CATEGORIES =	lang lang/ruby
DISTFILES.jffi =jffi-1.3.10.tar.gz
DISTFILES.gem =	${JRUBY_LAUNCHER_GEM}

REVISION =	0

HOMEPAGE =	http://www.jruby.org/

MAINTAINER =	Jeremy Evans <jeremy@openbsd.org>

# EPLv1/GPLv2/LGPLv2.1/Ruby/MIT/BSD/Apache/CPL
PERMIT_PACKAGE =	Yes

SITES =		https://repo1.maven.org/maven2/org/jruby/jruby-dist/${V}/
SITES.jffi =	https://github.com/jnr/jffi/archive/refs/tags/
SITES.gem =	${SITE_RUBYGEMS}

MODULES =	java gnu
MODGNU_CONFIG_GUESS_DIRS = ${WRKSRC}/jffi/jni/libffi
MODJAVA_VER =	21+
MODJAVA_BUILD =	ant
USE_GMAKE =	Yes

WANTLIB =	c m pthread ${COMPILER_LIBCXX}

COMPILER =		base-clang ports-gcc base-gcc

BUILD_DEPENDS = shells/bash
RUN_DEPENDS =	java/javaPathHelper

JRUBY_HOME =	${PREFIX}/jruby

MAKE_ENV+=	CXX=${CXX} \
		ax_enable_builddir_sed=/usr/bin/sed
WRKDIST =	${WRKDIR}/jruby-${V}
JFFI_HOME =	${WRKDIST}/jffi
JFFI_ARCH =	${MACHINE_ARCH:S/amd64/x86_64/}-OpenBSD
FFI_ARCH =	${JFFI_ARCH:L}
JRUBY_LAUNCHER_GEM = jruby-launcher-1.1.19-java.gem
JRUBY_RUBY_VERSION =	3.1
SUBST_VARS =	JRUBY_HOME JFFI_ARCH FFI_ARCH RAKE_V RDOC_V JAVA_HOME

MODJAVA_BUILD_DIR = ${JFFI_HOME}
MODJAVA_BUILD_TARGET_NAME = jar

post-extract:
	mv ${WRKDIR}/jffi-jffi* ${JFFI_HOME}
	# Unpack the jruby-launcher gem, since it needs to be patched
	cd ${WRKSRC} && mkdir jruby-launcher \
		&& cd jruby-launcher && tar zxf ../../data.tar.gz \
		&& rm -f ../../data.tar.gz

do-configure:
	${SUBST_CMD} ${WRKSRC}/jruby-launcher/jrubyexe.cpp \
		${WRKSRC}/jruby-launcher/unixlauncher.cpp
	cd ${WRKSRC}/jruby-launcher/ && ${SETENV} ${MAKE_ENV} \
		../bin/jruby extconf.rb
	perl -pi -e '$$. == 1 && s|^.*env j?ruby.*$$|\#!${LOCALBASE}/bin/jruby|;' \
                -e '$$. == 1 && s|^.*bin/j?ruby.*$$|\#!${LOCALBASE}/bin/jruby|;' \
                -e 'close ARGV if eof;' ${WRKSRC}/bin/!(*.*)

do-build:
	${MODJAVA_BUILD_TARGET}
	rm -rf ${WRKSRC}/lib/jni
	mkdir -p ${WRKSRC}/lib/jni/${JFFI_ARCH}
	cp ${JFFI_HOME}/build/jni/libjffi-1.2.so \
		${WRKSRC}/lib/jni/${JFFI_ARCH}
	cd ${WRKSRC}/lib/ruby/stdlib/ffi/platform && \
		rm -r !(${FFI_ARCH}|*.ffi)
	cd ${WRKSRC}/jruby-launcher/ && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${MAKE_FLAGS} \
		&& mv jruby ../bin

do-install:
	ln -s ${TRUEPREFIX}/jruby/bin/jruby ${PREFIX}/bin/jruby
	${INSTALL_DATA_DIR} ${JRUBY_HOME}
	${INSTALL_DATA_DIR} ${JRUBY_HOME}/bin
	for file in ast bundle bundler erb irb gem jgem jirb jirb_swing jruby jrubyc racc rake rdoc ri; \
	  do ${INSTALL_SCRIPT} ${WRKBUILD}/bin/$$file ${JRUBY_HOME}/bin/$$file; \
	done
	${INSTALL_DATA_DIR} ${JRUBY_HOME}/lib
	cd ${WRKBUILD}/lib && tar -cf - * | \
		tar -C ${JRUBY_HOME}/lib -xf -
	mkdir -p ${JRUBY_HOME}/lib/ruby/${JRUBY_RUBY_VERSION}/site_ruby
	find ${JRUBY_HOME}/lib \( -name '*.orig' -o -name '*.beforesubst' \) \
		-delete
	mv ${JRUBY_HOME}/lib/ruby/gems/{shared,1.8}
	ln -s 1.8 ${JRUBY_HOME}/lib/ruby/gems/shared
	chown -R ${SHAREOWN}:${SHAREGRP} ${JRUBY_HOME}/lib

# JRuby doesn't ship tests in the binary distribution
# Try running the database/ruby-sequel,jruby tests after an update
NO_TEST =	Yes

.include <bsd.port.mk>
