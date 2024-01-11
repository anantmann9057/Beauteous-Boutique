import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;

class HomePageWeb extends ConsumerWidget{
  const HomePageWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Wrap(children: List.generate(3, (index) => IconButton(onPressed: (){}, icon: Icon(Icons.person))),),

        actions: List.generate(3, (index) => IconButton(onPressed: (){}, icon: Icon(Icons.person))),
      ),
      body: Column(children: [
       Expanded(child:  ExpandableCarousel(
         options: CarouselOptions(
           enlargeCenterPage: false,
           autoPlay: true,

           autoPlayInterval: const Duration(seconds: 2),
         ),
         items: [1,2,3,4,5].map((i) {
           return  Container(
               width: MediaQuery.of(context).size.width,
               height: context.heightPx,
               decoration: BoxDecoration(
                   color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
               ),
               child: Text('text $i', style: TextStyle(fontSize: 16.0),)
           );
         }).toList(),
       )),
        Expanded(child: GridView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: context.widthPx>600?3:2),children: List.generate(3, (index) => Container(
            width: MediaQuery.of(context).size.width,
            height: context.heightPx,
            decoration: BoxDecoration(
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
            ),
            child: Text('text $index', style: TextStyle(fontSize: 16.0),)
        )),))
      ],),
    );
  }

}