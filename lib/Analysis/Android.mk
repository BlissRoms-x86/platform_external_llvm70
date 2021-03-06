LOCAL_PATH:= $(call my-dir)

analysis_SRC_FILES := \
  AliasAnalysis.cpp \
  AliasAnalysisEvaluator.cpp \
  AliasAnalysisSummary.cpp \
  AliasSetTracker.cpp \
  Analysis.cpp \
  AssumptionCache.cpp \
  BasicAliasAnalysis.cpp \
  BlockFrequencyInfo.cpp \
  BlockFrequencyInfoImpl.cpp \
  BranchProbabilityInfo.cpp \
  CFG.cpp \
  CFGPrinter.cpp \
  CFLAndersAliasAnalysis.cpp \
  CFLSteensAliasAnalysis.cpp \
  CGSCCPassManager.cpp \
  CallGraph.cpp \
  CallGraphSCCPass.cpp \
  CallPrinter.cpp \
  CaptureTracking.cpp \
  CmpInstAnalysis.cpp \
  CostModel.cpp \
  CodeMetrics.cpp \
  ConstantFolding.cpp \
  Delinearization.cpp \
  DemandedBits.cpp \
  DependenceAnalysis.cpp \
  DivergenceAnalysis.cpp \
  DomPrinter.cpp \
  DominanceFrontier.cpp \
  EHPersonalities.cpp \
  GlobalsModRef.cpp \
  IVUsers.cpp \
  IndirectCallPromotionAnalysis.cpp \
  InlineCost.cpp \
  InstCount.cpp \
  InstructionSimplify.cpp \
  Interval.cpp \
  IntervalPartition.cpp \
  IteratedDominanceFrontier.cpp \
  LazyBranchProbabilityInfo.cpp \
  LazyBlockFrequencyInfo.cpp \
  LazyCallGraph.cpp \
  LazyValueInfo.cpp \
  Lint.cpp \
  Loads.cpp \
  LoopAccessAnalysis.cpp \
  LoopAnalysisManager.cpp \
  LoopUnrollAnalyzer.cpp \
  LoopInfo.cpp \
  LoopPass.cpp \
  MemDepPrinter.cpp \
  MemDerefPrinter.cpp \
  MemoryBuiltins.cpp \
  MemoryDependenceAnalysis.cpp \
  MemoryLocation.cpp \
  MemorySSA.cpp \
  MemorySSAUpdater.cpp \
  ModuleDebugInfoPrinter.cpp \
  ModuleSummaryAnalysis.cpp \
  MustExecute.cpp \
  ObjCARCAliasAnalysis.cpp \
  ObjCARCAnalysisUtils.cpp \
  ObjCARCInstKind.cpp \
  OptimizationRemarkEmitter.cpp \
  OrderedBasicBlock.cpp \
  PHITransAddr.cpp \
  PhiValues.cpp \
  PostDominators.cpp \
  ProfileSummaryInfo.cpp \
  PtrUseVisitor.cpp \
  RegionInfo.cpp \
  RegionPass.cpp \
  RegionPrinter.cpp \
  ScalarEvolution.cpp \
  ScalarEvolutionAliasAnalysis.cpp \
  ScalarEvolutionExpander.cpp \
  ScalarEvolutionNormalization.cpp \
  SyntheticCountsUtils.cpp \
  TargetLibraryInfo.cpp \
  TargetTransformInfo.cpp \
  Trace.cpp \
  TypeBasedAliasAnalysis.cpp \
  TypeMetadataUtils.cpp \
  ScopedNoAliasAA.cpp \
  ValueLattice.cpp \
  ValueLatticeUtils.cpp \
  ValueTracking.cpp \
  VectorUtils.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70Analysis
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(analysis_SRC_FILES)

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM70Analysis
LOCAL_SRC_FILES := $(analysis_SRC_FILES)

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
