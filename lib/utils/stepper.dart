import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class StepperReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.grey,
      home: new TestAppHomePage(),
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
    );
  }
}

class TestAppHomePage extends StatefulWidget {
  // const TestAppHomePage({this.comicCharacter});
  // final SuperHeros comicCharacter;
  @override
  TestAppHomePageState createState() => new TestAppHomePageState();
}

class TestAppHomePageState extends State<TestAppHomePage>
    with TickerProviderStateMixin {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: 20.0),child:
          MyTimeLine(),),
          MyMiddleTimeLine(),
          LastTimeLine()
        ],
      ),
    );
  }
}

class VerticalSeparator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.symmetric(vertical: 4.0),
        height: 60.0,
        width: 1.0,
        color: Colors.deepOrange
    );
  }
}

class MyTimeLine extends StatefulWidget{
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<MyTimeLine>{

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.symmetric(horizontal: 10.0),
      child: new Column(
        children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: 30.0,
                child: new Center(
                  child: new Stack(
                    children: <Widget>[
                      new Padding(padding: new EdgeInsets.only(left: 12.0,), child: new VerticalSeparator(),),
                      SizedBox(
                        height: 15,
                      ),
                      new Container(padding: new EdgeInsets.only(), child: new Icon(Icons.blur_circular,color: Colors.white, size: 23,), decoration: new BoxDecoration( color: new Color(0xff00c6ff),shape: BoxShape.circle),)
                    ],
                  ),
                ),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(left: 20.0),
                      child: new Text(
                        'Editing Proses',
                        style: new TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.deepOrange,
                          fontSize: 16.0
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(left: 20.0, top: 5.0),
                      child: new Text(
                        'Yesterday 11:25 ',
                        ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MyMiddleTimeLine extends StatefulWidget{
  @override
  _MyMiddleTimeLineState createState() => _MyMiddleTimeLineState();
}

class _MyMiddleTimeLineState extends State<MyMiddleTimeLine>{

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.symmetric(horizontal: 10.0),
      child: new Column(
        children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: 30.0,
                child: new Center(
                  child: new Stack(
                    children: <Widget>[
                      new Padding(padding: new EdgeInsets.only(left: 12.0,), child: new VerticalSeparator(),),

                      new Container(padding: new EdgeInsets.only(), child: new Icon(Icons.blur_circular,color: Colors.white,size: 23), decoration: new BoxDecoration( color: new Color(0xff00c6ff),shape: BoxShape.circle),)
                    ],
                  ),
                ),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(left: 20.0,),
                      child: new Text(
                        'Instalasi Proses',
                        style: new TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.deepOrange,
                          fontSize: 16.0
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(left: 20.0, top: 5.0),
                      child: new Text(
                        'Today 12:11',
                        ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


class LastTimeLine extends StatefulWidget{
  @override
  _LastTimeLineState createState() => _LastTimeLineState();
}

class _LastTimeLineState extends State<LastTimeLine>{

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.symmetric(horizontal: 10.0),
      child: new Column(
        children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: 30.0,
                child: new Center(
                  child: new Stack(
                    children: <Widget>[
                      // new Padding(padding: new EdgeInsets.only(left: 12.0), child: new VerticalSeparator(),),
                      new Container(padding: new EdgeInsets.only(), child: new Icon(Icons.blur_circular,color: Colors.white, size: 23), decoration: new BoxDecoration( color: new Color(0xff00c6ff),shape: BoxShape.circle),),

                    ],
                  ),
                ),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(left: 20.0),
                      child: new Text(
                        'Ready to Aired',
                        style: new TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.deepOrange,
                          fontSize: 16.0
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(left: 20.0, top: 5.0),
                      child: new Text(
                        'Today 12:55',
                        ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

