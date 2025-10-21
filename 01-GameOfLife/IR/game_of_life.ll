; ModuleID = 'game_of_life.c'
source_filename = "game_of_life.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca [64 x [64 x i32]], align 16
  %2 = bitcast [64 x [64 x i32]]* %1 to i8*
  %3 = alloca [64 x [64 x i32]], align 16
  %4 = bitcast [64 x [64 x i32]]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16384, i8* nonnull %2) #5
  call void @llvm.lifetime.start.p0i8(i64 16384, i8* nonnull %4) #5
  %5 = tail call i32 (...) @simGetTicks() #5
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16384) %2, i8 0, i64 16384, i1 false), !tbaa !5
  br label %6

6:                                                ; preds = %0, %25
  %7 = phi i64 [ 0, %0 ], [ %26, %25 ]
  br label %11

8:                                                ; preds = %25
  %9 = tail call i32 (...) @checkFinish() #5
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %28, label %199

11:                                               ; preds = %6, %22
  %12 = phi i64 [ 0, %6 ], [ %23, %22 ]
  %13 = tail call i32 (...) @simRand() #5
  %14 = srem i32 %13, 100
  %15 = icmp slt i32 %14, 30
  br i1 %15, label %16, label %22

16:                                               ; preds = %11
  %17 = tail call i32 (...) @simRand() #5
  %18 = and i32 %17, 1
  %19 = icmp eq i32 %18, 0
  %20 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]]* %1, i64 0, i64 %7, i64 %12
  %21 = select i1 %19, i32 1, i32 2
  store i32 %21, i32* %20, align 4, !tbaa !5
  br label %22

22:                                               ; preds = %16, %11
  %23 = add nuw nsw i64 %12, 1
  %24 = icmp eq i64 %23, 64
  br i1 %24, label %25, label %11, !llvm.loop !9

25:                                               ; preds = %22
  %26 = add nuw nsw i64 %7, 1
  %27 = icmp eq i64 %26, 64
  br i1 %27, label %8, label %6, !llvm.loop !11

28:                                               ; preds = %8, %196
  %29 = phi i32 [ %56, %196 ], [ %5, %8 ]
  br label %30

30:                                               ; preds = %28, %46
  %31 = phi i64 [ 0, %28 ], [ %47, %46 ]
  %32 = trunc i64 %31 to i32
  %33 = shl i32 %32, 2
  br label %34

34:                                               ; preds = %30, %34
  %35 = phi i64 [ 0, %30 ], [ %44, %34 ]
  %36 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]]* %1, i64 0, i64 %31, i64 %35
  %37 = load i32, i32* %36, align 4, !tbaa !5
  %38 = icmp eq i32 %37, 2
  %39 = select i1 %38, i32 65280, i32 0
  %40 = icmp eq i32 %37, 1
  %41 = select i1 %40, i32 13047173, i32 %39
  %42 = trunc i64 %35 to i32
  %43 = shl i32 %42, 2
  tail call void @simFillRect(i32 noundef %43, i32 noundef %33, i32 noundef 4, i32 noundef 4, i32 noundef %41) #5
  %44 = add nuw nsw i64 %35, 1
  %45 = icmp eq i64 %44, 64
  br i1 %45, label %46, label %34, !llvm.loop !12

46:                                               ; preds = %34
  %47 = add nuw nsw i64 %31, 1
  %48 = icmp eq i64 %47, 64
  br i1 %48, label %49, label %30, !llvm.loop !13

49:                                               ; preds = %46
  %50 = tail call i32 (...) @simGetTicks() #5
  %51 = sub nsw i32 %50, %29
  %52 = icmp slt i32 %51, 10
  br i1 %52, label %53, label %55

53:                                               ; preds = %49
  %54 = sub nsw i32 10, %51
  tail call void @simDelay(i32 noundef %54) #5
  br label %55

55:                                               ; preds = %53, %49
  tail call void (...) @simFlush() #5
  %56 = tail call i32 (...) @simGetTicks() #5
  br label %57

57:                                               ; preds = %55, %193
  %58 = phi i64 [ 0, %55 ], [ %194, %193 ]
  %59 = add nuw i64 %58, 63
  %60 = and i64 %59, 63
  %61 = and i64 %58, 63
  %62 = add nuw i64 %58, 1
  %63 = and i64 %62, 63
  br label %64

64:                                               ; preds = %190, %57
  %65 = phi i64 [ 0, %57 ], [ %191, %190 ]
  %66 = add nuw i64 %65, 63
  %67 = and i64 %66, 63
  %68 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]]* %1, i64 0, i64 %60, i64 %67
  %69 = load i32, i32* %68, align 4, !tbaa !5
  switch i32 %69, label %72 [
    i32 1, label %70
    i32 2, label %71
  ]

70:                                               ; preds = %64
  br label %72

71:                                               ; preds = %64
  br label %72

