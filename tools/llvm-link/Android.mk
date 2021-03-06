LOCAL_PATH:= $(call my-dir)

llvm_link_SRC_FILES := \
  llvm-link.cpp

llvm_link_STATIC_LIBRARIES := \
  libLLVM70Linker \
  libLLVM70IRReader \
  libLLVM70Object \
  libLLVM70MC \
  libLLVM70MCParser \
  libLLVM70BitReader \
  libLLVM70BitWriter \
  libLLVM70AsmParser \
  libLLVM70TransformUtils \
  libLLVM70Analysis \
  libLLVM70Target \
  libLLVM70Core \
  libLLVM70Support

#===---------------------------------------------------------------===
# llvm-link command line tool (host)
#===---------------------------------------------------------------===

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-link
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_link_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_link_STATIC_LIBRARIES)
LOCAL_LDLIBS += -lpthread

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_EXECUTABLE)

#===---------------------------------------------------------------===
# llvm-link command line tool (target)
#===---------------------------------------------------------------===

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := llvm-link
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_link_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_link_STATIC_LIBRARIES)

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(BUILD_EXECUTABLE)
endif
