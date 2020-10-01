import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/widgets/following_widget.dart';
import 'package:flutter_social_ui/widgets/post_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _PageController;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _PageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _tabController.addListener(() {
      setState(() {
        index = _tabController.index;
      });
      print(_tabController.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
          brightness: Brightness.light,
          title: Text(
            "FRENZY",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 34,
              fontWeight: FontWeight.w500,
              letterSpacing: 10,
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).primaryColor,
            labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            indicatorWeight: 3.0,
            tabs: [
              Tab(
                text: "Trending",
              ),
              Tab(
                text: "New",
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            FollowingWidget(),
            PostCarousel(
              pageController: _PageController,
              title: "Posts",
              posts: posts,
            ),
          ],
        ));
  }
}
