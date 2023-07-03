import 'package:cihan/web/screens/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  final ScrollController _scrollController;

  TopBarContents(this.opacity, this._scrollController);

  @override
  _TopBarContentsState createState() =>
      _TopBarContentsState(this.opacity, this._scrollController);
}

class _TopBarContentsState extends State<TopBarContents> {
  double opacity;
  double subTotal = 0;
  double deliveryFee = 0;
  double exchangeRate = 0;

  bool select = true;

  _TopBarContentsState(this.opacity, this._scrollController);

  ScrollController _scrollController;

  final FocusNode _focusNode = FocusNode();
  void _handleKeyEvent(RawKeyEvent event) {
    var offset = _scrollController.offset;
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      setState(() {
        if (kReleaseMode) {
          print(offset);
          _scrollController.animateTo(offset - 20,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
        } else {
          _scrollController.animateTo(offset - 20,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      setState(() {
        if (kReleaseMode) {
          _scrollController.animateTo(offset + 20,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
        } else {
          _scrollController.animateTo(offset + 20,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.pageDown) {
      setState(() {
        if (kReleaseMode) {
          _scrollController.animateTo(offset + 250,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        } else {
          _scrollController.animateTo(offset + 250,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.pageUp) {
      setState(() {
        if (kReleaseMode) {
          _scrollController.animateTo(offset - 250,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        } else {
          _scrollController.animateTo(offset - 250,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        }
      });
    }
  }

  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
    if (_scrollPosition > 1) {
      setState(() {
        _animationWidth = 70;
      });
    }
    if (_scrollPosition == 0) {
      setState(() {
        _animationWidth = 0;
      });
    }
  }

  List buttons = [false, false, false, false];

  double _animationWidth = 0;

  @override
  void initState() {
    // TODO: implement initState

    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return RawKeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKey: _handleKeyEvent,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.height * 0.0),
          child: Container(
            width: screenSize.width,
            color: Colors.black,
            child: Row(
              children: [
                Container(
                  width: screenSize.width * 0.4,
                  child: Row(
                    children: [
                      Container(
                        width: screenSize.width * 0.15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // width: screenSize.width*0.05,
                          // height: screenSize.width*0.02,
                          child: Image.asset(
                            "assets/images/blacklogo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        child: Text("CIHAN \nTRANSLATION",
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 4,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                ),
                Container(
                  width: screenSize.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _scrollController.animateTo(screenSize.height * 0,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            });
                          },
                          onHover: (v) {
                            setState(() {
                              buttons[0] = v;
                            });
                          },
                          child: Center(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: buttons[0]
                                        ? Color.fromRGBO(255, 205, 17, 1)
                                        : Colors.black,
                                  )),
                              width: screenSize.width * 0.07,
                              height: screenSize.width * 0.02,
                              child: Center(
                                child: Text(
                                  "Home",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _scrollController.animateTo(
                                  screenSize.height * 0.9,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            });
                          },
                          onHover: (v) {
                            setState(() {
                              buttons[1] = v;
                            });
                          },
                          child: Center(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: buttons[1]
                                        ? Color.fromRGBO(255, 205, 17, 1)
                                        : Colors.black,
                                  )),
                              width: screenSize.width * 0.07,
                              height: screenSize.width * 0.02,
                              child: Center(
                                child: Text(
                                  "ABOUT US",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _scrollController.animateTo(
                                  screenSize.height * 1.7,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            });
                          },
                          onHover: (v) {
                            setState(() {
                              buttons[2] = v;
                            });
                          },
                          child: Center(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: buttons[2]
                                        ? Color.fromRGBO(255, 205, 17, 1)
                                        : Colors.black,
                                  )),
                              width: screenSize.width * 0.07,
                              height: screenSize.width * 0.02,
                              child: Center(
                                child: Text(
                                  "SERVICES",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _scrollController.animateTo(
                                  screenSize.height * 3.2,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            });
                          },
                          onHover: (v) {
                            setState(() {
                              buttons[3] = v;
                            });
                          },
                          child: Center(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: buttons[3]
                                        ? Color.fromRGBO(255, 205, 17, 1)
                                        : Colors.black,
                                  )),
                              width: screenSize.width * 0.07,
                              height: screenSize.width * 0.02,
                              child: Center(
                                child: Text(
                                  "CONTACT US",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: Container()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
