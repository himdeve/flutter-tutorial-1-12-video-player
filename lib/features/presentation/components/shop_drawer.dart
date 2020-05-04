import 'package:first_application/features/presentation/pages/portfolio/portfolio_page.dart';
import 'package:flutter/material.dart';

class ShopDrawer extends StatelessWidget {
  const ShopDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.blue),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _buildDrawerHeader(context),
            _buildPortfolioItem(context),
            _buildDivider(),
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _buildDrawerHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        'Himdeve Fashion',
        style: TextStyle(backgroundColor: Colors.black),
      ),
      accountEmail: Text(
        'info@himdeve.eu',
        style: TextStyle(backgroundColor: Colors.black),
      ),
      currentAccountPicture: GestureDetector(
        onTap: () => showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Himdeve Fashion'),
            content: Text(
                'To be a designer is a kind of art work. However, to proceed further, to develop a brand and to find a marketplace for the ideas, it is sometimes a struggle. But with a firm determination, love and passion, finally, at the end, a little wish may come true… And that wish is called the Himdeve. The brand designed to be successful.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          backgroundImage: NetworkImage(
              'https://himdeve.eu/wp-content/uploads/2019/04/logo_retina.png'),
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://himdeve.eu/wp-content/uploads/2019/04/himdeve_beach.jpg'),
        ),
      ),
    );
  }

  ListTile _buildPortfolioItem(BuildContext context) {
    return ListTile(
      title: Text(
        'Portfolio',
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        Icons.work,
        color: Colors.white,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pop();

        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PortfolioPage()),
        );
      },
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: Colors.white,
    );
  }
}
