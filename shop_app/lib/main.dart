import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/searchpage.dart';
import 'package:shop_app/signup.dart';
import 'package:sizer/sizer.dart';

import 'favourites.dart';
import 'homepage.dart';
import 'login.dart';
import 'profilepage.dart';

void main() async{

   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(

    

      debugShowCheckedModeBanner: false,
      home: LogIn(),
      routes: {
      '/SignUp':(_)=>SignUp(),
      '/LogIn':(_)=>LogIn(),
      '/Home': (_)=>HomePage(),
      '/ShopApp':(_)=>MyShoppingApp()
      },
    )
  );
}

class MyShoppingApp extends StatefulWidget {
  

  @override
  _MyShoppingAppState createState() => _MyShoppingAppState();
}

class _MyShoppingAppState extends State<MyShoppingApp> {
  int currentIndex=0;
  final screens=[

    HomePage(),
    SearchPage(),
    FavouritesPage(),
    ProfilePage()


  ];



  Widget build(BuildContext context) {
    return Sizer(builder: (context,orientation, deviceType){
      return Scaffold(

        


        body: IndexedStack(
          index: currentIndex,
          children: screens,) ,

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.pinkAccent,

          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap:(index)=> setState(()=>currentIndex = index,),

          

          items: [
             BottomNavigationBarItem(
              icon: Icon(Icons.home, ),
              label: "Home",
              
      
            ),


             BottomNavigationBarItem(
              icon: Icon(Icons.search, ),
              label: "Search",
              
       
            ),


            BottomNavigationBarItem(
              icon: Icon(Icons.favorite,),
              label: "Favourites",
              
              
            ),


             BottomNavigationBarItem(
              
              icon: Icon(Icons.person, ),
              label: "Profile",
              
              
            ),
          ],
        ),


      );
    },);
  }
}
