import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:testapp/services/api_services.dart';
import 'package:testapp/utils/colors.dart';


class CategoryProduct extends StatefulWidget {
  CategoryProduct({Key key}) : super(key: key);

  @override
  _ProductCategoryState createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<CategoryProduct>{
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";
  final iconColor = HexColor("#DEDEDD");



  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
            elevation: 20.0,
            child: ListView(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              children: <Widget>[
                SafeArea(
                  child: Container(
                    height: MediaQuery.of(context).size.height,

                  ),
                )
              ],
            )),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: _isSearching
              ? _buildSearchField()
              : Container(
                  child:
                      Text("Damri"),
                ),
          actions: _buildActions(),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 3,
                  color: HexColor("69D2E7"),
                ),
                Container(
                  height: 8,
                  color: Colors.white,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                              child: Container(
                                width: 60,
                                height: 25,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "SORT",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey[700]),
                                      ),
                                      Icon(
                                        MaterialCommunityIcons
                                            .unfold_more_horizontal,
                                        color: Colors.grey[400],
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () => _sort(context)),
                          InkWell(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 16.0),
                                child: Icon(
                                  AntDesign.filter,
                                  color: Colors.grey,
                                  size: 19,
                                )),
                            onTap: () =>
                                _scaffoldKey.currentState.openEndDrawer(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 8,
                  color: Colors.white,
                ),


                Container(
                  height: MediaQuery.of(context).size.height -250,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder:  (context, int index )
                   {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  
                                  Text("Kubu Raya "+ index.toString(), style: TextStyle(color:Colors.grey),),
                                ],
                              ),
                              Text("Terminal antarnegara ambarang" + index.toString())


                            ],
                          ),
                        ),
                      )
                    ],
                    );

                  })  
                )
           
              ],
            )
          ],
        ));
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
          hintText: "Search Product...",
          border: InputBorder.none,
          hintStyle: TextStyle(
              color: Colors.white30,
              fontSize: 14,
              fontWeight: FontWeight.bold)),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery,
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    

    return <Widget>[
      IconButton(
        icon: Icon(
          Icons.search,
          color: iconColor,
        ),
        onPressed: _startSearch,
      ),
    ];
  }

  

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }


  }

  _sort(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      "SORT",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Terlaris",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Termurah",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Termahal",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Rate Tertinggi",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          );
        });
  }


  
