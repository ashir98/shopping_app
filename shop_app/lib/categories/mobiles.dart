import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../cart.dart';
import '../itemDetail.dart';
import '../itemDetailModel.dart';
import '../profilepage.dart';


class Mobile extends StatefulWidget {
  const Mobile({ Key? key }) : super(key: key);

  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {



  
  static List<String> mobName = ['Galaxy A32', 'Galaxy A72', 'Iphone 13', 'IPhone X' ,'OnePlus 7', 'Oppo Reno 6', 'Galaxy S21' , 'Xiaomi 11 Pro'];
  static List<String> mobPrice = ['40,000 Rs', '70,000 Rs', '250,000 Rs', '200,000 Rs' ,'100,000 Rs', '100,000 Rs', '200,000 Rs' , '150,000 Rs'];
  static List<String> mobImage = ['images/mobiles/a32.jpg','images/mobiles/a72.jpg','images/mobiles/iphone13.jpg','images/mobiles/ipx.jpg','images/mobiles/oneplus.jpg','images/mobiles/oppo6.jpg','images/mobiles/s21.jpg','images/mobiles/xiaomi11.jpg',];

  final List<ItemDetailModel> mobData = List.generate(mobName.length, (index) => ItemDetailModel('${mobName[index]}','${mobPrice[index]}' ,'${mobImage[index]}'));                            


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
              children: [
          
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h,vertical: 3.h),
                child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    'Smart Phones',
                    style: TextStyle(
                      fontSize: 3.h,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
              ),
          
              SizedBox(height: 1.5.h,),
          
                Container(
                  height: 150.h,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
                    itemCount: mobData.length,
                    itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetail(itemDetailModel: mobData[index])));},
                  child: Card(child: Column(
                
                    
                    children: [
                      SizedBox(
                        width: 33.h,
                        height: 14.h,
                        child: Image.asset(mobImage[index],fit: BoxFit.fill,),
                      ),
                
                      
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        child: Column(
                          
                          children:[
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Text(mobName[index], style: TextStyle(fontSize: 2.h, fontWeight: FontWeight.bold), ),
                             ],
                           ),
                           Container(
                             
                             child: Row(
                               
                               children: [
                
                               Icon(Icons.attach_money_rounded,size: 3.h, color: Colors.green,),
                               Text(mobPrice[index],style: TextStyle(color: Colors.green,fontSize: 2.h), ),
                               
                               IconButton(onPressed: (){}, icon: Icon(Icons.favorite_rounded,color: Colors.red,))
                             ],),
                           )
                          ]),
                      )
                    ],
                  ),                    
                  ),
                );
                    },
                    
                    
                  )
                    
                  ),
                
          
          
              ],
            ),
          )

      
    );
}}