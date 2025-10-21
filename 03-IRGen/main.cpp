#include <llvm/IR/Module.h>
#include <llvm/Support/raw_ostream.h>

#include "sim.h"

extern llvm::Module* generate(llvm::LLVMContext &Context);
extern void interpret(llvm::Module* mod);

int main(int argc, char** argv) {
    llvm::LLVMContext Context;
    auto mod = generate(Context);

    if (argc > 1) {
        std::error_code error_code;
        llvm::raw_fd_ostream out(argv[1], error_code);
        if (error_code) {
            llvm::errs() << "Cannot open file " << argv[1]
                         << " for writing: " << error_code.message() << "\n";
        } else {
            mod->print(out, nullptr);
        }
    } else {
        mod->print(llvm::outs(), nullptr);
    }
    
    interpret(mod);
    
    return 0;
}