; ModuleID = 'game_of_life.c'
source_filename = "game_of_life.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca [256 x [512 x i32]], align 16
  %2 = bitcast [256 x [512 x i32]]* %1 to i8*
  %3 = alloca [256 x [512 x i32]], align 16
  %4 = bitcast [256 x [512 x i32]]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 524288, i8* nonnull %2) #5
  call void @llvm.lifetime.start.p0i8(i64 524288, i8* nonnull %4) #5
  %5 = tail call i32 (...) @simGetTicks() #5
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(524288) %2, i8 0, i64 524288, i1 false), !tbaa !5
  br label %6

6:                                                ; preds = %0, %22
  %7 = phi i64 [ 0, %0 ], [ %23, %22 ]
  br label %8

8:                                                ; preds = %6, %19
  %9 = phi i64 [ 0, %6 ], [ %20, %19 ]
  %10 = tail call i32 (...) @simRand() #5
  %11 = srem i32 %10, 100
  %12 = icmp slt i32 %11, 30
  br i1 %12, label %13, label %19

13:                                               ; preds = %8
  %14 = tail call i32 (...) @simRand() #5
  %15 = and i32 %14, 1
  %16 = icmp eq i32 %15, 0
  %17 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %7, i64 %9
  %18 = select i1 %16, i32 1, i32 2
  store i32 %18, i32* %17, align 4, !tbaa !5
  br label %19

19:                                               ; preds = %13, %8
  %20 = add nuw nsw i64 %9, 1
  %21 = icmp eq i64 %20, 512
  br i1 %21, label %22, label %8, !llvm.loop !9

22:                                               ; preds = %19
  %23 = add nuw nsw i64 %7, 1
  %24 = icmp eq i64 %23, 256
  br i1 %24, label %25, label %6, !llvm.loop !11

25:                                               ; preds = %22, %74
  %26 = tail call i32 (...) @checkFinish() #5
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %75

28:                                               ; preds = %25, %44
  %29 = phi i64 [ %45, %44 ], [ 0, %25 ]
  %30 = trunc i64 %29 to i32
  %31 = shl i32 %30, 2
  br label %32

32:                                               ; preds = %28, %32
  %33 = phi i64 [ 0, %28 ], [ %42, %32 ]
  %34 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %29, i64 %33
  %35 = load i32, i32* %34, align 4, !tbaa !5
  %36 = icmp eq i32 %35, 2
  %37 = select i1 %36, i32 65280, i32 0
  %38 = icmp eq i32 %35, 1
  %39 = select i1 %38, i32 13047173, i32 %37
  %40 = trunc i64 %33 to i32
  %41 = shl i32 %40, 2
  tail call void @simFillRect(i32 noundef %41, i32 noundef %31, i32 noundef 4, i32 noundef 4, i32 noundef %39) #5
  %42 = add nuw nsw i64 %33, 1
  %43 = icmp eq i64 %42, 512
  br i1 %43, label %44, label %32, !llvm.loop !12

44:                                               ; preds = %32
  %45 = add nuw nsw i64 %29, 1
  %46 = icmp eq i64 %45, 256
  br i1 %46, label %47, label %28, !llvm.loop !13

47:                                               ; preds = %44
  tail call void (...) @simFlush() #5
  %48 = tail call i32 @simIsKeyDown(i32 noundef 44) #5
  %49 = icmp eq i32 %48, 0
  %50 = tail call i32 (...) @simGetMouseX() #5
  %51 = sdiv i32 %50, 4
  %52 = tail call i32 (...) @simGetMouseY() #5
  %53 = sdiv i32 %52, 4
  %54 = add i32 %50, 3
  %55 = icmp ult i32 %54, 2051
  %56 = icmp sgt i32 %52, -4
  %57 = select i1 %55, i1 %56, i1 false
  %58 = icmp slt i32 %52, 1024
  %59 = select i1 %57, i1 %58, i1 false
  br i1 %59, label %60, label %74

60:                                               ; preds = %47
  %61 = tail call i32 @simIsMouseButtonDown(i32 noundef 1) #5
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %67, label %63

63:                                               ; preds = %60
  %64 = sext i32 %53 to i64
  %65 = sext i32 %51 to i64
  %66 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %64, i64 %65
  store i32 1, i32* %66, align 4, !tbaa !5
  br label %67

67:                                               ; preds = %63, %60
  %68 = tail call i32 @simIsMouseButtonDown(i32 noundef 3) #5
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %74, label %70

