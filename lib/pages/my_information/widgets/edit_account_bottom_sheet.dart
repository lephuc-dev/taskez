import 'package:flutter/material.dart';
import 'package:taskez/widgets/inkwell_wrapper.dart';

import '../../../router/router.dart';

class EditAccountBottomSheet extends StatelessWidget {
  const EditAccountBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          optionEdit(context,
              name: "Edit name",
              iconData: Icons.person,
              onTap: () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, Routes.editProfiles),
                  }),
          optionEdit(context,
              name: "Edit avatar",
              iconData: Icons.account_circle,
              onTap: () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, Routes.changeAvatar),
                  }),
          optionEdit(context,
              name: "Edit password",
              iconData: Icons.lock,
              onTap: () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, Routes.changePassword),
                  }),
        ],
      ),
    );
  }

  Widget optionEdit(
    BuildContext context, {
    required String name,
    required IconData iconData,
    required Function() onTap,
  }) {
    return InkWellWrapper(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Icon(iconData),
            const SizedBox(width: 16),
            Text(
              name,
              style: Theme.of(context).textTheme.subtitle1,
            )
          ],
        ),
      ),
    );
  }
}
