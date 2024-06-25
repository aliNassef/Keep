import 'package:get_it/get_it.dart';

import 'cache/cache_helper.dart';

GetIt getIt = GetIt.instance;

Future<void> setupGet() async {
  await CacheHelper().init();
  getIt.registerSingleton<CacheHelper>(
    CacheHelper(),
  );
  // getIt.registerLazySingleton<GetNotesCubit>(
  //   () => GetNotesCubit(),
  // );
  // getIt.registerLazySingleton<AddNoteCubit>(
  //   () => AddNoteCubit(),
  // );
}
