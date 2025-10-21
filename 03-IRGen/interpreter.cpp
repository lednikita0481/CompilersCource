#include <llvm/ExecutionEngine/ExecutionEngine.h>
#include <llvm/ExecutionEngine/GenericValue.h>
#include <llvm/ExecutionEngine/MCJIT.h>
#include <llvm/Support/TargetSelect.h>
#include <llvm/Transforms/Utils/Cloning.h>

#include "sim.h"

using namespace llvm;

void interpret(Module *mod) {
    simInit();

    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();
    LLVMLinkInMCJIT();

    auto execMod = CloneModule(*mod);
    auto *app = execMod->getFunction("app");

    std::string ErrStr;
    EngineBuilder eb(std::move(execMod));
    eb.setEngineKind(EngineKind::JIT);
    eb.setErrorStr(&ErrStr);
    ExecutionEngine *ee = eb.create();

    if (!ee) {
        errs() << "Error creating EE: " << ErrStr << "\n";
        return;
    }

    ee->addGlobalMapping(mod->getNamedValue("simGetTicks"), (void*)simGetTicks);
    ee->addGlobalMapping(mod->getNamedValue("simRand"), (void*)simRand);
    ee->addGlobalMapping(mod->getNamedValue("checkFinish"), (void*)checkFinish);
    ee->addGlobalMapping(mod->getNamedValue("simFillRect"), (void*)simFillRect);
    ee->addGlobalMapping(mod->getNamedValue("simFlush"), (void*)simFlush);
    ee->addGlobalMapping(mod->getNamedValue("simDelay"), (void*)simDelay);

    ee->finalizeObject();

    std::vector<GenericValue> noargs;
    ee->runFunction(app, noargs);

    simExit();
}