72:                                               ; preds = %64, %71, %70
  %73 = phi i32 [ 1, %70 ], [ 1, %71 ], [ 0, %64 ]
  %74 = phi i32 [ 1, %70 ], [ 0, %71 ], [ 0, %64 ]
  %75 = phi i32 [ 0, %70 ], [ 1, %71 ], [ 0, %64 ]
  %76 = and i64 %65, 63
  %77 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]]* %1, i64 0, i64 %60, i64 %76
  %78 = load i32, i32* %77, align 4, !tbaa !5
  switch i32 %78, label %85 [
    i32 1, label %82
    i32 2, label %79
  ]

79:                                               ; preds = %72
  %80 = add nuw nsw i32 %73, 1
  %81 = add nuw nsw i32 %75, 1
  br label %85

82:                                               ; preds = %72
  %83 = add nuw nsw i32 %73, 1
  %84 = add nuw nsw i32 %74, 1
  br label %85

85:                                               ; preds = %72, %79, %82
  %86 = phi i32 [ %83, %82 ], [ %80, %79 ], [ %73, %72 ]
  %87 = phi i32 [ %84, %82 ], [ %74, %79 ], [ %74, %72 ]
  %88 = phi i32 [ %75, %82 ], [ %81, %79 ], [ %75, %72 ]
  %89 = add nuw i64 %65, 1
  %90 = and i64 %89, 63
  %91 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]]* %1, i64 0, i64 %60, i64 %90
  %92 = load i32, i32* %91, align 4, !tbaa !5
  switch i32 %92, label %99 [
    i32 1, label %96
    i32 2, label %93
  ]

93:                                               ; preds = %85
  %94 = add nuw nsw i32 %86, 1
  %95 = add nuw nsw i32 %88, 1
  br label %99

96:                                               ; preds = %85
  %97 = add nuw nsw i32 %86, 1
  %98 = add nuw nsw i32 %87, 1
  br label %99

99:                                               ; preds = %85, %93, %96
  %100 = phi i32 [ %97, %96 ], [ %94, %93 ], [ %86, %85 ]
  %101 = phi i32 [ %98, %96 ], [ %87, %93 ], [ %87, %85 ]
  %102 = phi i32 [ %88, %96 ], [ %95, %93 ], [ %88, %85 ]
  %103 = add nuw i64 %65, 63
  %104 = and i64 %103, 63
  %105 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]]* %1, i64 0, i64 %61, i64 %104
  %106 = load i32, i32* %105, align 4, !tbaa !5
  switch i32 %106, label %113 [
    i32 1, label %110
    i32 2, label %107
  ]

107:                                              ; preds = %99
  %108 = add nuw nsw i32 %100, 1
  %109 = add nuw nsw i32 %102, 1
  br label %113

110:                                              ; preds = %99
  %111 = add nuw nsw i32 %100, 1
  %112 = add nuw nsw i32 %101, 1
  br label %113

113:                                              ; preds = %110, %107, %99
  %114 = phi i32 [ %111, %110 ], [ %108, %107 ], [ %100, %99 ]
  %115 = phi i32 [ %112, %110 ], [ %101, %107 ], [ %101, %99 ]
  %116 = phi i32 [ %102, %110 ], [ %109, %107 ], [ %102, %99 ]
  %117 = add nuw i64 %65, 1
  %118 = and i64 %117, 63
  %119 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]]* %1, i64 0, i64 %61, i64 %118
  %120 = load i32, i32* %119, align 4, !tbaa !5
  switch i32 %120, label %127 [
    i32 1, label %124
    i32 2, label %121
  ]

121:                                              ; preds = %113
  %122 = add nuw nsw i32 %114, 1
  %123 = add nuw nsw i32 %116, 1
  br label %127

124:                                              ; preds = %113
  %125 = add nuw nsw i32 %114, 1
  %126 = add nuw nsw i32 %115, 1
  br label %127

127:                                              ; preds = %113, %121, %124
  %128 = phi i32 [ %125, %124 ], [ %122, %121 ], [ %114, %113 ]
  %129 = phi i32 [ %126, %124 ], [ %115, %121 ], [ %115, %113 ]
  %130 = phi i32 [ %116, %124 ], [ %123, %121 ], [ %116, %113 ]
  %131 = add nuw i64 %65, 63
  %132 = and i64 %131, 63
  %133 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]]* %1, i64 0, i64 %63, i64 %132
  %134 = load i32, i32* %133, align 4, !tbaa !5
  switch i32 %134, label %141 [
    i32 1, label %138
    i32 2, label %135
  ]

135:                                              ; preds = %127
  %136 = add nuw nsw i32 %128, 1
  %137 = add nuw nsw i32 %130, 1
  br label %141

138:                                              ; preds = %127
  %139 = add nuw nsw i32 %128, 1
  %140 = add nuw nsw i32 %129, 1
  br label %141

