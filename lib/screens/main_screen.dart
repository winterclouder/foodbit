import 'dart:typed_data';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:food_bit/bloc/bottom_nav_bar_bloc.dart';
import 'package:food_bit/screens/home_screen.dart';
import 'package:food_bit/styles/theme.dart' as Style;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String barcode = '';
  Uint8List bytes = Uint8List(200);
  BottomNavBarBloc _bottomNavBarBloc;

  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
    barcode = '';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<NavBarItem>(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          switch (snapshot.data) {
            case NavBarItem.HOME:
              return HomeScreen(i: 1);
              break;
            case NavBarItem.NEAR:
              return _alertArea();
              break;
            case NavBarItem.CART:
              return _alertArea();
              break;
            case NavBarItem.ACCOUNT:
              return _settingArea();
              break;
            default:
              return Container();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return BottomNavigationBar(
              selectedFontSize: 10.0,
              unselectedFontSize: 10.0,
              selectedItemColor: Style.Colors.mainColor,
              unselectedItemColor: Style.Colors.titleColor,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              iconSize: 25.0,
              currentIndex: snapshot.data.index,
              onTap: _bottomNavBarBloc.pickItem,
              items: [
                BottomNavigationBarItem(
                    title: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text('Home', style: TextStyle(fontSize: 10))),
                    icon: Icon(
                      EvaIcons.homeOutline,
                      color: Style.Colors.titleColor,
                    ),
                    activeIcon: Icon(
                      EvaIcons.home,
                      color: Style.Colors.mainColor,
                    )),
                BottomNavigationBarItem(
                    title: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text('History', style: TextStyle(fontSize: 10))),
                    icon: Icon(
                      EvaIcons.clockOutline,
                      color: Style.Colors.titleColor,
                    ),
                    activeIcon: Icon(
                      EvaIcons.clock,
                      color: Style.Colors.mainColor,
                    )),
                BottomNavigationBarItem(
                    title: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text('Users', style: TextStyle(fontSize: 10))),
                    icon: Icon(
                      EvaIcons.heartOutline,
                      color: Style.Colors.titleColor,
                    ),
                    activeIcon: Icon(
                      EvaIcons.heart,
                      color: Style.Colors.mainColor,
                    )),
                BottomNavigationBarItem(
                    title: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text('Favourtie', style: TextStyle(fontSize: 10))),
                    icon: Icon(
                      EvaIcons.bellOffOutline,
                      color: Style.Colors.titleColor,
                    ),
                    activeIcon: Icon(
                      EvaIcons.bell,
                      color: Style.Colors.mainColor,
                    )),
              ]);
        },
      ),
    );
  }
}

Widget _alertArea() {
  return Center(
    child: Text(
      'Test Screen',
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.red,
        fontSize: 25.0
      )
    )
  );
}

Widget _settingArea() {
  return Center(
    child: Text(
      'Test Screen',
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.blue,
        fontSize: 25.0
      )
    )
  );
}

