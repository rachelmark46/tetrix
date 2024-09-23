import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

class ImageGrid extends StatelessWidget {
  final List<GridItem> items = [
    GridItem(
      imagePath: 'assets/image2.png',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.rachelmark.sudoku',
      iosUrl: 'https://apps.apple.com/app/id1234567890',
    ),
    GridItem(
      imagePath: 'assets/image3.png',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.puzzlepixelstudio.snake_game',
      iosUrl: 'https://apps.apple.com/app/id0987654321',
    ),
    GridItem(
      imagePath: 'assets/image4.png',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.puzzlepixelstudio.rabbit_run',
      iosUrl: 'https://apps.apple.com/app/id1122334455',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Our Apps'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isLandscape ? 3 : 2, // Adjusts based on orientation
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _launchURL(items[index].androidUrl, items[index].iosUrl),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    items[index].imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _launchURL(String androidUrl, String iosUrl) async {
    String url = Platform.isAndroid ? androidUrl : iosUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class GridItem {
  final String imagePath;
  final String androidUrl;
  final String iosUrl;

  GridItem({
    required this.imagePath,
    required this.androidUrl,
    required this.iosUrl,
  });
}






// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class ImageGrid extends StatelessWidget {
//   final List<GridItem> items = [
// //GridItem(imagePath: 'assets/image1.png', linkUrl: 'https://example.com/page1'),
//     GridItem(imagePath: 'assets/image2.png', linkUrl: 'https://play.google.com/store/apps/details?id=com.rachelmark.sudoku'),
//     GridItem(imagePath: 'assets/image3.png', linkUrl: 'https://play.google.com/store/apps/details?id=com.puzzlepixelstudio.snake_game'),
//     GridItem(imagePath: 'assets/image4.png', linkUrl: 'https://play.google.com/store/apps/details?id=com.puzzlepixelstudio.rabbit_run'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Image Grid with Links')),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // 2 columns in the grid
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//           ),
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () => _launchURL(items[index].linkUrl),
//               child: Image.asset(
//                 items[index].imagePath,
//                 fit: BoxFit.cover,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   // Method to launch the URL
//   Future<void> _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
//
// class GridItem {
//   final String imagePath;
//   final String linkUrl;
//
//   GridItem({required this.imagePath, required this.linkUrl});
// }
