import 'package:flutter/material.dart';
import 'package:flutter_wisata/classes/data_wisata.dart';

import 'detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DataWisata> _dataWisata;
  double _screenWidgetAdjusment;

  @override
  void initState() {
    _dataWisata = DataWisata().createWisataList();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _screenWidgetAdjusment = MediaQuery.of(context).size.width - 48.0 - 64.0;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisata Bogor"),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemExtent: 180.0,
              itemCount: _dataWisata.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        fullscreenDialog: true,
                        transitionDuration: Duration(milliseconds: 1000),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return Detail(
                            dataWisata: DataWisata(
                                title: _dataWisata[index].title,
                                subTitle: _dataWisata[index].subTitle,
                                image: _dataWisata[index].image,
                                materialColor:
                                _dataWisata[index].materialColor),
                          );
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        }));
                  },
                  child: Card(
                    margin: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Hero(
                          tag: 'bg' + _dataWisata[index].title,
                          child: Container(
                            color: _dataWisata[index].materialColor,
                          ),
                        ),
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Hero(
                            tag: 'img' + _dataWisata[index].title,
                            child: Image.asset(
                              _dataWisata[index].image,
                              fit: BoxFit.fitWidth,
                              height: 80.0,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 96.0,
                          left: 32.0,
                          width: _screenWidgetAdjusment,
                          child: Hero(
                            tag: 'title' + _dataWisata[index].title,
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                _dataWisata[index].title,
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: _dataWisata[index]
                                        .materialColor
                                        .shade900),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 125.0,
                          left: 32.0,
                          width: _screenWidgetAdjusment,
                          child: Hero(
                            tag: 'subtitle' + _dataWisata[index].subTitle,
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                _dataWisata[index].subTitle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}