70:                                               ; preds = %67
  %71 = sext i32 %53 to i64
  %72 = sext i32 %51 to i64
  %73 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %71, i64 %72
  store i32 2, i32* %73, align 4, !tbaa !5
  br label %74

74:                                               ; preds = %67, %70, %47
  br i1 %49, label %25, label %75, !llvm.loop !14

75:                                               ; preds = %74, %25
  %76 = tail call i32 (...) @checkFinish() #5
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %249

78:                                               ; preds = %75, %246
  %79 = phi i32 [ %106, %246 ], [ %5, %75 ]
  br label %80

80:                                               ; preds = %78, %96
  %81 = phi i64 [ 0, %78 ], [ %97, %96 ]
  %82 = trunc i64 %81 to i32
  %83 = shl i32 %82, 2
  br label %84

84:                                               ; preds = %80, %84
  %85 = phi i64 [ 0, %80 ], [ %94, %84 ]
  %86 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %81, i64 %85
  %87 = load i32, i32* %86, align 4, !tbaa !5
  %88 = icmp eq i32 %87, 2
  %89 = select i1 %88, i32 65280, i32 0
  %90 = icmp eq i32 %87, 1
  %91 = select i1 %90, i32 13047173, i32 %89
  %92 = trunc i64 %85 to i32
  %93 = shl i32 %92, 2
  tail call void @simFillRect(i32 noundef %93, i32 noundef %83, i32 noundef 4, i32 noundef 4, i32 noundef %91) #5
  %94 = add nuw nsw i64 %85, 1
  %95 = icmp eq i64 %94, 512
  br i1 %95, label %96, label %84, !llvm.loop !15

96:                                               ; preds = %84
  %97 = add nuw nsw i64 %81, 1
  %98 = icmp eq i64 %97, 256
  br i1 %98, label %99, label %80, !llvm.loop !16

99:                                               ; preds = %96
  %100 = tail call i32 (...) @simGetTicks() #5
  %101 = sub nsw i32 %100, %79
  %102 = icmp slt i32 %101, 10
  br i1 %102, label %103, label %105

103:                                              ; preds = %99
  %104 = sub nsw i32 10, %101
  tail call void @simDelay(i32 noundef %104) #5
  br label %105

105:                                              ; preds = %103, %99
  tail call void (...) @simFlush() #5
  %106 = tail call i32 (...) @simGetTicks() #5
  br label %107

107:                                              ; preds = %105, %243
  %108 = phi i64 [ 0, %105 ], [ %244, %243 ]
  %109 = add nuw i64 %108, 255
  %110 = and i64 %109, 255
  %111 = and i64 %108, 255
  %112 = add nuw i64 %108, 1
  %113 = and i64 %112, 255
  br label %114

114:                                              ; preds = %240, %107
  %115 = phi i64 [ 0, %107 ], [ %241, %240 ]
  %116 = add nuw i64 %115, 511
  %117 = and i64 %116, 511
  %118 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %110, i64 %117
  %119 = load i32, i32* %118, align 4, !tbaa !5
  switch i32 %119, label %122 [
    i32 1, label %120
    i32 2, label %121
  ]

120:                                              ; preds = %114
  br label %122

121:                                              ; preds = %114
  br label %122

122:                                              ; preds = %114, %121, %120
  %123 = phi i32 [ 1, %120 ], [ 1, %121 ], [ 0, %114 ]
  %124 = phi i32 [ 1, %120 ], [ 0, %121 ], [ 0, %114 ]
  %125 = phi i32 [ 0, %120 ], [ 1, %121 ], [ 0, %114 ]
  %126 = and i64 %115, 511
  %127 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %110, i64 %126
  %128 = load i32, i32* %127, align 4, !tbaa !5
  switch i32 %128, label %135 [
    i32 1, label %132
    i32 2, label %129
  ]

129:                                              ; preds = %122
  %130 = add nuw nsw i32 %123, 1
  %131 = add nuw nsw i32 %125, 1
  br label %135

132:                                              ; preds = %122
  %133 = add nuw nsw i32 %123, 1
  %134 = add nuw nsw i32 %124, 1
  br label %135

