COMMENT=	software project management and comprehension tool

V=		3.9.11
REVISION=	0
DISTNAME=	apache-maven-$V
PKGNAME=	${DISTNAME:S/apache-//}
CATEGORIES=	devel

HOMEPAGE=	https://maven.apache.org/

MAINTAINER=	Kirill A. Korinsky <kirill@korins.ky>

# Apache Software License 2.0
PERMIT_PACKAGE=	Yes

SITES=		${SITE_APACHE:=maven/maven-3/${V}/binaries/} \
		https://archive.apache.org/dist/maven/binaries/

EXTRACT_SUFX=	-bin.tar.gz

MODULES=	java
MODJAVA_VER=	11+
RUN_DEPENDS=	java/javaPathHelper

NO_BUILD=	Yes
NO_TEST=	Yes

MAVEN_HOME=	${LOCALBASE}/maven
SAMPLEDIR=	${PREFIX}/share/examples/maven

SUBST_VARS+=	MAVEN_HOME

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/maven
	${INSTALL_DATA_DIR} ${SAMPLEDIR}
	cd ${WRKDIST} && \
		tar -cf - bin boot lib `find * -prune -type f` | \
		tar -C ${PREFIX}/maven -xf -
	find ${WRKINST} \( \
		-name \*.orig -o -name \*.bat -o -name \*.cmd -o -name \*.exe \
		\) -delete
	${INSTALL_DATA_DIR} ${SAMPLEDIR}/logging/
	${INSTALL_DATA} ${WRKSRC}/conf/logging/* ${SAMPLEDIR}/logging/
	${INSTALL_DATA} ${WRKSRC}/conf/settings.xml ${SAMPLEDIR}/
	ln -s ${SYSCONFDIR}/maven ${PREFIX}/maven/conf
	${SUBST_CMD} ${WRKSRC}/bin/mvn ${PREFIX}/maven/bin/mvn
	${SUBST_CMD} -m 0644 -c ${FILESDIR}/maven.rc ${SAMPLEDIR}/maven.rc
	${SUBST_CMD} -m 755 -c ${FILESDIR}/mvn ${PREFIX}/bin/mvn

.include <bsd.port.mk>
