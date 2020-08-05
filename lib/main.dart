import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double currentIndex = 0;
  int totalCountForBottomPage = 678;
  int totalNoOfPages = 0;
  bool firstBox = true;
  bool secondBox = false;
  bool thirdBox = false;
  bool fourthBox = false;
  int selectedPage = 1;

  @override
  void initState() {
    super.initState();
    totalNoOfPages = checkDecimal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomBar"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                "Page no '$selectedPage' currently selected",
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            ),
          ),
          bottomBar(),
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Positioned(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  child: Icon(
                    Icons.arrow_left,
                    size: 48.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  if (totalNoOfPages > 4) {
                    if (fourthBox) {
                      highlightBox(3);
                      listViewToLoad(currentIndex.toInt() + 2);
                    } else if (thirdBox) {
                      highlightBox(2);
                      listViewToLoad(currentIndex.toInt() + 1);
                    } else if (secondBox) {
                      highlightBox(1);
                      listViewToLoad(currentIndex.toInt());
                    } else {
                      if (currentIndex != 0) {
                        currentIndex = currentIndex - 1;
                        listViewToLoad(currentIndex.toInt());
                      }
                    }
                  } else {
                    // when there are only two page
                    if (totalNoOfPages == 2) {
                      highlightBox(1);
                      listViewToLoad(currentIndex.toInt());
                    } else if (totalNoOfPages == 3) {
                      // when there are only three page
                      if (thirdBox) {
                        highlightBox(2);
                        listViewToLoad(currentIndex.toInt() + 1);
                      } else if (secondBox) {
                        highlightBox(1);
                        listViewToLoad(currentIndex.toInt());
                      }
                    } else if (totalNoOfPages == 4) {
                      // when there are only four page
                      if (fourthBox) {
                        highlightBox(3);
                        listViewToLoad(currentIndex.toInt() + 2);
                      } else if (thirdBox) {
                        highlightBox(2);
                        listViewToLoad(currentIndex.toInt() + 1);
                      } else if (secondBox) {
                        highlightBox(1);
                        listViewToLoad(currentIndex.toInt());
                      }
                    }
                  }

                  setState(() {});
                },
              ),
              Row(
                children: <Widget>[
                  (totalNoOfPages > 0)
                      ? GestureDetector(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: firstBox
                                        ? Colors.white
                                        : Colors.black)),
                            child: Text(
                              "${currentIndex.toInt() + 1}",
                              style: TextStyle(
                                  color:
                                      firstBox ? Colors.white : Colors.black),
                            ),
                          ),
                          onTap: () {
                            highlightBox(1);
                            listViewToLoad(currentIndex.toInt());
                            setState(() {});
                          },
                        )
                      : Text(""),
                  (totalNoOfPages > 1)
                      ? GestureDetector(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: secondBox
                                        ? Colors.white
                                        : Colors.black)),
                            child: Text(
                              "${currentIndex.toInt() + 2}",
                              style: TextStyle(
                                  color:
                                      secondBox ? Colors.white : Colors.black),
                            ),
                          ),
                          onTap: () {
                            highlightBox(2);
                            listViewToLoad(currentIndex.toInt() + 1);
                            setState(() {});
                          },
                        )
                      : Text(""),
                  (totalNoOfPages > 2)
                      ? GestureDetector(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: thirdBox
                                        ? Colors.white
                                        : Colors.black)),
                            child: Text(
                              (fourthBox ||
                                      thirdBox ||
                                      (currentIndex + 4 == totalNoOfPages) ||
                                      (totalNoOfPages == 3))
                                  ? "${currentIndex.toInt() + 3}"
                                  : "....",
                              style: TextStyle(
                                  color:
                                      thirdBox ? Colors.white : Colors.black),
                            ),
                          ),
                          onTap: () {
                            if (totalNoOfPages == 3 || totalNoOfPages == 4) {
                              highlightBox(3);
                              listViewToLoad(currentIndex.toInt() + 2);
                            } else if (totalNoOfPages > 4) {
                              if (currentIndex.toInt() + 4 == totalNoOfPages) {
                                highlightBox(3);
                                listViewToLoad(currentIndex.toInt() + 2);
                              }
                            }
                            setState(() {});
                          },
                        )
                      : Text(""),
                  (totalNoOfPages > 3)
                      ? GestureDetector(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: fourthBox
                                        ? Colors.white
                                        : Colors.black)),
                            child: Text(
                              "${totalNoOfPages}",
                              style: TextStyle(
                                  color:
                                      fourthBox ? Colors.white : Colors.black),
                            ),
                          ),
                          onTap: () {
                            if (totalNoOfPages > 4) {
                              currentIndex = (totalNoOfPages - 4).toDouble();
                              highlightBox(4);
                              listViewToLoad(totalNoOfPages - 1);
                            } else {
                              highlightBox(4);
                              listViewToLoad(3);
                            }
                            setState(() {});
                          },
                        )
                      : Text(""),
                ],
              ),
              GestureDetector(
                child: Container(
                  child: Icon(
                    Icons.arrow_right,
                    size: 48.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  if (totalNoOfPages > 4) {
                    if (currentIndex + 4 != totalNoOfPages) {
                      if (currentIndex + 3 != totalNoOfPages) {
                        currentIndex = currentIndex + 1;
                        listViewToLoad(
                          currentIndex.toInt() +
                              ((firstBox)
                                  ? 0
                                  : (secondBox)
                                      ? 1
                                      : (thirdBox) ? 2 : (fourthBox) ? 3 : 0),
                        );
                      }
                    } else {
                      if (currentIndex + 4 == totalNoOfPages) {
                        if (firstBox) {
                          highlightBox(2);
                          listViewToLoad(currentIndex.toInt() + 1);
                        } else if (secondBox) {
                          highlightBox(3);
                          listViewToLoad(currentIndex.toInt() + 2);
                        } else if (thirdBox) {
                          highlightBox(4);
                          listViewToLoad(currentIndex.toInt() + 3);
                        }
                      }
                    }
                  } else {
                    if (totalNoOfPages == 2) {
                      highlightBox(2);
                      listViewToLoad(currentIndex.toInt() + 1);
                    } else if (totalNoOfPages == 3) {
                      if (firstBox) {
                        highlightBox(2);
                        listViewToLoad(currentIndex.toInt() + 1);
                      } else if (secondBox) {
                        highlightBox(3);
                        listViewToLoad(currentIndex.toInt() + 2);
                      }
                    } else if (totalNoOfPages == 4) {
                      if (firstBox) {
                        highlightBox(2);
                        listViewToLoad(currentIndex.toInt() + 1);
                      } else if (secondBox) {
                        highlightBox(3);
                        listViewToLoad(currentIndex.toInt() + 2);
                      } else if (thirdBox) {
                        highlightBox(4);
                        listViewToLoad(currentIndex.toInt() + 3);
                      }
                    }
                  }
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  highlightBox(int boxVal) {
    firstBox = (boxVal == 1) ? true : false;
    secondBox = (boxVal == 2) ? true : false;
    thirdBox = (boxVal == 3) ? true : false;
    fourthBox = (boxVal == 4) ? true : false;
  }

  checkDecimal() {
    String decimalCheck = (totalCountForBottomPage / 10).toString();
    var returnValue;
    if (decimalCheck.contains(".")) {
      if (totalCountForBottomPage % 10 == 0) {
        returnValue = totalCountForBottomPage ~/ 10;
      } else {
        returnValue = totalCountForBottomPage ~/ 10 + 1;
      }
    } else {
      returnValue = totalCountForBottomPage ~/ 10;
    }
    return returnValue;
  }

  void listViewToLoad(int index) {
    selectedPage = index + 1;
  }
}