135:                                              ; preds = %122, %129, %132
  %136 = phi i32 [ %133, %132 ], [ %130, %129 ], [ %123, %122 ]
  %137 = phi i32 [ %134, %132 ], [ %124, %129 ], [ %124, %122 ]
  %138 = phi i32 [ %125, %132 ], [ %131, %129 ], [ %125, %122 ]
  %139 = add nuw i64 %115, 1
  %140 = and i64 %139, 511
  %141 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %110, i64 %140
  %142 = load i32, i32* %141, align 4, !tbaa !5
  switch i32 %142, label %149 [
    i32 1, label %146
    i32 2, label %143
  ]

143:                                              ; preds = %135
  %144 = add nuw nsw i32 %136, 1
  %145 = add nuw nsw i32 %138, 1
  br label %149

146:                                              ; preds = %135
  %147 = add nuw nsw i32 %136, 1
  %148 = add nuw nsw i32 %137, 1
  br label %149

149:                                              ; preds = %135, %143, %146
  %150 = phi i32 [ %147, %146 ], [ %144, %143 ], [ %136, %135 ]
  %151 = phi i32 [ %148, %146 ], [ %137, %143 ], [ %137, %135 ]
  %152 = phi i32 [ %138, %146 ], [ %145, %143 ], [ %138, %135 ]
  %153 = add nuw i64 %115, 511
  %154 = and i64 %153, 511
  %155 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %111, i64 %154
  %156 = load i32, i32* %155, align 4, !tbaa !5
  switch i32 %156, label %163 [
    i32 1, label %160
    i32 2, label %157
  ]

157:                                              ; preds = %149
  %158 = add nuw nsw i32 %150, 1
  %159 = add nuw nsw i32 %152, 1
  br label %163

160:                                              ; preds = %149
  %161 = add nuw nsw i32 %150, 1
  %162 = add nuw nsw i32 %151, 1
  br label %163

163:                                              ; preds = %160, %157, %149
  %164 = phi i32 [ %161, %160 ], [ %158, %157 ], [ %150, %149 ]
  %165 = phi i32 [ %162, %160 ], [ %151, %157 ], [ %151, %149 ]
  %166 = phi i32 [ %152, %160 ], [ %159, %157 ], [ %152, %149 ]
  %167 = add nuw i64 %115, 1
  %168 = and i64 %167, 511
  %169 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %111, i64 %168
  %170 = load i32, i32* %169, align 4, !tbaa !5
  switch i32 %170, label %177 [
    i32 1, label %174
    i32 2, label %171
  ]

171:                                              ; preds = %163
  %172 = add nuw nsw i32 %164, 1
  %173 = add nuw nsw i32 %166, 1
  br label %177

174:                                              ; preds = %163
  %175 = add nuw nsw i32 %164, 1
  %176 = add nuw nsw i32 %165, 1
  br label %177

177:                                              ; preds = %163, %171, %174
  %178 = phi i32 [ %175, %174 ], [ %172, %171 ], [ %164, %163 ]
  %179 = phi i32 [ %176, %174 ], [ %165, %171 ], [ %165, %163 ]
  %180 = phi i32 [ %166, %174 ], [ %173, %171 ], [ %166, %163 ]
  %181 = add nuw i64 %115, 511
  %182 = and i64 %181, 511
  %183 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %113, i64 %182
  %184 = load i32, i32* %183, align 4, !tbaa !5
  switch i32 %184, label %191 [
    i32 1, label %188
    i32 2, label %185
  ]

185:                                              ; preds = %177
  %186 = add nuw nsw i32 %178, 1
  %187 = add nuw nsw i32 %180, 1
  br label %191

188:                                              ; preds = %177
  %189 = add nuw nsw i32 %178, 1
  %190 = add nuw nsw i32 %179, 1
  br label %191

191:                                              ; preds = %177, %185, %188
  %192 = phi i32 [ %189, %188 ], [ %186, %185 ], [ %178, %177 ]
  %193 = phi i32 [ %190, %188 ], [ %179, %185 ], [ %179, %177 ]
  %194 = phi i32 [ %180, %188 ], [ %187, %185 ], [ %180, %177 ]
  %195 = and i64 %115, 511
  %196 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %113, i64 %195
  %197 = load i32, i32* %196, align 4, !tbaa !5
  switch i32 %197, label %204 [
    i32 1, label %201
    i32 2, label %198
  ]

198:                                              ; preds = %191
  %199 = add nuw nsw i32 %192, 1
  %200 = add nuw nsw i32 %194, 1
  br label %204

201:                                              ; preds = %191
  %202 = add nuw nsw i32 %192, 1
  %203 = add nuw nsw i32 %193, 1
  br label %204

