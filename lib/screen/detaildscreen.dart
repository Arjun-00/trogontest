//@dart = 2.9
import 'package:flutter/material.dart';
import '../model/shows.dart';

class DetaildScreen extends StatelessWidget {
  Showes showes;
   DetaildScreen(Showes showesdata, {Key key}) : super(key: key){
      this.showes = showesdata;
   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("SHOWS"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
        width: double.infinity,
        height:  double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(showes.image.original,fit: BoxFit.fill,)),
            const SizedBox(height: 15,),
            Text(showes.name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
            const SizedBox(height: 8,),
            Text(showes.language.toString(),style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
            const SizedBox(height: 8,),
            Text("Runtime : ${showes.runtime.toString()}",style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
            const SizedBox(height: 8,),
            Text("Rating : ${showes.rating.average}",style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
          ],
        ),
      ),
    );
  }
}
