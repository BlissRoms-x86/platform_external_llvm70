LOCAL_PATH:= $(call my-dir)

debuginfo_symbolize_SRC_FILES := \
  DIPrinter.cpp \
  SymbolizableObjectFile.cpp \
  Symbolize.cpp \

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(debuginfo_symbolize_SRC_FILES)

LOCAL_MODULE:= libLLVM70Symbolize

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(debuginfo_symbolize_SRC_FILES)

LOCAL_MODULE:= libLLVM70Symbolize

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
