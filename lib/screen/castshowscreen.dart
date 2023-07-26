//@dart = 2.9
import 'package:flutter/material.dart';
import '../model/cast.dart';
import '../services/services.dart';

class CastShowScreen extends StatefulWidget {
  const CastShowScreen({Key key}) : super(key: key);

  @override
  State<CastShowScreen> createState() => _CastShowScreenState();
}

class _CastShowScreenState extends State<CastShowScreen> {
  List<Cast> castData = [];
  Future<List<Cast>> fetchCast() async{
    List<Cast> showlist = await Services.getcastData();
    setState(() {
      castData = showlist;
    });
    return castData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("SHOWS"),
        ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
        primary: false,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount:castData.length ,
          itemBuilder: (BuildContext ctxt, int index){
            return Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                        height: 100,
                        width: 80,
                        child: Image.network(castData[index].person.image.original,fit: BoxFit.fill,)),
                    const SizedBox(width: 13,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(castData[index].person.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        const SizedBox(height: 4,),
                        Text(castData[index].person.country.name.toString(),style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14),),
                        const SizedBox(height: 4,),
                        Text(castData[index].person.birthday.toString(),style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
      ),
    );
  }
}
