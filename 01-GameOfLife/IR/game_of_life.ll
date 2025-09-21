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
  call void @llvm.lifetime.start.p0i8(i64 524288, i8* nonnull %2) #4
  call void @llvm.lifetime.start.p0i8(i64 524288, i8* nonnull %4) #4
  %5 = tail call i32 (...) @simGetTicks() #4
  br label %6

6:                                                ; preds = %0, %20
  %7 = phi i64 [ 0, %0 ], [ %21, %20 ]
  br label %11

8:                                                ; preds = %20
  %9 = tail call i32 (...) @checkFinish() #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %23, label %135

11:                                               ; preds = %6, %11
  %12 = phi i64 [ 0, %6 ], [ %18, %11 ]
  %13 = tail call i32 (...) @simRand() #4
  %14 = srem i32 %13, 100
  %15 = icmp slt i32 %14, 50
  %16 = zext i1 %15 to i32
  %17 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %7, i64 %12
  store i32 %16, i32* %17, align 4
  %18 = add nuw nsw i64 %12, 1
  %19 = icmp eq i64 %18, 512
  br i1 %19, label %20, label %11, !llvm.loop !5

20:                                               ; preds = %11
  %21 = add nuw nsw i64 %7, 1
  %22 = icmp eq i64 %21, 256
  br i1 %22, label %8, label %6, !llvm.loop !7

23:                                               ; preds = %8, %132
  %24 = phi i32 [ %49, %132 ], [ %5, %8 ]
  br label %25

25:                                               ; preds = %23, %39
  %26 = phi i64 [ 0, %23 ], [ %40, %39 ]
  %27 = trunc i64 %26 to i32
  %28 = mul i32 %27, 3
  br label %29

29:                                               ; preds = %25, %29
  %30 = phi i64 [ 0, %25 ], [ %37, %29 ]
  %31 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %26, i64 %30
  %32 = load i32, i32* %31, align 4, !tbaa !8
  %33 = icmp eq i32 %32, 1
  %34 = select i1 %33, i32 13047173, i32 0
  %35 = trunc i64 %30 to i32
  %36 = mul i32 %35, 3
  tail call void @simFillRect(i32 noundef %36, i32 noundef %28, i32 noundef 3, i32 noundef 3, i32 noundef %34) #4
  %37 = add nuw nsw i64 %30, 1
  %38 = icmp eq i64 %37, 512
  br i1 %38, label %39, label %29, !llvm.loop !12

39:                                               ; preds = %29
  %40 = add nuw nsw i64 %26, 1
  %41 = icmp eq i64 %40, 256
  br i1 %41, label %42, label %25, !llvm.loop !13

42:                                               ; preds = %39
  %43 = tail call i32 (...) @simGetTicks() #4
  %44 = sub nsw i32 %43, %24
  %45 = icmp slt i32 %44, 10
  br i1 %45, label %46, label %48

46:                                               ; preds = %42
  %47 = sub nsw i32 10, %44
  tail call void @simDelay(i32 noundef %47) #4
  br label %48

48:                                               ; preds = %46, %42
  tail call void (...) @simFlush() #4
  %49 = tail call i32 (...) @simGetTicks() #4
  br label %50

50:                                               ; preds = %48, %129
  %51 = phi i64 [ 0, %48 ], [ %130, %129 ]
  %52 = add nuw i64 %51, 255
  %53 = and i64 %52, 255
  %54 = and i64 %51, 255
  %55 = add nuw i64 %51, 1
  %56 = and i64 %55, 255
  br label %57

