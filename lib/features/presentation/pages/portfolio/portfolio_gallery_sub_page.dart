import 'dart:convert';

import 'package:first_application/features/presentation/components/portfolio_gallery_image_widget.dart';
import 'package:first_application/features/presentation/pages/portfolio/portfolio_gallery_detail_page.dart';
import 'package:flutter/material.dart';

class PortfolioGallerySubPage extends StatelessWidget {
  const PortfolioGallerySubPage({Key key}) : super(key: key);

  //* BUILD METHOD FOR CUSTOMSCROLLVIEW WITH SLIVERS (SLIVERGRID)

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadImagePaths(context),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<String>> imagePathsSnapshot,
      ) {
        if (imagePathsSnapshot.connectionState == ConnectionState.done &&
            imagePathsSnapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: _buildContent(imagePathsSnapshot.data),
              ),
            ],
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }

  //* SLIVERGRID

  SliverGrid _buildContent(List<String> imagePaths) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return PortfolioGalleryImageWidget(
            imagePath: imagePaths[index],
            onImageTap: () => Navigator.push(
              context,
              _createGalleryDetailRoute(imagePaths, index),
            ),
          );
        },
        childCount: imagePaths.length,
      ),
    );
  }

  Future<List<String>> _loadImagePaths(BuildContext context) async {
    final String manifestContentJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContentJson);

    return manifestMap.keys
        .where((String key) => key.contains('assets/images/'))
        .toList();
  }

  MaterialPageRoute _createGalleryDetailRoute(
      List<String> imagePaths, int index) {
    return MaterialPageRoute(
      builder: (context) => PortfolioGalleryDetailPage(
        imagePaths: imagePaths,
        currentIndex: index,
      ),
    );
  }
}
