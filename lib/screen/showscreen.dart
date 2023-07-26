//@dart = 2.9
import 'package:flutter/material.dart';
import 'package:trogontest/screen/castshowscreen.dart';
import 'package:trogontest/screen/detaildscreen.dart';
import '../model/shows.dart';
import '../services/services.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key key}) : super(key: key);

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  List<Showes> showesdata = [];
  Future<List<Showes>> fetchShows() async{
    List<Showes> showlist = await Services.getshowsData();
    setState(() {
      showesdata = showlist;
    });
    return showesdata;
  }

  @override
  void initState() {
    super.initState();
    fetchShows();
  }

  @override
  Widget build(BuildContext context) {
    if(showesdata.isEmpty){
      return Container();
    }else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("SHOWS"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.skip_next),
              tooltip: "Cast by Show",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CastShowScreen()));
              },
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
          width: double.infinity,
          height: double.infinity,
          color: Colors.black12,
          child: GridView.builder(
              itemCount: showesdata.length,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetaildScreen(showesdata[index])));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 120,
                            width: 160,
                            child: Image.network(showesdata[index].image.original,fit: BoxFit.fill,)),
                        const SizedBox(height: 7,),
                        Text(showesdata[index].name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
      );
    }
  }
}
