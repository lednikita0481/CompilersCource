#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
using namespace llvm;

struct TracePass : public PassInfoMixin<TracePass> {
  Type *voidType;
  Type *int8PtrTy;
  Type *boolTy;

  bool isLogger(StringRef name) {
    return name == "logInstr";
  }

  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
    LLVMContext &Ctx = M.getContext();
    IRBuilder<> builder(Ctx);
    voidType = Type::getVoidTy(Ctx);
    int8PtrTy = Type::getInt8Ty(Ctx)->getPointerTo();
    boolTy = Type::getInt1Ty(Ctx);

    Function *appFunc = M.getFunction("app");
    if (!appFunc || appFunc->isDeclaration()) {
      return PreservedAnalyses::all();
    }

    ArrayRef<Type *> logParamTypes = {int8PtrTy, boolTy};
    FunctionType *logFuncType = FunctionType::get(voidType, logParamTypes, false);
    FunctionCallee logFunc = M.getOrInsertFunction("logInstr", logFuncType);

    bool changed = false;
    for (auto &B : *appFunc) {
      for (auto it = B.begin(); it != B.end(); ) {
        Instruction &I = *it++;
        if (isa<PHINode>(&I)) continue;
        if (auto *call = dyn_cast<CallInst>(&I)) {
          Function *callee = call->getCalledFunction();
          if (callee && isLogger(callee->getName())) continue;
        }

        builder.SetInsertPoint(&I);
        Value *opcode = builder.CreateGlobalStringPtr(I.getOpcodeName());
        bool isFlush = false;
        if (auto *call = dyn_cast<CallInst>(&I)) {
          Function *callee = call->getCalledFunction();
          if (callee && callee->getName() == "simFlush") {
            isFlush = true;
          }
        }
        Value *flag = ConstantInt::get(boolTy, isFlush ? 1 : 0);
        Value *args[] = {opcode, flag};
        builder.CreateCall(logFunc, args);
        changed = true;
      }
    }

    bool verif = verifyFunction(*appFunc, &outs());
    outs() << "[VERIFICATION] " << (verif ? "FAIL\n" : "OK\n");
    return changed ? PreservedAnalyses::none() : PreservedAnalyses::all();
  }
};

PassPluginLibraryInfo getPassPluginInfo() {
  const auto callback = [](PassBuilder &PB) {
    PB.registerOptimizerLastEPCallback([](ModulePassManager &MPM, auto) {
      MPM.addPass(TracePass{});
      return true;
    });
  };
  return {LLVM_PLUGIN_API_VERSION, "TracePlugin", "0.0.1", callback};
};

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getPassPluginInfo();
}