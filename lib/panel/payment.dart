import 'package:flutter/material.dart';
import 'package:flutter_donation_buttons/donationButtons/buyMeACoffeeButton.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      titlePadding: EdgeInsets.zero,
      title: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Help Us Help Others',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Your generous donations help us continue developing apps. '
                          'With your support, we can work more efficiently to build better features and improve the quality of our apps. '
                          'Every little contribution makes a huge difference. Thank you for being part of our journey!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              const BuyMeACoffeeButton(
                text: "Continue..",
                buyMeACoffeeName: "rachelmark",
                color: BuyMeACoffeeColor.Green,
              ),
              SizedBox(height: 20),
            ],
          ),
          // Close Button at the top right corner
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 14.0,
                  backgroundColor: Colors.grey[200],
                  child: Icon(Icons.close, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
//   import 'package:flutter/material.dart';
// import 'package:flutter_donation_buttons/donationButtons/buyMeACoffeeButton.dart';
//
//   class PaymentPage extends StatelessWidget {
//     @override
//     Widget build(BuildContext context) {
//       return AlertDialog(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10)),
//           backgroundColor: Colors.white,
//           title: Center(
//             // return Scaffold(
//             // appBar: AppBar(
//             // title: Text('Support Us'),
//             // backgroundColor: Colors.green,
//             // ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 // Title and appeal
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Help Us Help Others',
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         'Your generous donations help us continue developing apps. '
//                             'With your support, we can work more efficiently to build better features and improve the quality of our apps. '
//                             'Every little contribution makes a huge difference. Thank you for being part of our journey!',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(height: 20),
//                 // BuyMeACoffee Button
//                 const BuyMeACoffeeButton(
//                   text: "Continue..",
//                   buyMeACoffeeName: "rachelmark",
//                   color: BuyMeACoffeeColor.Green,
//                 ),
//
//                 SizedBox(height: 20),
//
//         Positioned(
//           right: 0.0,
//           child: GestureDetector(
//             onTap: (){
//               Navigator.of(context).pop();
//             },
//             child: Align(
//               alignment: Alignment.topRight,
//               child: CircleAvatar(
//                 radius: 14.0,
//                 backgroundColor: Colors.white,
//                 child: Icon(Icons.close, color: Colors.black),
//               ),
//             ),
//           ),
//         ),
//               ],
//             ),
//             // );
//           )
//       );
//     }
//   }
