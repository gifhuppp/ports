ONLY_FOR_ARCHS=	i386 amd64 aarch64
USE_WXNEEDED=	Yes
USE_NOBTCFI=	Yes
DPB_PROPERTIES=	parallel

COMMENT=	OpenJDK Software Development Kit v${VERSION_STR}
BASE_VER=	21.0.8
PATCH_VER=	9
BSD_PORT_REL=	1
VERSION_STR=	${BASE_VER}+${PATCH_VER}-${BSD_PORT_REL}
PACKAGE_VER=	${BASE_VER}.${PATCH_VER}.${BSD_PORT_REL}
PKGNAME=	jdk-${PACKAGE_VER}
PKGSTEM=	jdk-21
EPOCH=		0

DIST_SUBDIR=	jdk
DISTNAME=	jdk-${VERSION_STR}
WRKDIST=	${WRKDIR}/jdk21u-jdk-${BASE_VER}-${PATCH_VER}-${BSD_PORT_REL}
BOOTJDK_DATE=	20240331

CATEGORIES=	devel/jdk java

PSEUDO_FLAVORS=	native_bootstrap
FLAVOR?=

HOMEPAGE=	http://openjdk.java.net/

SITES=		https://github.com/battleblow/jdk21u/archive/
SITES.boot=	http://www.intricatesoftware.com/distfiles/ \
		https://spacehopper.org/mirrors/

MAINTAINER=	Kurt Miller <kurt@openbsd.org>

# GPLv2 w/CLASSPATH exception
PERMIT_PACKAGE=	Yes

DEBUG_PACKAGES=	${BUILD_PACKAGES}

WANTLIB += ${COMPILER_LIBCXX} X11 Xext Xi Xrender Xtst c freetype gif
WANTLIB += harfbuzz iconv jpeg lcms2 m png pthread z

NO_TEST=	Yes

SUPDISTFILES.boot= \
		openjdk-jdk21u-bootjdk-i386-${BOOTJDK_DATE}.tar.gz  \
		openjdk-jdk21u-bootjdk-amd64-${BOOTJDK_DATE}.tar.gz \
		openjdk-jdk21u-bootjdk-aarch64-${BOOTJDK_DATE}.tar.gz

COMPILER=	base-clang ports-gcc

.include <bsd.port.arch.mk>

.if ${FLAVOR:Mnative_bootstrap}
INSTALLED!= (pkg_info -qe "jdk->=21v0,<22v0" && echo yes) || echo no
.  if ${INSTALLED:L} != "yes"
ERRORS += "Fatal: This flavor requires an installed jdk-21 package"
.  endif
BUILD_DEPENDS+=	jdk->=21v0,<22v0:devel/jdk/21
BOOT_JDK=	${LOCALBASE}/jdk-21
.else
BOOT_JDK_DIST=	openjdk-jdk21u-bootjdk-${MACHINE_ARCH}-${BOOTJDK_DATE}.tar.gz
.  if (${MACHINE_ARCH}==amd64) || (${MACHINE_ARCH}==i386) || (${MACHINE_ARCH}==aarch64)
DISTFILES.boot=	${BOOT_JDK_DIST}
.  endif
MAKE_ENV+=	LD_LIBRARY_PATH=${WRKDIR}/bootjdk-libs
CONFIGURE_ENV+=	LD_LIBRARY_PATH=${WRKDIR}/bootjdk-libs
BOOT_JDK=	${WRKDIR}/bootjdk
.endif

AUTOCONF_VERSION= 2.69
BUILD_DEPENDS+=	${MODGNU_AUTOCONF_DEPENDS} \
		archivers/gtar \
		archivers/zip \
		archivers/unzip \
		print/cups,-libs \
		shells/bash

LIB_DEPENDS=	converters/libiconv \
		devel/harfbuzz \
		graphics/jpeg \
		graphics/lcms2 \
		graphics/png \
		graphics/giflib

USE_GMAKE=	Yes
GMAKE=		${LOCALBASE}/bin/gmake

# Don't call make -jN, instead pass MAKE_JOBS to --with-jobs
PARALLEL_MAKE_FLAGS=

