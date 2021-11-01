import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/itemDetailModel.dart';
import 'package:shop_app/profilepage.dart';
import 'package:sizer/sizer.dart';


import 'cart.dart';


class ItemDetail extends StatelessWidget {
  final ItemDetailModel itemDetailModel;
  const ItemDetail({ Key? key ,required this.itemDetailModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(


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
        child: Column(
      
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      
      
            Padding(
                        padding:  EdgeInsets.symmetric(horizontal : 2.h, vertical: 3.h),
                        child: Container(
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.h),
                            color: Colors.white60,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 3,
                              )
                            ]
                          ),
                          height: 38.h,
                          child: Column(
                            
                                children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.h)
                                ),
                                child: Container(
                                  height: 25.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.h),
                                    color: Colors.blue,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(2.h),
                                    child: Image.asset(itemDetailModel.itemImage,fit: BoxFit.cover,),
                                  ),
                                  
                                ),
                              ),
      
                              
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 1.h,vertical: 2.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                         Text(itemDetailModel.itemName,style: TextStyle(fontSize: 2.5.h),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.attach_money_rounded,size: 2.5.h,color: Colors.green,),
                                              Text(itemDetailModel.itemPrice,style: TextStyle(fontSize: 2.h ,color: Colors.green),),
                                            ],
                                          )
                                      ],
                                    )
                                  ],
                                ),
                              )
                             
                            ],
                          ),
                        ),
                      ),

                 Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Column(
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 3.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

           



                       
                    ],
                  )
                ]),
              ),

      
                      SizedBox(height: 3.h,),
      
      
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.h,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.pink[50],
                                borderRadius: BorderRadius.circular(3.h)
                              ),
                              height: 8.h,
                              width: 16.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_shopping_cart_outlined, ),
                                  Text('Add to cart')
      
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
      
                      
      
      
            
          ],
        ),
      ),
    );
  }
}