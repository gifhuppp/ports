COMMENT=	thin wrapper for Terraform that provides extra tools

MODGO_MODNAME=	github.com/gruntwork-io/terragrunt
MODGO_VERSION=	v0.84.0
DISTNAME=	terragrunt-${MODGO_VERSION}

# for patches
WRKDIST=	${WRKDIR}/github.com/gruntwork-io/terragrunt@${MODGO_VERSION}

CATEGORIES=	sysutils net

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# MIT
PERMIT_PACKAGE=	Yes

WANTLIB += c pthread

MODULES=	lang/go

MODGO_LDFLAGS=	-X main.VERSION=${MODGO_VERSION}

RUN_DEPENDS=	terraform-*|opentofu-*:sysutils/terraform

.include "modules.inc"

.include <bsd.port.mk>
