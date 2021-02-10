import 'package:flutter/material.dart';
import 'package:flutter_wisata/classes/data_wisata.dart';

class Detail extends StatefulWidget {
  final DataWisata dataWisata;

  const Detail({Key key, this.dataWisata}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  DataWisata _dataWisata;
  double _screenWith;

  @override
  void initState() {
    _dataWisata = widget.dataWisata;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _screenWith = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_dataWisata.title),
        backgroundColor: _dataWisata.materialColor,
      ),
      body: SafeArea(
          child: Stack(
            children: [
              Hero(
                tag: 'bg' + _dataWisata.title,
                child: Container(
                  color: _dataWisata.materialColor,
                ),
              ),
              Positioned(
                top: 0.0,
                left: 0.0,
                width: _screenWith,
                height: 230.0,
                child: Hero(
                  tag: 'img' + _dataWisata.title,
                  child: Image.asset(
                    _dataWisata.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                top: 250.0,
                left: 32.0,
                width: _screenWith - 64.0,
                child: Hero(
                  tag: 'title' + _dataWisata.title,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      _dataWisata.title,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: _dataWisata.materialColor.shade900),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 280.0,
                left: 32.0,
                width: _screenWith - 64.0,
                child: Hero(
                  tag: 'subtitle' + _dataWisata.subTitle,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      _dataWisata.subTitle,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}