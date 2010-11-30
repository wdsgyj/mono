#! -*- makefile -*-

INTERNAL_SMCS = $(RUNTIME) $(RUNTIME_FLAGS) --security=temporary-smcs-hack $(topdir)/class/lib/$(PROFILE)/smcs.exe

BOOTSTRAP_PROFILE = net_2_0
BOOTSTRAP_MCS = MONO_PATH="$(topdir)/class/lib/$(BOOTSTRAP_PROFILE)$(PLATFORM_PATH_SEPARATOR)$$MONO_PATH" $(RUNTIME) $(RUNTIME_FLAGS) $(topdir)/mcs/gmcs.exe
MCS = MONO_PATH="$(topdir)/class/lib/$(PROFILE)$(PLATFORM_PATH_SEPARATOR)$(topdir)/class/lib/$(BOOTSTRAP_PROFILE)$(PLATFORM_PATH_SEPARATOR)$$MONO_PATH" $(INTERNAL_SMCS)

# We can enable this if System.dll depends on features of the mscorlib.dll from this profile
#PROFILE_MCS_HAS_BOOTSTRAP_FALLBACK = yes

profile-check:
	@:

PROFILE_MCS_FLAGS = -d:NET_1_1 -d:NET_2_0 -d:NET_2_1 -d:MONOTOUCH
FRAMEWORK_VERSION = 2.1
NO_TEST = yes

# the tuner takes care of the install
NO_INSTALL = yes
