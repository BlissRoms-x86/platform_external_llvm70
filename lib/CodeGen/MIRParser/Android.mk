LOCAL_PATH:= $(call my-dir)

MIRParser_SRC_FILES := \
  MILexer.cpp \
  MIParser.cpp \
  MIRParser.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(MIRParser_SRC_FILES)

LOCAL_MODULE:= libLLVM70MIRParser

LOCAL_MODULE_TAGS := optional

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(MIRParser_SRC_FILES)

LOCAL_MODULE:= libLLVM70MIRParser

LOCAL_MODULE_TAGS := optional

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