204:                                              ; preds = %191, %198, %201
  %205 = phi i32 [ %202, %201 ], [ %199, %198 ], [ %192, %191 ]
  %206 = phi i32 [ %203, %201 ], [ %193, %198 ], [ %193, %191 ]
  %207 = phi i32 [ %194, %201 ], [ %200, %198 ], [ %194, %191 ]
  %208 = add nuw i64 %115, 1
  %209 = and i64 %208, 511
  %210 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %113, i64 %209
  %211 = load i32, i32* %210, align 4, !tbaa !5
  switch i32 %211, label %218 [
    i32 1, label %215
    i32 2, label %212
  ]

212:                                              ; preds = %204
  %213 = add nuw nsw i32 %205, 1
  %214 = add nuw nsw i32 %207, 1
  br label %218

215:                                              ; preds = %204
  %216 = add nuw nsw i32 %205, 1
  %217 = add nuw nsw i32 %206, 1
  br label %218

218:                                              ; preds = %215, %212, %204
  %219 = phi i32 [ %216, %215 ], [ %213, %212 ], [ %205, %204 ]
  %220 = phi i32 [ %217, %215 ], [ %206, %212 ], [ %206, %204 ]
  %221 = phi i32 [ %207, %215 ], [ %214, %212 ], [ %207, %204 ]
  %222 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %108, i64 %115
  %223 = load i32, i32* %222, align 4, !tbaa !5
  %224 = icmp sgt i32 %223, 0
  br i1 %224, label %225, label %231

225:                                              ; preds = %218
  %226 = and i32 %219, -2
  %227 = icmp eq i32 %226, 2
  %228 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %3, i64 0, i64 %108, i64 %115
  br i1 %227, label %229, label %230

229:                                              ; preds = %225
  store i32 %223, i32* %228, align 4, !tbaa !5
  br label %240

230:                                              ; preds = %225
  store i32 0, i32* %228, align 4, !tbaa !5
  br label %240

231:                                              ; preds = %218
  %232 = icmp eq i32 %219, 3
  br i1 %232, label %233, label %238

233:                                              ; preds = %231
  %234 = icmp ugt i32 %220, %221
  %235 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %3, i64 0, i64 %108, i64 %115
  br i1 %234, label %236, label %237

236:                                              ; preds = %233
  store i32 1, i32* %235, align 4, !tbaa !5
  br label %240

237:                                              ; preds = %233
  store i32 2, i32* %235, align 4, !tbaa !5
  br label %240

238:                                              ; preds = %231
  %239 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %3, i64 0, i64 %108, i64 %115
  store i32 0, i32* %239, align 4, !tbaa !5
  br label %240

240:                                              ; preds = %238, %237, %236, %229, %230
  %241 = add nuw nsw i64 %115, 1
  %242 = icmp eq i64 %241, 512
  br i1 %242, label %243, label %114, !llvm.loop !17

243:                                              ; preds = %240
  %244 = add nuw nsw i64 %108, 1
  %245 = icmp eq i64 %244, 256
  br i1 %245, label %246, label %107, !llvm.loop !18

246:                                              ; preds = %243
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(524288) %2, i8* noundef nonnull align 16 dereferenceable(524288) %4, i64 524288, i1 false), !tbaa !5
  %247 = tail call i32 (...) @checkFinish() #5
  %248 = icmp eq i32 %247, 0
  br i1 %248, label %78, label %249, !llvm.loop !19

249:                                              ; preds = %246, %75
  call void @llvm.lifetime.end.p0i8(i64 524288, i8* nonnull %4) #5
  call void @llvm.lifetime.end.p0i8(i64 524288, i8* nonnull %2) #5
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare i32 @simGetTicks(...) local_unnamed_addr #2

declare i32 @simRand(...) local_unnamed_addr #2

declare i32 @checkFinish(...) local_unnamed_addr #2

declare void @simFillRect(i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare void @simFlush(...) local_unnamed_addr #2

declare i32 @simIsKeyDown(i32 noundef) local_unnamed_addr #2

declare i32 @simGetMouseX(...) local_unnamed_addr #2

declare i32 @simGetMouseY(...) local_unnamed_addr #2

declare i32 @simIsMouseButtonDown(i32 noundef) local_unnamed_addr #2

declare void @simDelay(i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !10}
!17 = distinct !{!17, !10}
!18 = distinct !{!18, !10}
!19 = distinct !{!19, !10}
