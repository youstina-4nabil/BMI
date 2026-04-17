import 'dart:math';

import 'package:bmi_calc/result.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool ismale = true;
  double height = 160;
  double weight = 60;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI CALCULATOR",), centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(child:

      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          Expanded(
            child: Row(

              children: [expandedCard("Male"),
                SizedBox(width: 20,),
                expandedCard("Female")
              ],


            ),
          ),
          SizedBox(height: 20,),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey
                ),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Height",style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toStringAsFixed(0),style: Theme
                            .of(context)
                            .textTheme
                            .headlineLarge
                        ),
                        Text(" CM",style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    Slider(value: height,
                        activeColor: Colors.teal,
                        thumbColor: Colors.teal,
                        inactiveColor: Colors.black,
                        min: 90,max: 220,
                        onChanged:(val){
                      setState(() {
                        height=val;
                      });

                    })

                  ],
                ),

              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [expandedCard2("Weight"),
                SizedBox(width: 20,),
                expandedCard2("Age")
              ],


            ),
          )
          ,
        ],
      ),

      ),
      bottomNavigationBar: Container(

        color: Colors.teal,
        width: double.infinity,
        height: MediaQuery.of(context).size.height/20,
        child: TextButton(onPressed: (){
          double res=weight/pow(height/100,2);
          Navigator.push(context, MaterialPageRoute(builder: (context){
           return Result(ismale: ismale ,result: res,age: age);

          }
          )
          );
        }, child: Text("Calculate",style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black

        ),
        ),
        ),
      ),
    );
  }

  Widget expandedCard(String type) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () {
            setState(() {
              ismale = (type == "Male") ? true : false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: (ismale && type == 'Male') || (!ismale && type == 'Female')
                  ? Colors.teal
                  : Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  color: Colors.white,
                  type == "Male" ? (Icons.male ): Icons.female,
                  size: 80,
                ),
                SizedBox(height: 15),
                Text("$type", style:  Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget expandedCard2(String type) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(

          child: Container(

            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (type == 'Weight') ? Text("Weight", style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium, textAlign: TextAlign.center,) : Text(
                    "Age", style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium, textAlign: TextAlign.center),
                SizedBox(height: 10,),
                (type == 'Weight') ? Text("$weight", style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge, textAlign: TextAlign.center,) : Text(
                    "$age", style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge, textAlign: TextAlign.center),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.teal,
                      heroTag: type == "Weight" ? "Weight++" : "Age++",
                      onPressed: () {
                        setState(() {
                          (type == "Weight") ? weight++ : age++;
                        },);
                      },
                      child: const Icon(Icons.add, color: Colors.black,),
                      mini: true,
                    ),
                    SizedBox(width: 10,),
                    FloatingActionButton(
                      backgroundColor: Colors.teal,
                      heroTag: type == "Age" ? "Age--" : "height--",
                      onPressed: () {
                        setState(() {
                          (type == "Age") ? age-- : weight--;
                        }
                        );
                      },
                      mini: true,
                      child: const Icon(Icons.remove, color: Colors.black,),

                    )
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }



}





