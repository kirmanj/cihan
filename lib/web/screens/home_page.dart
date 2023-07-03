import 'package:cihan/main.dart';
import 'package:cihan/quick.dart';
import 'package:cihan/web/widgets/responsive.dart';
import 'package:cihan/web/widgets/top_bar_contents.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

List products = [];
List<String> itemCodeL = [];

List<String> barcodeL = [];
List<int> indexs = [];
List<String> searchTerm = [];

class _HomePageState extends State<HomePage> {
  _sendPDFByMail() async {}

  late ScrollController _scrollController = ScrollController();

  TextEditingController textControllerName = new TextEditingController();
  TextEditingController textControllerEmail = new TextEditingController();
  TextEditingController textControllerPhone = new TextEditingController();
  TextEditingController textControllerSource = new TextEditingController();
  TextEditingController textControllerTarget = new TextEditingController();
  TextEditingController textControllerFeedback = new TextEditingController();

  double _scrollPosition = 0;
  double _animationWidth = 0;
  double _opacity = 0;

  final _formKey = GlobalKey<FormState>();
  launchWhatsAppUri() async {
    print("Krmanj");
    final link = WhatsAppUnilink(
      phoneNumber: '+964-(750)4698524',
      text:
          "Hello Cihan Translation \nI am contacting you through your website, need your help about ( your question )",
    );
    print(link);
    await launchUrl(link.asUri());
  }

  List images = [];
  List slideImages = [];
  List _isHovering = [];
  List _isSelected = [];
  List<Map> brands = [];

  final FocusNode _focusNode = FocusNode();
  void _handleKeyEvent(RawKeyEvent event) {
    var offset = _scrollController.offset;
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      setState(() {
        if (kReleaseMode) {
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

  bool floatShow = false;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
    if (_scrollPosition > 700) {
      ResponsiveWidget.isSmallScreen(context)
          ? setState(() {
              floatShow = true;
            })
          : setState(() {
              _animationWidth = 70;
            });
    } else {
      ResponsiveWidget.isSmallScreen(context)
          ? setState(() {
              floatShow = false;
            })
          : setState(() {
              _animationWidth = 70;
            });
    }
    if (_scrollPosition == 0) {
      setState(() {
        _animationWidth = 0;
      });
    }
  }

  final List<String> imageSlide = [
    'assets/images/offer2.jpg',
    'assets/images/offer1.jpg',
    'assets/images/offer4.jpg',
  ];

  bool textAnimation = false;
  bool quickAnimi = true;
  bool? checkBox = false;
  bool whatsapp = false;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);

    Future.delayed(Duration(milliseconds: 300)).whenComplete(() {
      setState(() {
        textAnimation = true;
      });
    });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(


      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              centerTitle: true,
              title: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // width: screenSize.width*0.05,
                      height: screenSize.width * 0.1,
                      child: Image.asset(
                        "assets/images/blacklogo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text("   CIHAN TRANSLATION"),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, screenSize.height * 0.08),
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: screenSize.width,
                height: screenSize.height * 0.6,
                color: _animationWidth != 70 ? Colors.black : Colors.black,
                child: TopBarContents(_opacity, _scrollController),
              ),
            ),
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: RawKeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKey: _handleKeyEvent,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: SizedBox(
                            height: screenSize.height,
                            width: screenSize.width,
                            child: Image.asset(
                              'assets/images/walpper.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: screenSize.height,
                          width: screenSize.width,
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          child: Center(child: Text(" ")),
                        ),
                        Positioned(
                          top: screenSize.height * 0.425,
                          left: screenSize.width * 0.1,
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: textAnimation
                                ? screenSize.height * 0.1
                                : screenSize.height * 0.23,
                            child: AnimatedOpacity(
                              duration: Duration(seconds: 1),
                              opacity: textAnimation ? 1 : 0.0,
                              child: Row(
                                children: [
                                  Text(
                                    " WE   ",
                                    style: TextStyle(
                                      fontSize: 42,
                                      color: Color.fromRGBO(255, 205, 17, 1),
                                      fontFamily: 'Cardo',
                                    ),
                                  ),
                                  Text(
                                    "TRANSLATE  ",
                                    style: TextStyle(
                                      fontSize: 42,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(255, 205, 17, 1),
                                      fontFamily: 'Cardo',
                                    ),
                                  ),
                                  Text(
                                    "YOUR    LANGUAGE",
                                    style: TextStyle(
                                      fontSize: 42,
                                      color: Color.fromRGBO(255, 205, 17, 1),
                                      fontFamily: 'Cardo',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: screenSize.width * 0.03,
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                print("Krmanj");
                                launchWhatsAppUri();
                              },
                              onHover: (val) {
                                setState(() {
                                  whatsapp = val;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeIn,
                                width: screenSize.width * 0.05,
                                height: screenSize.height * 0.06,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Color.fromRGBO(255, 205, 17, 1)),
                                  color: Color.fromRGBO(255, 205, 17, 1),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15),
                                  ),
                                ),
                                child: Padding(
                                  padding: whatsapp
                                      ? EdgeInsets.all(2)
                                      : EdgeInsets.all(5),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Image.asset(
                                        'assets/images/whatsappb.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: quickFull
                              ? screenSize.height * 0.02
                              : screenSize.height * 0.0,
                          right: screenSize.width * 0.10,
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  quickFull = !quickFull;
                                });
                              },
                              onHover: (val) {
                                setState(() {
                                  quickAnimi = val;
                                  print(val);
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeIn,
                                width: screenSize.width * 0.1,
                                height: quickAnimi
                                    ? screenSize.height * 0.065
                                    : screenSize.height * 0.06,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Color.fromRGBO(255, 205, 17, 1)),
                                  color: quickFull
                                      ? Colors.black
                                      : Color.fromRGBO(255, 205, 17, 1),
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(quickFull ? 0 : 15),
                                    topLeft:
                                        Radius.circular(quickFull ? 0 : 15),
                                    bottomLeft:
                                        Radius.circular(quickFull ? 15 : 0),
                                    bottomRight:
                                        Radius.circular(quickFull ? 15 : 0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      quickFull ? "CLOSE" : "QUICK QUOTE",
                                      style: TextStyle(
                                        fontSize: 18,
                                        letterSpacing: 1,
                                        color: quickFull
                                            ? Color.fromRGBO(255, 205, 17, 1)
                                            : Colors.black,
                                        fontFamily: 'Cardo',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: screenSize.height * 0.075,
                            right: screenSize.width * 0.0,
                            child: quickFull ? QUICK() : Container()),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget remindButton = TextButton(
      child: Text("Remind me later"),
      onPressed: () {},
    );
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
    Widget launchButton = TextButton(
      child: Text("Launch missile"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Notice"),
      content: Text(
          "Launching this missile will destroy the entire universe. Is this what you intended to do?"),
      actions: [
        remindButton,
        cancelButton,
        launchButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
