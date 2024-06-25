import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        GoRouter.of(context).push(AppRouter.takeNoteView);
      },
      backgroundColor: const Color(0xff252525),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Icon(
        Icons.add,
        size: 48.r,
        color: Colors.white,
      ),
    );
  }
}