CONFIGURE_STYLE=gnu
CONFIGURE_ENV+= AUTOCONF_VERSION=${AUTOCONF_VERSION}
CONFIGURE_ARGS=	DOT="" FLOCK="" GIT="" PANDOC="" \
		AWK=awk DIFF=diff GZIP=gzip MAKE=${GMAKE} MKDIR=mkdir \
		OBJCOPY=objcopy OBJDUMP=objdump PATCH=patch \
		READELF=readelf READLINK=readlink \
		--with-boot-jdk=${BOOT_JDK} \
		--with-jobs=${MAKE_JOBS} \
		--with-debug-level=release \
		--with-version-string=${VERSION_STR} \
		--with-fontconfig=${X11BASE} \
		--with-cups=${LOCALBASE} \
		--with-freetype=system \
		--with-zlib=system \
		--with-libpng=system \
		--with-lcms=system \
		--with-libjpeg=system \
		--with-harfbuzz=system \
		--with-giflib=system \
		--with-giflib-include=${LOCALBASE}/include \
		--with-giflib-lib=${LOCALBASE}/lib \
		--disable-option-checking \
		--disable-ccache \
		--disable-dtrace \
		--disable-javac-server

.if ${PROPERTIES:Mclang}
CONFIGURE_ARGS+=--with-toolchain-type=clang
.else
CONFIGURE_ARGS+=--with-toolchain-type=gcc
.endif

.if ${PROPERTIES:Mdebuginfo}
CONFIGURE_ARGS+=--with-native-debug-symbols=external
.else
CONFIGURE_ARGS+=--with-native-debug-symbols=none
.endif

MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/make/autoconf/build-aux

MAKE_FLAGS+=	LOG=debug
ALL_TARGET=	images

.if ${MACHINE_ARCH} != "i386"
PKG_ARGS+=	-Dci=1
.else
PKG_ARGS+=	-Dci=0
.endif

JVMARCH=	${MACHINE_ARCH:S/i386/x86/:S/amd64/x86_64/}
BUILDDIR=	${WRKDIST}/build/bsd-${JVMARCH}-server-release
IMAGEDIR=	${BUILDDIR}/images/jdk
WRKTMP=		${WRKDIR}/tmp

post-extract:
	sed -i "s|#!/bin/bash|#!\${LOCALBASE}/bin/bash|" ${WRKDIST}/configure
	chmod +x ${WRKDIST}/configure

.if ${PROPERTIES:Mdebuginfo}
post-build:
	cd ${IMAGEDIR}/lib && \
		find . -name \*.debuginfo -exec \
		    sh -c 'mv {} `echo {} | sed s/.debuginfo/.so/`' \; && \
		mv jspawnhelper.so jspawnhelper && \
		cp libjsig.so server/
	cd ${IMAGEDIR}/bin && \
		find . -name \*.debuginfo -exec \
		    sh -c 'mv {} `echo {} | sed s/.debuginfo//`' \;
.endif

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/${PKGSTEM}
	cd ${IMAGEDIR} && tar -cf - * | tar -C ${PREFIX}/${PKGSTEM} -xf -

# The bootjdk is the jdk image with some parts deleted
# and a copy of the system shared libs needed to run it.
# The parts deleted are not needed for bootstrap and would
# require more system shared libs to be saved.
BOOTJDK_TAR=	openjdk-jdk21u-bootjdk-${MACHINE_ARCH}-$$(date +%Y%m%d).tar.gz
build-bootjdk: build
	@${_PBUILD} rm -rf ${WRKTMP}
	@${_PBUILD} mkdir -p ${WRKTMP}/bootjdk
	@${_PBUILD} mkdir -p ${WRKTMP}/bootjdk-libs
	@cd ${IMAGEDIR} && \
		tar -cf - * | \
		${_PBUILD} tar -C ${WRKTMP}/bootjdk -xf -
	@cd ${WRKTMP}/bootjdk && \
		${_PBUILD} rm -rf demo jmods man sample
	@cd ${WRKTMP}/bootjdk/lib && \
		${_PBUILD} rm libsplashscreen.so libinstrument.so \
		libawt_xawt.so liblcms.so libfontmanager.so libjdwp.so \
		libjavajpeg.so
	@find ${WRKTMP}/bootjdk/lib ${WRKTMP}/bootjdk/bin \
		-exec sh -c 'file {} | grep -q ELF && \
		${_PBUILD} strip -S {}' \;
	@LD_LIBRARY_PATH="${WRKTMP}/bootjdk/lib" \
		find ${WRKTMP}/bootjdk -type f -exec ldd {} + 2>/dev/null | \
		grep rlib | cut -d"/" -f 2-20 | sort -u | grep -v "\.so$$" | \
		xargs -I % ${_PBUILD} cp /% ${WRKTMP}/bootjdk-libs
	@cd ${WRKTMP} && \
		${_PBUILD} tar czf ${BOOTJDK_TAR} bootjdk*
	@echo "New bootjdk is located at ${WRKTMP}/${BOOTJDK_TAR}"

.include <bsd.port.mk>
