LOCAL_PATH := $(call my-dir)

mips_target_info_TBLGEN_TABLES70 := \
  MipsGenInstrInfo.inc \
  MipsGenRegisterInfo.inc \
  MipsGenSubtargetInfo.inc

mips_target_info_SRC_FILES := \
  MipsTargetInfo.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS70)

LOCAL_MODULE:= libLLVM70MipsInfo
LOCAL_MODULE_HOST_OS := darwin linux windows

TBLGEN_TABLES70 := $(mips_target_info_TBLGEN_TABLES70)
TBLGEN_TD_DIR70 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(mips_target_info_SRC_FILES)
LOCAL_C_INCLUDES +=	$(LOCAL_PATH)/..

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS70)

LOCAL_MODULE:= libLLVM70MipsInfo

TBLGEN_TABLES70 := $(mips_target_info_TBLGEN_TABLES70)
TBLGEN_TD_DIR70 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(mips_target_info_SRC_FILES)
LOCAL_C_INCLUDES +=	$(LOCAL_PATH)/..

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
