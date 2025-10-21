#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>

#include "sim.h"

using namespace llvm;

Module* generate(LLVMContext &Context) {
    Module *mod = new Module("game_of_life.c", Context);
    IRBuilder<> Builder(Context);

    FunctionType *FT_simGetTicks = FunctionType::get(Builder.getInt32Ty(), true);
    Function *simGetTicks = Function::Create(FT_simGetTicks, Function::ExternalLinkage, "simGetTicks", mod);

    FunctionType *FT_simRand = FunctionType::get(Builder.getInt32Ty(), true);
    Function *simRand = Function::Create(FT_simRand, Function::ExternalLinkage, "simRand", mod);

    FunctionType *FT_checkFinish = FunctionType::get(Builder.getInt32Ty(), true);
    Function *checkFinish = Function::Create(FT_checkFinish, Function::ExternalLinkage, "checkFinish", mod);

    ArrayRef<Type *> simFillRectArgs = {Builder.getInt32Ty(), Builder.getInt32Ty(), Builder.getInt32Ty(), Builder.getInt32Ty(), Builder.getInt32Ty()};
    FunctionType *FT_simFillRect = FunctionType::get(Builder.getVoidTy(), simFillRectArgs, false);
    Function *simFillRect = Function::Create(FT_simFillRect, Function::ExternalLinkage, "simFillRect", mod);

    FunctionType *FT_simFlush = FunctionType::get(Builder.getVoidTy(), true);
    Function *simFlush = Function::Create(FT_simFlush, Function::ExternalLinkage, "simFlush", mod);

    FunctionType *FT_simDelay = FunctionType::get(Builder.getVoidTy(), {Builder.getInt32Ty()}, false);
    Function *simDelay = Function::Create(FT_simDelay, Function::ExternalLinkage, "simDelay", mod);

    FunctionType *appType = FunctionType::get(Builder.getVoidTy(), false);
    Function *app = Function::Create(appType, Function::ExternalLinkage, "app", mod);

    BasicBlock *BB0 = BasicBlock::Create(Context, "0", app);
    BasicBlock *BB6 = BasicBlock::Create(Context, "6", app);
    BasicBlock *BB8 = BasicBlock::Create(Context, "8", app);
    BasicBlock *BB11 = BasicBlock::Create(Context, "11", app);
    BasicBlock *BB16 = BasicBlock::Create(Context, "16", app);
    BasicBlock *BB22 = BasicBlock::Create(Context, "22", app);
    BasicBlock *BB25 = BasicBlock::Create(Context, "25", app);
    BasicBlock *BB28 = BasicBlock::Create(Context, "28", app);
    BasicBlock *BB30 = BasicBlock::Create(Context, "30", app);
    BasicBlock *BB34 = BasicBlock::Create(Context, "34", app);
    BasicBlock *BB46 = BasicBlock::Create(Context, "46", app);
    BasicBlock *BB49 = BasicBlock::Create(Context, "49", app);
    BasicBlock *BB53 = BasicBlock::Create(Context, "53", app);
    BasicBlock *BB55 = BasicBlock::Create(Context, "55", app);
    BasicBlock *BB57 = BasicBlock::Create(Context, "57", app);
    BasicBlock *BB64 = BasicBlock::Create(Context, "64", app);
    BasicBlock *BB70 = BasicBlock::Create(Context, "70", app);
    BasicBlock *BB71 = BasicBlock::Create(Context, "71", app);
    BasicBlock *BB72 = BasicBlock::Create(Context, "72", app);
    BasicBlock *BB79 = BasicBlock::Create(Context, "79", app);
    BasicBlock *BB82 = BasicBlock::Create(Context, "82", app);
    BasicBlock *BB85 = BasicBlock::Create(Context, "85", app);
    BasicBlock *BB93 = BasicBlock::Create(Context, "93", app);
    BasicBlock *BB96 = BasicBlock::Create(Context, "96", app);
    BasicBlock *BB99 = BasicBlock::Create(Context, "99", app);
    BasicBlock *BB107 = BasicBlock::Create(Context, "107", app);
    BasicBlock *BB110 = BasicBlock::Create(Context, "110", app);
    BasicBlock *BB113 = BasicBlock::Create(Context, "113", app);
    BasicBlock *BB121 = BasicBlock::Create(Context, "121", app);
    BasicBlock *BB124 = BasicBlock::Create(Context, "124", app);
    BasicBlock *BB127 = BasicBlock::Create(Context, "127", app);
    BasicBlock *BB135 = BasicBlock::Create(Context, "135", app);
    BasicBlock *BB138 = BasicBlock::Create(Context, "138", app);
    BasicBlock *BB141 = BasicBlock::Create(Context, "141", app);
    BasicBlock *BB148 = BasicBlock::Create(Context, "148", app);
    BasicBlock *BB151 = BasicBlock::Create(Context, "151", app);
    BasicBlock *BB154 = BasicBlock::Create(Context, "154", app);
    BasicBlock *BB162 = BasicBlock::Create(Context, "162", app);
    BasicBlock *BB165 = BasicBlock::Create(Context, "165", app);
    BasicBlock *BB168 = BasicBlock::Create(Context, "168", app);
    BasicBlock *BB175 = BasicBlock::Create(Context, "175", app);
    BasicBlock *BB179 = BasicBlock::Create(Context, "179", app);
    BasicBlock *BB180 = BasicBlock::Create(Context, "180", app);
    BasicBlock *BB181 = BasicBlock::Create(Context, "181", app);
    BasicBlock *BB183 = BasicBlock::Create(Context, "183", app);
    BasicBlock *BB186 = BasicBlock::Create(Context, "186", app);
    BasicBlock *BB187 = BasicBlock::Create(Context, "187", app);
    BasicBlock *BB188 = BasicBlock::Create(Context, "188", app);
    BasicBlock *BB190 = BasicBlock::Create(Context, "190", app);
    BasicBlock *BB193 = BasicBlock::Create(Context, "193", app);
    BasicBlock *BB196 = BasicBlock::Create(Context, "196", app);
    BasicBlock *BB199 = BasicBlock::Create(Context, "199", app);

    ArrayType *MemArrTy = ArrayType::get(ArrayType::get(Builder.getInt32Ty(), 64), 64);

    Builder.SetInsertPoint(BB0);
    auto *Val1 = Builder.CreateAlloca(MemArrTy);
    auto *Val2 = Builder.CreateBitCast(Val1, Builder.getInt8Ty()->getPointerTo());
    auto *Val3 = Builder.CreateAlloca(MemArrTy);
    auto *Val4 = Builder.CreateBitCast(Val3, Builder.getInt8Ty()->getPointerTo());
    Builder.CreateLifetimeStart(Val2, ConstantInt::get(Builder.getInt64Ty(), 16384));
    Builder.CreateLifetimeStart(Val4, ConstantInt::get(Builder.getInt64Ty(), 16384));
    auto *Val5 = Builder.CreateCall(simGetTicks);
    Builder.CreateMemSet(Val2, Builder.getInt8(0), ConstantInt::get(Builder.getInt64Ty(), 16384), MaybeAlign(16));
    Builder.CreateBr(BB6);

    Builder.SetInsertPoint(BB6);
    auto *Val7 = Builder.CreatePHI(Builder.getInt64Ty(), 2);
    
    Builder.CreateBr(BB11);

    Builder.SetInsertPoint(BB8);
    auto *Val9 = Builder.CreateCall(checkFinish);
    auto *Val10 = Builder.CreateICmpEQ(Val9, Builder.getInt32(0));
    Builder.CreateCondBr(Val10, BB28, BB199);

    Builder.SetInsertPoint(BB11);
    auto *Val12 = Builder.CreatePHI(Builder.getInt64Ty(), 2);
    
    auto *Val13 = Builder.CreateCall(simRand);
    auto *Val14 = Builder.CreateSRem(Val13, Builder.getInt32(100));
    auto *Val15 = Builder.CreateICmpSLT(Val14, Builder.getInt32(30));
    Builder.CreateCondBr(Val15, BB16, BB22);

    Builder.SetInsertPoint(BB16);
    auto *Val17 = Builder.CreateCall(simRand);
    auto *Val18 = Builder.CreateAnd(Val17, Builder.getInt32(1));
    auto *Val19 = Builder.CreateICmpEQ(Val18, Builder.getInt32(0));
    auto *Val20 = Builder.CreateInBoundsGEP(MemArrTy, Val1, {Builder.getInt64(0), Val7, Val12});
    auto *Val21 = Builder.CreateSelect(Val19, Builder.getInt32(1), Builder.getInt32(2));
    Builder.CreateStore(Val21, Val20);
    Builder.CreateBr(BB22);

    Builder.SetInsertPoint(BB22);
    auto *Val23 = Builder.CreateAdd(Val12, Builder.getInt64(1));
    auto *Val24 = Builder.CreateICmpEQ(Val23, Builder.getInt64(64));
    Builder.CreateCondBr(Val24, BB25, BB11);

    Builder.SetInsertPoint(BB25);
    auto *Val26 = Builder.CreateAdd(Val7, Builder.getInt64(1));
    auto *Val27 = Builder.CreateICmpEQ(Val26, Builder.getInt64(64));
    Builder.CreateCondBr(Val27, BB8, BB6);

    Builder.SetInsertPoint(BB28);
    auto *Val29 = Builder.CreatePHI(Builder.getInt32Ty(), 2);
    
    Builder.CreateBr(BB30);

    Builder.SetInsertPoint(BB30);
    auto *Val31 = Builder.CreatePHI(Builder.getInt64Ty(), 2);
    
    auto *Val32 = Builder.CreateTrunc(Val31, Builder.getInt32Ty());
    auto *Val33 = Builder.CreateShl(Val32, Builder.getInt32(2));
    Builder.CreateBr(BB34);

    Builder.SetInsertPoint(BB34);
    auto *Val35 = Builder.CreatePHI(Builder.getInt64Ty(), 2);
    
    auto *Val36 = Builder.CreateInBoundsGEP(MemArrTy, Val1, {Builder.getInt64(0), Val31, Val35});
    auto *Val37 = Builder.CreateLoad(Builder.getInt32Ty(), Val36);
    auto *Val38 = Builder.CreateICmpEQ(Val37, Builder.getInt32(2));
    auto *Val39 = Builder.CreateSelect(Val38, Builder.getInt32(65280), Builder.getInt32(0));
    auto *Val40 = Builder.CreateICmpEQ(Val37, Builder.getInt32(1));
    auto *Val41 = Builder.CreateSelect(Val40, Builder.getInt32(13047173), Val39);
    auto *Val42 = Builder.CreateTrunc(Val35, Builder.getInt32Ty());
    auto *Val43 = Builder.CreateShl(Val42, Builder.getInt32(2));
    Builder.CreateCall(simFillRect, {Val43, Val33, Builder.getInt32(4), Builder.getInt32(4), Val41});
    auto *Val44 = Builder.CreateAdd(Val35, Builder.getInt64(1));
    auto *Val45 = Builder.CreateICmpEQ(Val44, Builder.getInt64(64));
    Builder.CreateCondBr(Val45, BB46, BB34);

    Builder.SetInsertPoint(BB46);
    auto *Val47 = Builder.CreateAdd(Val31, Builder.getInt64(1));
    auto *Val48 = Builder.CreateICmpEQ(Val47, Builder.getInt64(64));
    Builder.CreateCondBr(Val48, BB49, BB30);

    Builder.SetInsertPoint(BB49);
    auto *Val50 = Builder.CreateCall(simGetTicks);
    auto *Val51 = Builder.CreateSub(Val50, Val29);
    auto *Val52 = Builder.CreateICmpSLT(Val51, Builder.getInt32(10));
    Builder.CreateCondBr(Val52, BB53, BB55);

    Builder.SetInsertPoint(BB53);
    auto *Val54 = Builder.CreateSub(Builder.getInt32(10), Val51);
    Builder.CreateCall(simDelay, Val54);
    Builder.CreateBr(BB55);

    Builder.SetInsertPoint(BB55);
    Builder.CreateCall(simFlush);
    auto *Val56 = Builder.CreateCall(simGetTicks);
    Builder.CreateBr(BB57);

    Builder.SetInsertPoint(BB57);
    auto *Val58 = Builder.CreatePHI(Builder.getInt64Ty(), 2);
    
    auto *Val59 = Builder.CreateAdd(Val58, Builder.getInt64(63));
    auto *Val60 = Builder.CreateAnd(Val59, Builder.getInt64(63));
    auto *Val61 = Builder.CreateAnd(Val58, Builder.getInt64(63));
    auto *Val62 = Builder.CreateAdd(Val58, Builder.getInt64(1));
    auto *Val63 = Builder.CreateAnd(Val62, Builder.getInt64(63));
    Builder.CreateBr(BB64);

    Builder.SetInsertPoint(BB64);
    auto *Val65 = Builder.CreatePHI(Builder.getInt64Ty(), 2);
    
    auto *Val66 = Builder.CreateAdd(Val65, Builder.getInt64(63));
    auto *Val67 = Builder.CreateAnd(Val66, Builder.getInt64(63));
    auto *Val68 = Builder.CreateInBoundsGEP(MemArrTy, Val1, {Builder.getInt64(0), Val60, Val67});
    auto *Val69 = Builder.CreateLoad(Builder.getInt32Ty(), Val68);
    auto *switchInst1 = Builder.CreateSwitch(Val69, BB72, 2);
    switchInst1->addCase(Builder.getInt32(1), BB70);
    switchInst1->addCase(Builder.getInt32(2), BB71);

    Builder.SetInsertPoint(BB70);
    Builder.CreateBr(BB72);

    Builder.SetInsertPoint(BB71);
    Builder.CreateBr(BB72);

    Builder.SetInsertPoint(BB72);
    auto *Val73 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val74 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val75 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val76 = Builder.CreateAnd(Val65, Builder.getInt64(63));
    auto *Val77 = Builder.CreateInBoundsGEP(MemArrTy, Val1, {Builder.getInt64(0), Val60, Val76});
    auto *Val78 = Builder.CreateLoad(Builder.getInt32Ty(), Val77);
    auto *switchInst2 = Builder.CreateSwitch(Val78, BB85, 2);
    switchInst2->addCase(Builder.getInt32(1), BB82);
    switchInst2->addCase(Builder.getInt32(2), BB79);

    Builder.SetInsertPoint(BB79);
    auto *Val80 = Builder.CreateAdd(Val73, Builder.getInt32(1));
    auto *Val81 = Builder.CreateAdd(Val75, Builder.getInt32(1));
    Builder.CreateBr(BB85);

    Builder.SetInsertPoint(BB82);
    auto *Val83 = Builder.CreateAdd(Val73, Builder.getInt32(1));
    auto *Val84 = Builder.CreateAdd(Val74, Builder.getInt32(1));
    Builder.CreateBr(BB85);

    Builder.SetInsertPoint(BB85);
    auto *Val86 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val87 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val88 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val89 = Builder.CreateAdd(Val65, Builder.getInt64(1));
    auto *Val90 = Builder.CreateAnd(Val89, Builder.getInt64(63));
    auto *Val91 = Builder.CreateInBoundsGEP(MemArrTy, Val1, {Builder.getInt64(0), Val60, Val90});
    auto *Val92 = Builder.CreateLoad(Builder.getInt32Ty(), Val91);
    auto *switchInst3 = Builder.CreateSwitch(Val92, BB99, 2);
    switchInst3->addCase(Builder.getInt32(1), BB96);
    switchInst3->addCase(Builder.getInt32(2), BB93);

    Builder.SetInsertPoint(BB93);
    auto *Val94 = Builder.CreateAdd(Val86, Builder.getInt32(1));
    auto *Val95 = Builder.CreateAdd(Val88, Builder.getInt32(1));
    Builder.CreateBr(BB99);

    Builder.SetInsertPoint(BB96);
    auto *Val97 = Builder.CreateAdd(Val86, Builder.getInt32(1));
    auto *Val98 = Builder.CreateAdd(Val87, Builder.getInt32(1));
    Builder.CreateBr(BB99);

    Builder.SetInsertPoint(BB99);
    auto *Val100 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val101 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val102 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val103 = Builder.CreateAdd(Val65, Builder.getInt64(63));
    auto *Val104 = Builder.CreateAnd(Val103, Builder.getInt64(63));
    auto *Val105 = Builder.CreateInBoundsGEP(MemArrTy, Val1, {Builder.getInt64(0), Val61, Val104});
    auto *Val106 = Builder.CreateLoad(Builder.getInt32Ty(), Val105);
    auto *switchInst4 = Builder.CreateSwitch(Val106, BB113, 2);
    switchInst4->addCase(Builder.getInt32(1), BB110);
    switchInst4->addCase(Builder.getInt32(2), BB107);

    Builder.SetInsertPoint(BB107);
    auto *Val108 = Builder.CreateAdd(Val100, Builder.getInt32(1));
    auto *Val109 = Builder.CreateAdd(Val102, Builder.getInt32(1));
    Builder.CreateBr(BB113);

    Builder.SetInsertPoint(BB110);
    auto *Val111 = Builder.CreateAdd(Val100, Builder.getInt32(1));
    auto *Val112 = Builder.CreateAdd(Val101, Builder.getInt32(1));
    Builder.CreateBr(BB113);

    Builder.SetInsertPoint(BB113);
    auto *Val114 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val115 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val116 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val117 = Builder.CreateAdd(Val65, Builder.getInt64(1));
    auto *Val118 = Builder.CreateAnd(Val117, Builder.getInt64(63));
    auto *Val119 = Builder.CreateInBoundsGEP(MemArrTy, Val1, {Builder.getInt64(0), Val61, Val118});
    auto *Val120 = Builder.CreateLoad(Builder.getInt32Ty(), Val119);
    auto *switchInst5 = Builder.CreateSwitch(Val120, BB127, 2);
    switchInst5->addCase(Builder.getInt32(1), BB124);
    switchInst5->addCase(Builder.getInt32(2), BB121);

    Builder.SetInsertPoint(BB121);
    auto *Val122 = Builder.CreateAdd(Val114, Builder.getInt32(1));
    auto *Val123 = Builder.CreateAdd(Val116, Builder.getInt32(1));
    Builder.CreateBr(BB127);

    Builder.SetInsertPoint(BB124);
    auto *Val125 = Builder.CreateAdd(Val114, Builder.getInt32(1));
    auto *Val126 = Builder.CreateAdd(Val115, Builder.getInt32(1));
    Builder.CreateBr(BB127);

    Builder.SetInsertPoint(BB127);
    auto *Val128 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val129 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val130 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val131 = Builder.CreateAdd(Val65, Builder.getInt64(63));
    auto *Val132 = Builder.CreateAnd(Val131, Builder.getInt64(63));
    auto *Val133 = Builder.CreateInBoundsGEP(MemArrTy, Val1, {Builder.getInt64(0), Val63, Val132});
    auto *Val134 = Builder.CreateLoad(Builder.getInt32Ty(), Val133);
    auto *switchInst6 = Builder.CreateSwitch(Val134, BB141, 2);
    switchInst6->addCase(Builder.getInt32(1), BB138);
    switchInst6->addCase(Builder.getInt32(2), BB135);

    Builder.SetInsertPoint(BB135);
    auto *Val136 = Builder.CreateAdd(Val128, Builder.getInt32(1));
    auto *Val137 = Builder.CreateAdd(Val130, Builder.getInt32(1));
    Builder.CreateBr(BB141);

    Builder.SetInsertPoint(BB138);
    auto *Val139 = Builder.CreateAdd(Val128, Builder.getInt32(1));
    auto *Val140 = Builder.CreateAdd(Val129, Builder.getInt32(1));
    Builder.CreateBr(BB141);

    Builder.SetInsertPoint(BB141);
    auto *Val142 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val143 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val144 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val145 = Builder.CreateAnd(Val65, Builder.getInt64(63));
    auto *Val146 = Builder.CreateInBoundsGEP(MemArrTy, Val1, {Builder.getInt64(0), Val63, Val145});
    auto *Val147 = Builder.CreateLoad(Builder.getInt32Ty(), Val146);
    auto *switchInst7 = Builder.CreateSwitch(Val147, BB154, 2);
    switchInst7->addCase(Builder.getInt32(1), BB151);
    switchInst7->addCase(Builder.getInt32(2), BB148);

    Builder.SetInsertPoint(BB148);
    auto *Val149 = Builder.CreateAdd(Val142, Builder.getInt32(1));
    auto *Val150 = Builder.CreateAdd(Val144, Builder.getInt32(1));
    Builder.CreateBr(BB154);

    Builder.SetInsertPoint(BB151);
    auto *Val152 = Builder.CreateAdd(Val142, Builder.getInt32(1));
    auto *Val153 = Builder.CreateAdd(Val143, Builder.getInt32(1));
    Builder.CreateBr(BB154);

    Builder.SetInsertPoint(BB154);
    auto *Val155 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val156 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val157 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val158 = Builder.CreateAdd(Val65, Builder.getInt64(1));
    auto *Val159 = Builder.CreateAnd(Val158, Builder.getInt64(63));
    auto *Val160 = Builder.CreateInBoundsGEP(MemArrTy, Val1, {Builder.getInt64(0), Val63, Val159});
    auto *Val161 = Builder.CreateLoad(Builder.getInt32Ty(), Val160);
    auto *switchInst8 = Builder.CreateSwitch(Val161, BB168, 2);
    switchInst8->addCase(Builder.getInt32(1), BB165);
    switchInst8->addCase(Builder.getInt32(2), BB162);

    Builder.SetInsertPoint(BB162);
    auto *Val163 = Builder.CreateAdd(Val155, Builder.getInt32(1));
    auto *Val164 = Builder.CreateAdd(Val157, Builder.getInt32(1));
    Builder.CreateBr(BB168);

    Builder.SetInsertPoint(BB165);
    auto *Val166 = Builder.CreateAdd(Val155, Builder.getInt32(1));
    auto *Val167 = Builder.CreateAdd(Val156, Builder.getInt32(1));
    Builder.CreateBr(BB168);

    Builder.SetInsertPoint(BB168);
    auto *Val169 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val170 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val171 = Builder.CreatePHI(Builder.getInt32Ty(), 3);

    auto *Val172 = Builder.CreateInBoundsGEP(MemArrTy, Val1, {Builder.getInt64(0), Val58, Val65});
    auto *Val173 = Builder.CreateLoad(Builder.getInt32Ty(), Val172);
    auto *Val174 = Builder.CreateICmpSGT(Val173, Builder.getInt32(0));
    Builder.CreateCondBr(Val174, BB175, BB181);

    Builder.SetInsertPoint(BB175);
    auto *Val176 = Builder.CreateAnd(Val169, Builder.getInt32(-2));
    auto *Val177 = Builder.CreateICmpEQ(Val176, Builder.getInt32(2));
    auto *Val178 = Builder.CreateInBoundsGEP(MemArrTy, Val3, {Builder.getInt64(0), Val58, Val65});
    Builder.CreateCondBr(Val177, BB179, BB180);

    Builder.SetInsertPoint(BB179);
    Builder.CreateStore(Val173, Val178);
    Builder.CreateBr(BB190);

    Builder.SetInsertPoint(BB180);
    Builder.CreateStore(Builder.getInt32(0), Val178);
    Builder.CreateBr(BB190);

    Builder.SetInsertPoint(BB181);
    auto *Val182 = Builder.CreateICmpEQ(Val169, Builder.getInt32(3));
    Builder.CreateCondBr(Val182, BB183, BB188);

    Builder.SetInsertPoint(BB183);
    auto *Val184 = Builder.CreateICmpUGT(Val170, Val171);
    auto *Val185 = Builder.CreateInBoundsGEP(MemArrTy, Val3, {Builder.getInt64(0), Val58, Val65});
    Builder.CreateCondBr(Val184, BB186, BB187);

    Builder.SetInsertPoint(BB186);
    Builder.CreateStore(Builder.getInt32(1), Val185);
    Builder.CreateBr(BB190);

    Builder.SetInsertPoint(BB187);
    Builder.CreateStore(Builder.getInt32(2), Val185);
    Builder.CreateBr(BB190);

    Builder.SetInsertPoint(BB188);
    auto *Val189 = Builder.CreateInBoundsGEP(MemArrTy, Val3, {Builder.getInt64(0), Val58, Val65});
    Builder.CreateStore(Builder.getInt32(0), Val189);
    Builder.CreateBr(BB190);

    Builder.SetInsertPoint(BB190);
    auto *Val191 = Builder.CreateAdd(Val65, Builder.getInt64(1));
    auto *Val192 = Builder.CreateICmpEQ(Val191, Builder.getInt64(64));
    Builder.CreateCondBr(Val192, BB193, BB64);

    Builder.SetInsertPoint(BB193);
    auto *Val194 = Builder.CreateAdd(Val58, Builder.getInt64(1));
    auto *Val195 = Builder.CreateICmpEQ(Val194, Builder.getInt64(64));
    Builder.CreateCondBr(Val195, BB196, BB57);

    Builder.SetInsertPoint(BB196);
    Builder.CreateMemCpy(Val2, MaybeAlign(16), Val4, MaybeAlign(16), ConstantInt::get(Builder.getInt64Ty(), 16384));
    auto *Val197 = Builder.CreateCall(checkFinish);
    auto *Val198 = Builder.CreateICmpEQ(Val197, Builder.getInt32(0));
    Builder.CreateCondBr(Val198, BB28, BB199);

    Builder.SetInsertPoint(BB199);
    Builder.CreateLifetimeEnd(Val4, ConstantInt::get(Builder.getInt64Ty(), 16384));
    Builder.CreateLifetimeEnd(Val2, ConstantInt::get(Builder.getInt64Ty(), 16384));
    Builder.CreateRetVoid();

    Val7->addIncoming(ConstantInt::get(Builder.getInt64Ty(), 0), BB0);
    Val7->addIncoming(Val26, BB25);

    Val12->addIncoming(ConstantInt::get(Builder.getInt64Ty(), 0), BB6);
    Val12->addIncoming(Val23, BB22);

    Val29->addIncoming(Val5, BB8);
    Val29->addIncoming(Val56, BB196);

    Val31->addIncoming(Builder.getInt64(0), BB28);
    Val31->addIncoming(Val47, BB46);

    Val35->addIncoming(Builder.getInt64(0), BB30);
    Val35->addIncoming(Val44, BB34);

    Val58->addIncoming(Builder.getInt64(0), BB55);
    Val58->addIncoming(Val194, BB193);

    Val65->addIncoming(Builder.getInt64(0), BB57);
    Val65->addIncoming(Val191, BB190);

    Val73->addIncoming(Builder.getInt32(1), BB70);
    Val73->addIncoming(Builder.getInt32(1), BB71);
    Val73->addIncoming(Builder.getInt32(0), BB64);

    Val74->addIncoming(Builder.getInt32(1), BB70);
    Val74->addIncoming(Builder.getInt32(0), BB71);
    Val74->addIncoming(Builder.getInt32(0), BB64);

    Val75->addIncoming(Builder.getInt32(0), BB70);
    Val75->addIncoming(Builder.getInt32(1), BB71);
    Val75->addIncoming(Builder.getInt32(0), BB64);

    Val86->addIncoming(Val83, BB82);
    Val86->addIncoming(Val80, BB79);
    Val86->addIncoming(Val73, BB72);

    Val87->addIncoming(Val84, BB82);
    Val87->addIncoming(Val74, BB79);
    Val87->addIncoming(Val74, BB72);

    Val88->addIncoming(Val75, BB82);
    Val88->addIncoming(Val81, BB79);
    Val88->addIncoming(Val75, BB72);

    Val100->addIncoming(Val97, BB96);
    Val100->addIncoming(Val94, BB93);
    Val100->addIncoming(Val86, BB85);

    Val101->addIncoming(Val98, BB96);
    Val101->addIncoming(Val87, BB93);
    Val101->addIncoming(Val87, BB85);

    Val102->addIncoming(Val88, BB96);
    Val102->addIncoming(Val95, BB93);
    Val102->addIncoming(Val88, BB85);

    Val114->addIncoming(Val111, BB110);
    Val114->addIncoming(Val108, BB107);
    Val114->addIncoming(Val100, BB99);

    Val115->addIncoming(Val112, BB110);
    Val115->addIncoming(Val101, BB107);
    Val115->addIncoming(Val101, BB99);

    Val116->addIncoming(Val102, BB110);
    Val116->addIncoming(Val109, BB107);
    Val116->addIncoming(Val102, BB99);

    Val128->addIncoming(Val125, BB124);
    Val128->addIncoming(Val122, BB121);
    Val128->addIncoming(Val114, BB113);

    Val129->addIncoming(Val126, BB124);
    Val129->addIncoming(Val115, BB121);
    Val129->addIncoming(Val115, BB113);

    Val130->addIncoming(Val116, BB124);
    Val130->addIncoming(Val123, BB121);
    Val130->addIncoming(Val116, BB113);

    Val142->addIncoming(Val139, BB138);
    Val142->addIncoming(Val136, BB135);
    Val142->addIncoming(Val128, BB127);

    Val143->addIncoming(Val140, BB138);
    Val143->addIncoming(Val129, BB135);
    Val143->addIncoming(Val129, BB127);

    Val144->addIncoming(Val130, BB138);
    Val144->addIncoming(Val137, BB135);
    Val144->addIncoming(Val130, BB127);

    Val155->addIncoming(Val152, BB151);
    Val155->addIncoming(Val149, BB148);
    Val155->addIncoming(Val142, BB141);

    Val156->addIncoming(Val153, BB151);
    Val156->addIncoming(Val143, BB148);
    Val156->addIncoming(Val143, BB141);

    Val157->addIncoming(Val144, BB151);
    Val157->addIncoming(Val150, BB148);
    Val157->addIncoming(Val144, BB141);

    Val169->addIncoming(Val166, BB165);
    Val169->addIncoming(Val163, BB162);
    Val169->addIncoming(Val155, BB154);

    Val170->addIncoming(Val167, BB165);
    Val170->addIncoming(Val156, BB162);
    Val170->addIncoming(Val156, BB154);

    Val171->addIncoming(Val157, BB165);
    Val171->addIncoming(Val164, BB162);
    Val171->addIncoming(Val157, BB154);

    std::string err;
    raw_string_ostream output(err);
    if (verifyModule(*mod, &output)) {
        errs() << "Error verifying module: " << err;
    }

    return mod;
}