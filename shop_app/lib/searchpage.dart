
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/profilepage.dart';
import 'package:sizer/sizer.dart';

import 'cart.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       //APPBAR
       appBar: AppBar(
         actions: [Padding(
           padding:  EdgeInsets.only(right :1.5.h),
           child: InkWell(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart()));
             },
             child: Icon(Icons.shopping_cart_rounded)),
         )],
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'AshShop',
                style: TextStyle(color: Colors.white, fontSize: 2.5.h),
              ),
            ],
          )),


      //DRAWER
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent
              ),
              child: Column(
                children: [

                  ClipRRect(
                   
                    child: Image.asset(
                      
                      'images/logo/profile.png',
                      height: 10.h,
                      width: 10.h,

                      ),
                  
                  ),
                  Text('ASHIR'),

                ],
              ),

            ),

            Column(
              children: [
                     InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));},
                    child: ListTile(
                    title: Text('Profile',style: TextStyle(fontSize: 2.h),),
                    leading: Icon(Icons.person, size: 5.h,),
                                  ),
                  ),




                InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));},
                  child: ListTile(
                    title: Text('CART',style: TextStyle(fontSize: 2.h),),
                    leading: Icon(Icons.add_shopping_cart_rounded, size: 5.h,),
                  ),
                ),
                                                Divider(),
                InkWell(
                  onTap: (){FirebaseAuth.instance.signOut().then((value){
                      Navigator.pushNamedAndRemoveUntil(context, '/LogIn', (_) => false);
                                        }).catchError((e){print(e);});},
                  child: ListTile(
                    title: Text('SIGN OUT',style: TextStyle(fontSize: 2.h),),
                    leading: Icon(Icons.logout_outlined, size: 5.h,),
                  ),
                )
              ],
            )
          ],
        ),
      ),












        body: SingleChildScrollView(
          child: Container(
            height: 100.h,
          
          
            decoration: BoxDecoration(
              color: Colors.pinkAccent[50]
 
            ),
          
          
            child: Column(
              children: [


                              SizedBox(
                height: 2.h,
              ),
      
      
                          Container(
                margin: EdgeInsets.symmetric(horizontal: 2.h,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('SEARCH PRODUCTS',style: TextStyle(fontSize: 3.h,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
      
             


          //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<SEARCH BAR>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                Center(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 2.h),
                      
                      
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value){
                             if (value==""){
                                    print("BLANK SEARCH");
                                  }else{
                                   
                                  }
          
                          },
                          
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search_rounded,color: Colors.pink,),
                            hintText: "Search Products",
                            fillColor: Colors.pinkAccent[50],
                            filled: true,
                            border: OutlineInputBorder(
          
          
                              borderRadius: BorderRadius.circular(1.h),
                              borderSide: BorderSide(
                                color: Colors.pink,
                                width: 0.4.h
                              ),
                            ),
          
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1.h),
                              borderSide: BorderSide(
                                color: Colors.pink,
                                width: 0.4.h
                              ),
                            ),
          
                            enabledBorder :OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1.h),
                              borderSide: BorderSide(
                                color: Colors.pink,
                                width: 0.4.h,
                              )
                            )
                            
          
                            
                          ),
                        ),
                      )),
                ),
                SingleChildScrollView(
                  child: Container(
                    
                    height:50.h,
                    width: 50.h,
                    child: Image.asset("images/search.png") ,),
                )
              ],
            ),
          ),
        ));
  }
}
