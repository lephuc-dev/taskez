import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/inkwell_wrapper.dart';
import '../../../resources/resources.dart';

class OptionItem extends StatelessWidget {
  final String title;
  final String icon;
  final void Function() onTap;

  const OptionItem({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: InkWellWrapper(
          splashColor: AppColors.splashInkWell.withOpacity(0.2),
          hoverColor: AppColors.splashInkWell.withOpacity(0.2),
          highlightColor: AppColors.splashInkWell.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: Row(
              children: [
                SvgPicture.asset(icon),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
