import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';
import 'core/local_notifications/local_notification.dart';
import 'core/local_notifications/work_manger_service.dart';
import 'core/service_locator.dart';
import 'features/home/data/model/note_model.dart';
import 'features/home/data/model/note_model_type_adapter.dart';
import 'motivation_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGet();
  await Hive.initFlutter();
  await ScreenUtil.ensureScreenSize();
  Hive.registerAdapter(NoteModelTypeAdapter());
  await Hive.openBox<NoteModel>(AppConstants.kBoxName);
  Future.wait([LocalNotificationService().init(), WorkManagerService().init()]);
  runApp(const MotivationApp());
}
