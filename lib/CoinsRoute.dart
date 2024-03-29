import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoinsRoute extends StatefulWidget {
  @override
  _CoinsRouteState createState() => _CoinsRouteState();
}

class _CoinsRouteState extends State<CoinsRoute> {
  var coins = 16680;
  var _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> pages = <String, Widget>{
      '我的任务': ListView.builder(
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return Text("$index");
        },
      ),
      '排行榜': new Center(
        child: new Text('Shared not implemented'),
      ),
    };

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              constraints:
                  BoxConstraints(minWidth: double.infinity, minHeight: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF00AAFF), Color(0xFF0085FF)],
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    left: 0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                      child: Image(
                        image: AssetImage("images/ic_back.webp"),
                        height: 18,
                        width: 18,
                      ),
                    ),
                  ),
                  Text(
                    "我的房屋币",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "规则",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints.tightForFinite(
                width: double.infinity,
                height: 208,
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      constraints: BoxConstraints.tightForFinite(
                        width: double.infinity,
                        height: 158,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF00AAFF), Color(0xFF0085FF)],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 158,
                    child: Container(
                      constraints: BoxConstraints.tightForFinite(
                        width: double.infinity,
                        height: 50,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    top: 24,
                    left: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          coins.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          constraints: BoxConstraints.tightFor(width: 100),
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "房屋币明细",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              Image(
                                  width: 7,
                                  height: 13,
                                  image: AssetImage(
                                      "images/ic_coins_forward.webp"),
                                  color: Colors.white)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 62,
                    right: 22,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.white, width: 0.5)),
                      child: Row(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Image(
                                  width: 16,
                                  height: 14,
                                  image:
                                      AssetImage("images/ic_coins_shop.webp"))),
                          Text(
                            "商城",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: CustomTabBar(
                        pageController: _pageController,
                        pageNames: pages.keys.toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: pages.values.toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabBar extends AnimatedWidget {
  CustomTabBar({this.pageController, this.pageNames})
      : super(listenable: pageController);

  final PageController pageController;
  final List<String> pageNames;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(pageNames.length, (int index) {
          return Expanded(
              child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: RawMaterialButton(
                child: Text(pageNames[index]),
                onPressed: () {
                  pageController.animateToPage(
                    index,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                  );
                }),
          ));
        }),
      ),
    );
  }
}
