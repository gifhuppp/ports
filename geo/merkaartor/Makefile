COMMENT =	OpenStreetMap editor

GH_ACCOUNT =	openstreetmap
GH_PROJECT =	merkaartor
GH_TAGNAME =	0.20.0
REVISION =	0

CATEGORIES =	geo x11

HOMEPAGE =	http://www.merkaartor.be/
MAINTAINER =	Landry Breuil <landry@openbsd.org>

# GPLv2
PERMIT_PACKAGE =	Yes

NO_TEST =	Yes
MODULES =	devel/cmake x11/qt6
RUN_DEPENDS =	devel/desktop-file-utils \
		x11/gtk+4,-guic

# spatialite is marked as non-working
LIB_DEPENDS =	devel/proj \
		devel/protobuf \
		x11/qt6/qt5compat \
		x11/qt6/qtnetworkauth \
		x11/qt6/qtsvg \
		graphics/exiv2 \
		geo/gdal

WANTLIB += ${COMPILER_LIBCXX} GL Qt6Concurrent Qt6Core Qt6Core5Compat
WANTLIB += Qt6Gui Qt6Network Qt6NetworkAuth Qt6PrintSupport Qt6Svg
WANTLIB += Qt6Test Qt6Widgets Qt6Xml absl_base absl_city absl_civil_time
WANTLIB += absl_cord absl_cord_internal absl_cordz_functions absl_cordz_handle
WANTLIB += absl_cordz_info absl_crc32c absl_crc_cord_state absl_crc_cpu_detect
WANTLIB += absl_crc_internal absl_debugging_internal absl_decode_rust_punycode
WANTLIB += absl_demangle_internal absl_demangle_rust absl_die_if_null
WANTLIB += absl_examine_stack absl_exponential_biased absl_flags_commandlineflag
WANTLIB += absl_flags_commandlineflag_internal absl_flags_config
WANTLIB += absl_flags_internal absl_flags_marshalling absl_flags_private_handle_accessor
WANTLIB += absl_flags_program_name absl_flags_reflection absl_graphcycles_internal
WANTLIB += absl_hash absl_hashtablez_sampler absl_int128 absl_kernel_timeout_internal
WANTLIB += absl_leak_check absl_log_globals absl_log_initialize
WANTLIB += absl_log_internal_check_op absl_log_internal_conditions
WANTLIB += absl_log_internal_fnmatch absl_log_internal_format
WANTLIB += absl_log_internal_globals absl_log_internal_log_sink_set
WANTLIB += absl_log_internal_message absl_log_internal_nullguard
WANTLIB += absl_log_internal_proto absl_log_internal_structured_proto
WANTLIB += absl_log_severity absl_log_sink absl_low_level_hash
WANTLIB += absl_malloc_internal absl_random_distributions absl_random_internal_entropy_pool
WANTLIB += absl_random_internal_platform absl_random_internal_randen
WANTLIB += absl_random_internal_randen_hwaes absl_random_internal_randen_hwaes_impl
WANTLIB += absl_random_internal_randen_slow absl_random_internal_seed_material
WANTLIB += absl_random_seed_gen_exception absl_random_seed_sequences
WANTLIB += absl_raw_hash_set absl_raw_logging_internal absl_spinlock_wait
WANTLIB += absl_stacktrace absl_status absl_statusor absl_str_format_internal
WANTLIB += absl_strerror absl_string_view absl_strings absl_strings_internal
WANTLIB += absl_symbolize absl_synchronization absl_throw_delegate
WANTLIB += absl_time absl_time_zone absl_tracing_internal absl_utf8_for_code_point
WANTLIB += absl_vlog_config_internal c exiv2 gdal m proj protobuf
WANTLIB += utf8_range utf8_validity z

# C++11
COMPILER =		base-clang ports-gcc

.include <bsd.port.mk>
