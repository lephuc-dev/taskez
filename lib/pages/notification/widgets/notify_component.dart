import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../enums/enums.dart';
import '../../../resources/resources.dart';
import '../../../../../widgets/widgets.dart';
import 'package:intl/intl.dart';

class NotifyComponent extends StatelessWidget {
  final String list;
  final String card;
  final String board;
  final String user;
  final Type type;
  final String expiredtime;
  final String time;
  final String avt;
  final String objectchange;
  final String project;
  final bool seen;
  final void Function() onTap;

  const NotifyComponent({
    Key? key,
    this.list = '',
    this.project = '',
    this.card = '',
    this.board = '',
    this.user = '',
    this.avt = '',
    this.objectchange = '',
    required this.type,
    this.expiredtime = '',
    required this.time,
    required this.onTap,
    required this.seen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: !seen
          ? const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: AppColors.primaryBlue,
                  width: 4.0,
                ),
              ),
            )
          : null,
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        onTap: onTap,
        leading: type == Type.expired
            ? const FaIcon(
                FontAwesomeIcons.clock,
                size: 40,
              )
            : avt != ""
                ? Image.network(
                    avt,
                    width: 40,
                    height: 40,
                  )
                : AvatarWithName(
                    name: user,
                    fontSize: 14,
                    shapeSize: 40,
                    count: user.split(' ').length,
                  ),
        title: content(type),
        subtitle: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(width: 0.5, color: AppColors.primaryGray2))),
          child: Container(
            padding: const EdgeInsets.only(bottom: 15, top: 2),
            child: Text(
              convertDate(time),
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ),
    );
  }

  String convertDate(String date) {
    String temp = "";
    int i = 0;
    DateTime dateTime = DateTime.parse(date);
    DateFormat('dd MM kk:mm')
        .format(dateTime)
        .toString()
        .split(' ')
        .forEach((element) => {
              temp = temp + element,
              if (i == 0) temp = '$temp thg ',
              if (i == 1) temp = '$temp lúc ',
              i++
            });
    return temp;
  }

  Widget content(Type type) {
    switch (type) {
      case Type.add:
        return RichText(
          text: TextSpan(
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryBlack3,
                  fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                  text: user,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' đã thêm bạn vào thẻ '),
                TextSpan(
                  text: card,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' ở bảng '),
                TextSpan(
                  text: board,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
        );
      case Type.change:
        return RichText(
          text: TextSpan(
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryBlack3,
                  fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                  text: user,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' đã thay đổi '),
                TextSpan(text: objectchange),
                const TextSpan(text: ' của thẻ '),
                TextSpan(
                  text: card,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' ở bảng '),
                TextSpan(
                  text: board,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
        );
      case Type.expired:
        return RichText(
          text: TextSpan(
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryBlack3,
                  fontSize: 15),
              children: <TextSpan>[
                const TextSpan(text: 'thẻ '),
                TextSpan(
                  text: card,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' trong bảng '),
                TextSpan(
                  text: board,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' đã hết hạn '),
                TextSpan(
                  text: expiredtime,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
        );
      case Type.move:
        return RichText(
          text: TextSpan(
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryBlack3,
                  fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                  text: user,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' đã di chuyển thẻ '),
                TextSpan(
                  text: card,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' tới danh sách '),
                TextSpan(
                  text: list,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' ở bảng '),
                TextSpan(
                  text: board,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
        );
      case Type.invite:
        return RichText(
          text: TextSpan(
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryBlack3,
                  fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                  text: user,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' đã mời bạn tham gia dự án '),
                TextSpan(
                  text: project,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
        );
      default:
        return const Text('default');
    }
  }

  getWidth() {
    if (seen) return 0;
    return 4;
  }
}