141:                                              ; preds = %127, %135, %138
  %142 = phi i32 [ %139, %138 ], [ %136, %135 ], [ %128, %127 ]
  %143 = phi i32 [ %140, %138 ], [ %129, %135 ], [ %129, %127 ]
  %144 = phi i32 [ %130, %138 ], [ %137, %135 ], [ %130, %127 ]
  %145 = and i64 %65, 63
  %146 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]]* %1, i64 0, i64 %63, i64 %145
  %147 = load i32, i32* %146, align 4, !tbaa !5
  switch i32 %147, label %154 [
    i32 1, label %151
    i32 2, label %148
  ]

148:                                              ; preds = %141
  %149 = add nuw nsw i32 %142, 1
  %150 = add nuw nsw i32 %144, 1
  br label %154

151:                                              ; preds = %141
  %152 = add nuw nsw i32 %142, 1
  %153 = add nuw nsw i32 %143, 1
  br label %154

154:                                              ; preds = %141, %148, %151
  %155 = phi i32 [ %152, %151 ], [ %149, %148 ], [ %142, %141 ]
  %156 = phi i32 [ %153, %151 ], [ %143, %148 ], [ %143, %141 ]
  %157 = phi i32 [ %144, %151 ], [ %150, %148 ], [ %144, %141 ]
  %158 = add nuw i64 %65, 1
  %159 = and i64 %158, 63
  %160 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]]* %1, i64 0, i64 %63, i64 %159
  %161 = load i32, i32* %160, align 4, !tbaa !5
  switch i32 %161, label %168 [
    i32 1, label %165
    i32 2, label %162
  ]

162:                                              ; preds = %154
  %163 = add nuw nsw i32 %155, 1
  %164 = add nuw nsw i32 %157, 1
  br label %168

165:                                              ; preds = %154
  %166 = add nuw nsw i32 %155, 1
  %167 = add nuw nsw i32 %156, 1
  br label %168

168:                                              ; preds = %165, %162, %154
  %169 = phi i32 [ %166, %165 ], [ %163, %162 ], [ %155, %154 ]
  %170 = phi i32 [ %167, %165 ], [ %156, %162 ], [ %156, %154 ]
  %171 = phi i32 [ %157, %165 ], [ %164, %162 ], [ %157, %154 ]
  %172 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]]* %1, i64 0, i64 %58, i64 %65
  %173 = load i32, i32* %172, align 4, !tbaa !5
  %174 = icmp sgt i32 %173, 0
  br i1 %174, label %175, label %181

175:                                              ; preds = %168
  %176 = and i32 %169, -2
  %177 = icmp eq i32 %176, 2
  %178 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]]* %3, i64 0, i64 %58, i64 %65
  br i1 %177, label %179, label %180

179:                                              ; preds = %175
  store i32 %173, i32* %178, align 4, !tbaa !5
  br label %190

180:                                              ; preds = %175
  store i32 0, i32* %178, align 4, !tbaa !5
  br label %190

181:                                              ; preds = %168
  %182 = icmp eq i32 %169, 3
  br i1 %182, label %183, label %188

183:                                              ; preds = %181
  %184 = icmp ugt i32 %170, %171
  %185 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]]* %3, i64 0, i64 %58, i64 %65
  br i1 %184, label %186, label %187

186:                                              ; preds = %183
  store i32 1, i32* %185, align 4, !tbaa !5
  br label %190

187:                                              ; preds = %183
  store i32 2, i32* %185, align 4, !tbaa !5
  br label %190

188:                                              ; preds = %181
  %189 = getelementptr inbounds [64 x [64 x i32]], [64 x [64 x i32]]* %3, i64 0, i64 %58, i64 %65
  store i32 0, i32* %189, align 4, !tbaa !5
  br label %190

190:                                              ; preds = %188, %187, %186, %179, %180
  %191 = add nuw nsw i64 %65, 1
  %192 = icmp eq i64 %191, 64
  br i1 %192, label %193, label %64, !llvm.loop !14

193:                                              ; preds = %190
  %194 = add nuw nsw i64 %58, 1
  %195 = icmp eq i64 %194, 64
  br i1 %195, label %196, label %57, !llvm.loop !15

196:                                              ; preds = %193
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16384) %2, i8* noundef nonnull align 16 dereferenceable(16384) %4, i64 16384, i1 false), !tbaa !5
  %197 = tail call i32 (...) @checkFinish() #5
  %198 = icmp eq i32 %197, 0
  br i1 %198, label %28, label %199, !llvm.loop !16

199:                                              ; preds = %196, %8
  call void @llvm.lifetime.end.p0i8(i64 16384, i8* nonnull %4) #5
  call void @llvm.lifetime.end.p0i8(i64 16384, i8* nonnull %2) #5
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

declare void @simDelay(i32 noundef) local_unnamed_addr #2

declare void @simFlush(...) local_unnamed_addr #2

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
