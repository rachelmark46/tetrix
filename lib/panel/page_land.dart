part of 'page_portrait.dart';

class PageLand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height - MediaQuery.of(context).viewInsets.vertical;
    var width = size.width;
    // var height = MediaQuery.of(context).size.height;
    // height -= MediaQuery.of(context).viewInsets.vertical;
    return SizedBox.expand(
      child: Container(
        color: BACKGROUND_COLOR,
       // child: Padding(
         // padding: MediaQuery.of(context).padding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
           // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    SystemButtonGroup(),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.05, // 5% of screen width for left padding
                        bottom: height * 0.05, // 5% of screen height for bottom padding
                      ),
                     // padding: const EdgeInsets.only(left: 40, bottom: 40),
                      child: DropButton(),
                    )
                  ],
                ),
              ),
              _ScreenDecoration(child: Screen.fromHeight(width * 0.4)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            children: <Widget>[
              SizedBox(height: height * 0.01),
              Align(
                alignment: Alignment.topRight, // Align to the top-right of the column
                // child: Padding(
                //  padding: const EdgeInsets.all(16.0), // Add padding for positioning
                child: AboutController(),
                // ),
              ),// 3% of screen height
              //AboutController(),
            // 5% of screen height
              SizedBox(height: height * 0.01),
              DirectionController(),
              SizedBox(height: height * 0.01),
              BottomActionBar(),
             // SizedBox(height: height * 0.05), /// 5% of screen height
            ],
              // Expanded(
              //   child: Column(
              //     children: <Widget>[
              //       Spacer(),
              //       DirectionController(),
              //       SizedBox(height: 30),
              //     ],
                ),
              ),
            ],
          ),
       // ),
      ),
    );
  }
}
