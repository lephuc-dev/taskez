import 'package:flutter/material.dart';
import '../home/home.dart';
import '../notification/notification.dart';
import '../../repositories/repositories.dart';
import '../../blocs/blocs.dart';
import '../../resources/resources.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  HomeBloc homeBloc = HomeBloc(
    AuthenticationRepository(),
    UserRepository(),
    ProjectRepository(),
    ProjectParticipantRepository(),
  );

  NotificationBloc notificationBloc = NotificationBloc(
    NotificationRepository(),
    UserRepository(),
    ProjectRepository(),
    AuthenticationRepository(),
  );

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      HomePage(homeBloc),
      const Scaffold(),
      NotificationPage(notificationBloc),
      const Scaffold(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        backgroundColor: AppColors.primaryWhite,
        type: BottomNavigationBarType.fixed,
        iconSize: 18,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(color: Colors.black),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: AppColors.primaryGray1,
            ),
            activeIcon: Icon(
              Icons.home,
              color: AppColors.primaryBlack1,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              color: AppColors.primaryGray1,
            ),
            activeIcon: Icon(
              Icons.book,
              color: AppColors.primaryBlack1,
            ),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: AppColors.primaryGray1,
            ),
            activeIcon: Icon(
              Icons.notifications,
              color: AppColors.primaryBlack1,
            ),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: AppColors.primaryGray1,
            ),
            activeIcon: Icon(
              Icons.person,
              color: AppColors.primaryBlack1,
            ),
            label: "Settings",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
