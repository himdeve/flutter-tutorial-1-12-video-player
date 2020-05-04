import 'package:first_application/features/presentation/components/portfolio_sliver_app_bar.dart';
import 'package:first_application/features/presentation/delegates/sliver_persistent_header_delegate_impl.dart';
import 'package:first_application/features/presentation/pages/portfolio/portfolio_gallery_sub_page.dart';
import 'package:first_application/features/presentation/pages/portfolio/portfolio_tutorials_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class PortfolioPage extends StatefulWidget {
  PortfolioPage({Key key}) : super(key: key);

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with SingleTickerProviderStateMixin {
  final List<Tuple3> _pages = [
    Tuple3('Tutorials', PortfolioTutorialsSubPage(), Icon(Icons.video_library)),
    Tuple3('Gallery', PortfolioGallerySubPage(), Icon(Icons.image)),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            PortfolioSliverAppBar(_pages[_tabController.index].item1),
            SliverPersistentHeader(
              delegate: SliverPersistentHeaderDelegateImpl(
                tabBar: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  controller: _tabController,
                  tabs: _pages
                      .map<Tab>((Tuple3 page) => Tab(text: page.item1))
                      .toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: _pages.map<Widget>((Tuple3 page) => page.item2).toList(),
        ),
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.blue,
      //   child: TabBar(
      //     unselectedLabelColor: Colors.grey,
      //     labelColor: Colors.black,
      //     indicatorColor: Colors.black,
      //     controller: _tabController,
      //     tabs: _pages
      //         .map<Tab>((Tuple3 page) => Tab(
      //               text: page.item1,
      //               icon: page.item3,
      //             ))
      //         .toList(),
      //   ),
      // ),
    );
  }
}
