import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/common/shared_cubits/app_overlay/app_overlay_cubit.dart';
import 'package:velocio/src/features/app/cubit/app_cubit.dart';
import 'package:velocio/src/features/auth_page/cubit/auth_cubit.dart';

void initSharedCubits() {
  i.registerSingleton<AppOverlayCubit>(
    AppOverlayCubit(),
  );
}

void initCubits() {
  i
    ..registerFactory<AppCubit>(
      AppCubit.new,
    )
    ..registerFactory<AuthCubit>(AuthCubit.new);
}
