import 'package:cihan/main.dart';
import 'package:cihan/web/widgets/responsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class QUICK extends StatefulWidget {
  //final ScrollController _scrollController;

  // final double height;
  QUICK();

  @override
  State<QUICK> createState() => _QUICKState();
}

class _QUICKState extends State<QUICK> {
  ScrollController _scrollController = new ScrollController();
  bool? checkBox = false;

  // _QUICKState(this._scrollController);
  launchWhatsAppUri(String name, String price) async {
    final link = WhatsAppUnilink(
      phoneNumber: '+964-(750)4698524',
      text:
          "Hello Cihan Translation \nI am contacting you through your website, need your help about ( your question )",
    );

    await launchUrl(link.asUri());
  }

  final FocusNode _focusNode = FocusNode();

  double animationPosition = 0;
  double animationPosition2 = 0;

  TextEditingController textControllerName = new TextEditingController();
  TextEditingController textControllerEmail = new TextEditingController();
  TextEditingController textControllerPhone = new TextEditingController();
  TextEditingController textControllerSource = new TextEditingController();
  TextEditingController textControllerTarget = new TextEditingController();
  TextEditingController textControllerFeedback = new TextEditingController();

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

    // if (_scrollPosition > widget.height * 0.3) {
    //   setState(() {
    //     animationPosition = 0;
    //   });
    // } else {
    //   setState(() {
    //     animationPosition = widget.height * 0.2;
    //   });
    // }
    // if (_scrollPosition > widget.height * 0.15) {
    //   setState(() {
    //     animationPosition2 = 0;
    //   });
    // } else {
    //   setState(() {
    //     animationPosition2 = widget.height * 0.2;
    //   });
    // }
  }

  List postSlide = [], postName = [], postPrice = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return ResponsiveWidget.isSmallScreen(context)
        ? AnimatedContainer(
            duration: Duration(milliseconds: 100),
            curve: Curves.easeIn,
            width: screenSize.width * 0.95,
            height: screenSize.height * 0.85,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 205, 17, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Center(
                  child: Container(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: screenSize.width * 0.95,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "GET A FREE QUOTE  ",
                            style: TextStyle(
                              fontSize: 22,
                              letterSpacing: 1,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Cardo',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.0,
                              top: 10,
                              right: 20,
                            ),
                            child: Center(
                              child: Text(
                                "To receive a free quote, simply fill out the contact form below and one of our account managers will get in touch with you within 30 minutes! Alternatively, you can send your documents directly via email to  info@languagereach.com",
                                style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  // fontFamily: 'Cardo',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 1.0,
                                      right: 5,
                                    ),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: textControllerName,
                                      autofocus: false,
                                      onChanged: (value) {},
                                      onSubmitted: (value) {},
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        filled: false,
                                        hintStyle: new TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                        hintText: "Name",

                                        fillColor: Colors.white,
                                        // errorText: _isEditingEmail
                                        //     ? _validateEmail(textControllerEmail.text)
                                        //     : null,
                                        errorStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 2.0,
                                      right: 2,
                                    ),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: textControllerPhone,
                                      autofocus: false,
                                      onChanged: (value) {
                                        setState(() {});
                                        if (textControllerPhone.text
                                            .contains(".com")) {
                                        } else {}
                                      },
                                      onSubmitted: (value) {},
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        filled: false,
                                        hintStyle: new TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                        hintText: "Phone Number",
                                        fillColor: Colors.white,
                                        // errorText: _isEditingEmail
                                        //     ? _validateEmail(textControllerEmail.text)
                                        //     : null,
                                        errorStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 2.0,
                                      right: 2,
                                    ),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: textControllerEmail,
                                      autofocus: false,
                                      onChanged: (value) {
                                        setState(() {});
                                        if (textControllerEmail.text
                                            .contains(".com")) {
                                        } else {}
                                      },
                                      onSubmitted: (value) {},
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        filled: false,
                                        hintStyle: new TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                        hintText: "Email",
                                        fillColor: Colors.white,
                                        // errorText: _isEditingEmail
                                        //     ? _validateEmail(textControllerEmail.text)
                                        //     : null,
                                        errorStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 2.0,
                                      right: 2,
                                    ),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: textControllerSource,
                                      autofocus: false,
                                      onChanged: (value) {
                                        setState(() {});
                                        if (textControllerSource.text
                                            .contains(".com")) {
                                        } else {}
                                      },
                                      onSubmitted: (value) {},
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        filled: false,
                                        hintStyle: new TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                        hintText: "Source Language",
                                        fillColor: Colors.white,
                                        // errorText: _isEditingEmail
                                        //     ? _validateEmail(textControllerEmail.text)
                                        //     : null,
                                        errorStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 2.0,
                                      right: 2,
                                    ),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: textControllerTarget,
                                      autofocus: false,
                                      onChanged: (value) {
                                        setState(() {});
                                        if (textControllerTarget.text
                                            .contains(".com")) {
                                        } else {}
                                      },
                                      onSubmitted: (value) {},
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        filled: false,
                                        hintStyle: new TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                        hintText: "Target Language",
                                        fillColor: Colors.white,
                                        // errorText: _isEditingEmail
                                        //     ? _validateEmail(textControllerEmail.text)
                                        //     : null,
                                        errorStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 2.0,
                                      right: 2,
                                    ),
                                    child: TextField(
                                      maxLines: 5,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: textControllerFeedback,
                                      autofocus: false,
                                      onChanged: (value) {
                                        setState(() {});
                                        if (textControllerFeedback.text
                                            .contains(".com")) {
                                        } else {}
                                      },
                                      onSubmitted: (value) {},
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        filled: false,
                                        hintStyle: new TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                        hintText:
                                            "Tell Us more about what your need...",
                                        fillColor: Colors.white,

                                        // errorText: _isEditingEmail
                                        //     ? _validateEmail(textControllerEmail.text)
                                        //     : null,
                                        errorStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              onHover: (v) {
                                setState(() {});
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Center(
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeOut,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: true
                                              ? Color.fromRGBO(255, 205, 17, 1)
                                              : Colors.black,
                                        )),
                                    width: screenSize.width * 0.25,
                                    height: screenSize.width * 0.1,
                                    child: Center(
                                      child: Text(
                                        "Attache File",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10, right: 10, bottom: 10),
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Checkbox(
                                        checkColor:
                                            Color.fromRGBO(255, 205, 17, 1),
                                        activeColor: Colors.black,
                                        value: checkBox,
                                        onChanged: (value) {
                                          setState(() {
                                            checkBox = value;
                                          });
                                        }),
                                  ),
                                  Expanded(
                                    flex: 9,
                                    child: Text(
                                      "This form collects your name, email address and other contact details so our team can contact you regarding your translation requirements. We do not share your data with anyone. Please check our privacy policy to see how we manage your data.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 1,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Cardo',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              onHover: (v) {
                                setState(() {});
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Center(
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeOut,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: true
                                              ? Color.fromRGBO(255, 205, 17, 1)
                                              : Colors.black,
                                        )),
                                    width: screenSize.width * 0.25,
                                    height: screenSize.width * 0.1,
                                    child: Center(
                                      child: Text(
                                        "Send",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
            ),
          )
        : AnimatedContainer(
            duration: Duration(milliseconds: 100),
            curve: Curves.easeIn,
            width: screenSize.height * 0.8,
            height: screenSize.width * 0.45,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 205, 17, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Center(
                  child: Container(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: screenSize.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "GET A FREE QUOTE  ",
                            style: TextStyle(
                              fontSize: 22,
                              letterSpacing: 1,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Cardo',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.0,
                              top: 20,
                              right: 20,
                            ),
                            child: Center(
                              child: Text(
                                "To receive a free quote, simply fill out the contact form below and one of our account managers will get in touch with you within 30 minutes! Alternatively, you can send your documents directly via email to  info@languagereach.com ",
                                style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  // fontFamily: 'Cardo',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                    ),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: textControllerName,
                                      autofocus: false,
                                      onChanged: (value) {
                                        setState(() {});
                                        if (textControllerName.text
                                            .contains(".com")) {
                                        } else {}
                                      },
                                      onSubmitted: (value) {},
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        filled: false,
                                        hintStyle: new TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintText: "Name",
                                        fillColor: Colors.white,
                                        // errorText: _isEditingEmail
                                        //     ? _validateEmail(textControllerEmail.text)
                                        //     : null,
                                        errorStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                    ),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: textControllerPhone,
                                      autofocus: false,
                                      onChanged: (value) {
                                        setState(() {});
                                        if (textControllerPhone.text
                                            .contains(".com")) {
                                        } else {}
                                      },
                                      onSubmitted: (value) {},
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        filled: false,
                                        hintStyle: new TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintText: "Phone Number",
                                        fillColor: Colors.white,
                                        // errorText: _isEditingEmail
                                        //     ? _validateEmail(textControllerEmail.text)
                                        //     : null,
                                        errorStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                    ),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: textControllerEmail,
                                      autofocus: false,
                                      onChanged: (value) {
                                        setState(() {});
                                        if (textControllerEmail.text
                                            .contains(".com")) {
                                        } else {}
                                      },
                                      onSubmitted: (value) {},
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        filled: false,
                                        hintStyle: new TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintText: "Email",
                                        fillColor: Colors.white,
                                        // errorText: _isEditingEmail
                                        //     ? _validateEmail(textControllerEmail.text)
                                        //     : null,
                                        errorStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                    ),
                                    child: Container(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                    ),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: textControllerSource,
                                      autofocus: false,
                                      onChanged: (value) {
                                        setState(() {});
                                        if (textControllerSource.text
                                            .contains(".com")) {
                                        } else {}
                                      },
                                      onSubmitted: (value) {},
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        filled: false,
                                        hintStyle: new TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintText: "Source Language",
                                        fillColor: Colors.white,
                                        // errorText: _isEditingEmail
                                        //     ? _validateEmail(textControllerEmail.text)
                                        //     : null,
                                        errorStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                    ),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: textControllerTarget,
                                      autofocus: false,
                                      onChanged: (value) {
                                        setState(() {});
                                        if (textControllerTarget.text
                                            .contains(".com")) {
                                        } else {}
                                      },
                                      onSubmitted: (value) {},
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        filled: false,
                                        hintStyle: new TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintText: "Target Language",
                                        fillColor: Colors.white,
                                        // errorText: _isEditingEmail
                                        //     ? _validateEmail(textControllerEmail.text)
                                        //     : null,
                                        errorStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                    ),
                                    child: TextField(
                                      maxLines: 5,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: textControllerFeedback,
                                      autofocus: false,
                                      onChanged: (value) {
                                        setState(() {});
                                        if (textControllerFeedback.text
                                            .contains(".com")) {
                                        } else {}
                                      },
                                      onSubmitted: (value) {},
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        filled: false,
                                        hintStyle: new TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintText:
                                            "Tell Us more about what your need...",
                                        fillColor: Colors.white,

                                        // errorText: _isEditingEmail
                                        //     ? _validateEmail(textControllerEmail.text)
                                        //     : null,
                                        errorStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  onHover: (v) {
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                    ),
                                    child: Center(
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeOut,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color: true
                                                  ? Color.fromRGBO(
                                                      255, 205, 17, 1)
                                                  : Colors.black,
                                            )),
                                        width: screenSize.width * 0.07,
                                        height: screenSize.width * 0.02,
                                        child: Center(
                                          child: Text(
                                            "Attache File",
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
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 28.0, top: 20, right: 20, bottom: 20),
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Checkbox(
                                        checkColor:
                                            Color.fromRGBO(255, 205, 17, 1),
                                        activeColor: Colors.black,
                                        value: checkBox,
                                        onChanged: (value) {
                                          setState(() {
                                            checkBox = value;
                                          });
                                        }),
                                  ),
                                  Expanded(
                                    flex: 9,
                                    child: Text(
                                      "This form collects your name, email address and other contact details so our team can contact you regarding your translation requirements. We do not share your data with anyone. Please check our privacy policy to see how we manage your data.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 1,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Cardo',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 20.0,
                                right: 20,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeOut,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: true
                                                ? Color.fromRGBO(
                                                    255, 205, 17, 1)
                                                : Colors.black,
                                          )),
                                      width: screenSize.width * 0.07,
                                      height: screenSize.width * 0.02,
                                      child: Center(
                                        child: Text(
                                          "Send",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: 1,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
            ),
          );
  }
}
