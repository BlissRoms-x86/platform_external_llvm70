LOCAL_PATH:= $(call my-dir)

mc_parser_SRC_FILES := \
  AsmLexer.cpp \
  AsmParser.cpp \
  COFFAsmParser.cpp \
  DarwinAsmParser.cpp \
  ELFAsmParser.cpp \
  MCAsmLexer.cpp \
  MCAsmParser.cpp \
  MCAsmParserExtension.cpp \
  MCTargetAsmParser.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(mc_parser_SRC_FILES)

LOCAL_MODULE:= libLLVM70MCParser

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM70_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(mc_parser_SRC_FILES)

LOCAL_MODULE:= libLLVM70MCParser

include $(LLVM70_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