57:                                               ; preds = %126, %50
  %58 = phi i64 [ 0, %50 ], [ %127, %126 ]
  %59 = add nuw i64 %58, 511
  %60 = and i64 %59, 511
  %61 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %53, i64 %60
  %62 = load i32, i32* %61, align 4, !tbaa !8
  %63 = icmp eq i32 %62, 1
  %64 = zext i1 %63 to i32
  %65 = and i64 %58, 511
  %66 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %53, i64 %65
  %67 = load i32, i32* %66, align 4, !tbaa !8
  %68 = icmp eq i32 %67, 1
  %69 = zext i1 %68 to i32
  %70 = add nuw nsw i32 %64, %69
  %71 = add nuw i64 %58, 1
  %72 = and i64 %71, 511
  %73 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %53, i64 %72
  %74 = load i32, i32* %73, align 4, !tbaa !8
  %75 = icmp eq i32 %74, 1
  %76 = zext i1 %75 to i32
  %77 = add nuw nsw i32 %70, %76
  %78 = add nuw i64 %58, 511
  %79 = and i64 %78, 511
  %80 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %54, i64 %79
  %81 = load i32, i32* %80, align 4, !tbaa !8
  %82 = icmp eq i32 %81, 1
  %83 = zext i1 %82 to i32
  %84 = add nuw nsw i32 %77, %83
  %85 = add nuw i64 %58, 1
  %86 = and i64 %85, 511
  %87 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %54, i64 %86
  %88 = load i32, i32* %87, align 4, !tbaa !8
  %89 = icmp eq i32 %88, 1
  %90 = zext i1 %89 to i32
  %91 = add nuw nsw i32 %84, %90
  %92 = add nuw i64 %58, 511
  %93 = and i64 %92, 511
  %94 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %56, i64 %93
  %95 = load i32, i32* %94, align 4, !tbaa !8
  %96 = icmp eq i32 %95, 1
  %97 = zext i1 %96 to i32
  %98 = add nuw nsw i32 %91, %97
  %99 = and i64 %58, 511
  %100 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %56, i64 %99
  %101 = load i32, i32* %100, align 4, !tbaa !8
  %102 = icmp eq i32 %101, 1
  %103 = zext i1 %102 to i32
  %104 = add nuw nsw i32 %98, %103
  %105 = add nuw i64 %58, 1
  %106 = and i64 %105, 511
  %107 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %56, i64 %106
  %108 = load i32, i32* %107, align 4, !tbaa !8
  %109 = icmp eq i32 %108, 1
  %110 = zext i1 %109 to i32
  %111 = add nuw nsw i32 %104, %110
  %112 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %1, i64 0, i64 %51, i64 %58
  %113 = load i32, i32* %112, align 4, !tbaa !8
  %114 = icmp eq i32 %113, 1
  br i1 %114, label %115, label %121

115:                                              ; preds = %57
  %116 = and i32 %111, -2
  %117 = icmp eq i32 %116, 2
  %118 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %3, i64 0, i64 %51, i64 %58
  br i1 %117, label %119, label %120

119:                                              ; preds = %115
  store i32 1, i32* %118, align 4, !tbaa !8
  br label %126

120:                                              ; preds = %115
  store i32 0, i32* %118, align 4, !tbaa !8
  br label %126

121:                                              ; preds = %57
  %122 = icmp eq i32 %111, 3
  %123 = getelementptr inbounds [256 x [512 x i32]], [256 x [512 x i32]]* %3, i64 0, i64 %51, i64 %58
  br i1 %122, label %124, label %125

124:                                              ; preds = %121
  store i32 1, i32* %123, align 4, !tbaa !8
  br label %126

125:                                              ; preds = %121
  store i32 0, i32* %123, align 4, !tbaa !8
  br label %126

126:                                              ; preds = %124, %125, %119, %120
  %127 = add nuw nsw i64 %58, 1
  %128 = icmp eq i64 %127, 512
  br i1 %128, label %129, label %57, !llvm.loop !14

129:                                              ; preds = %126
  %130 = add nuw nsw i64 %51, 1
  %131 = icmp eq i64 %130, 256
  br i1 %131, label %132, label %50, !llvm.loop !15

132:                                              ; preds = %129
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(524288) %2, i8* noundef nonnull align 16 dereferenceable(524288) %4, i64 524288, i1 false), !tbaa !8
  %133 = tail call i32 (...) @checkFinish() #4
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %23, label %135, !llvm.loop !16

135:                                              ; preds = %132, %8
  call void @llvm.lifetime.end.p0i8(i64 524288, i8* nonnull %4) #4
  call void @llvm.lifetime.end.p0i8(i64 524288, i8* nonnull %2) #4
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

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
