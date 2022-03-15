import 'package:fifth/user.dart';
// import 'package:Tulips/screens/sign_up/edit_profile.dart';
import 'package:fifth/widgets/navigation_bar.dart';
import 'package:fifth/database.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
// import '../hello/hello.dart';

import 'package:flutter/material.dart';
// import '../posting/posting.dart';
// import '../explore/explore.dart';

class View extends StatefulWidget {
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  PageController _pageController = PageController();
  List<Widget> _screens = [];
  // void _onPageChanged(int index) {}

  @override
  Widget build(BuildContext context) {
    Widget _tingz() {
      return Scaffold(
        // appBar: AppBar(
        //   title: Text('looking at view for (eventually add username here)'),
        // ),
        body: PageView(
          controller: _pageController,
          children: _screens,
          // onPageChanged: _onPageChanged,
        ),
        bottomNavigationBar: NavBar(
          pageController: _pageController,
        ),
      );
    }

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('looking at view for (eventually add username here)'),
    //   ),
    //   body: PageView(
    //     controller: _pageController,
    //     children: _screens,
    //     // onPageChanged: _onPageChanged,
    //   ),
    //   bottomNavigationBar: NavBar(
    //     pageController: _pageController,
    //   ),
    // );
    User pro = Provider.of<User>(context);
    return FutureProvider.value(
      value: DatabaseService().userFromUID(pro.uid),
      child: _tingz(),
    );
  }

  // Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  //   return GestureDetector(
  //       onTap: () => StockInfo(document), child: Text('view screen'));
  // }

  Widget _list(BuildContext context, int id) {
    List<Widget> options = <Widget>[
      // Hello(),
      // Explore(),
      // NewPost(),
      // EditProfile()
    ];

    return options[id];
  }
}
