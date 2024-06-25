import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/shared/widgets/custom_icon.dart';

class CustomEditAppBar extends StatelessWidget {
  const CustomEditAppBar({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.pop();
          },
          child: const CustomIcon(
            icon: Icons.arrow_back_ios_new_sharp,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: const CustomIcon(
            icon: Icons.edit,
          ),
        ),
      ],
    );
  }
}
