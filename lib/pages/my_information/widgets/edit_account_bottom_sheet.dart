import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskez/resources/assets.dart';
import '../../../widgets/inkwell_wrapper.dart';
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
              icon: VectorImageAssets.ic_user,
              onTap: () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, Routes.editProfiles),
                  }),
          optionEdit(context,
              name: "Edit avatar",
              icon: VectorImageAssets.ic_avatar,
              onTap: () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, Routes.changeAvatar),
                  }),
          optionEdit(context,
              name: "Edit password",
              icon: VectorImageAssets.ic_password,
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
    required String icon,
    required Function() onTap,
  }) {
    return InkWellWrapper(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            SvgPicture.asset(icon),
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
