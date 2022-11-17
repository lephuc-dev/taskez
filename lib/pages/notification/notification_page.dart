import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/blocs.dart';
import '../../base/base.dart';
import '../../widgets/widgets.dart';
import '../../enums/enums.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  final NotificationBloc bloc;

  const NotificationPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState
    extends BaseState<NotificationPage, NotificationBloc> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: titleAppbar(context),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    NotifyComponent(
                      expiredtime: '21:00, 13 thg 11',
                      card: 'Code UI noti',
                      type: Type.expired,
                      time: '12 thg 11 lúc 21:00',
                      board: 'Lập trình di động',
                      onTap: () => {},
                    ),
                    NotifyComponent(
                      user: 'Lê Hoàng Phúc',
                      card: 'Tạo app demo push noti bằng firebase',
                      list: "Đã xong",
                      type: Type.move,
                      time: '8 thg 11 lúc 22:01',
                      board: 'Lập trình di động',
                      avt:
                          'https://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png',
                      onTap: () => {},
                    ),
                    NotifyComponent(
                      user: 'Lê Hoàng Phúc',
                      card: 'Code UI noti',
                      type: Type.add,
                      time: '7 thg 11 lúc 22:01',
                      board: 'Lập trình di động',
                      avt:
                          'https://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png',
                      onTap: () => {},
                    ),
                    NotifyComponent(
                      user: 'Lê Hoàng Phúc',
                      card: 'Code UI noti',
                      change: 'ngày hết hạn',
                      type: Type.change,
                      time: '7 thg 11 lúc 22:01',
                      board: 'Lập trình di động',
                      avt:
                          'https://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png',
                      onTap: () => {},
                    ),
                    NotifyComponent(
                      expiredtime: '21:00, 13 thg 11',
                      card: 'Code UI noti',
                      type: Type.expired,
                      time: '12 thg 11 lúc 21:00',
                      board: 'Lập trình di động',
                      onTap: () => {},
                    ),
                    NotifyComponent(
                      user: 'Lê Hoàng Phúc',
                      card: 'Tạo app demo push noti bằng firebase',
                      list: "Đã xong",
                      type: Type.move,
                      time: '8 thg 11 lúc 22:01',
                      board: 'Lập trình di động',
                      avt:
                          'https://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png',
                      onTap: () => {},
                    ),
                    NotifyComponent(
                      user: 'Lê Hoàng Phúc',
                      card: 'Code UI noti',
                      type: Type.add,
                      time: '7 thg 11 lúc 22:01',
                      board: 'Lập trình di động',
                      avt:
                          'https://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png',
                      onTap: () => {},
                    ),
                    NotifyComponent(
                      user: 'Lê Hoàng Phúc',
                      card: 'Code UI noti',
                      change: 'ngày hết hạn',
                      type: Type.change,
                      time: '7 thg 11 lúc 22:01',
                      board: 'Lập trình di động',
                      avt:
                          'https://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png',
                      onTap: () => {},
                    ),
                    NotifyComponent(
                      user: 'Lê Hoàng Phúc',
                      card: 'Code UI noti',
                      change: 'ngày hết hạn',
                      type: Type.change,
                      time: '7 thg 11 lúc 22:01',
                      board: 'Lập trình di động',
                      avt:
                          'https://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png',
                      onTap: () => {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget titleAppbar(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const FaIcon(
        FontAwesomeIcons.xmark,
      ),
      const Text(
        'Thông báo',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      ),
      Row(
        children: [
          Container(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05),
            child: const FaIcon(FontAwesomeIcons.squareCheck),
          ),
          const FaIcon(FontAwesomeIcons.ellipsisVertical)
        ],
      )
    ]);
  }

  @override
  NotificationBloc get bloc => widget.bloc;
}
