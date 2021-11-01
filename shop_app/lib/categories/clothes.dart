import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../cart.dart';
import '../itemDetail.dart';
import '../itemDetailModel.dart';
import '../profilepage.dart';


class Clothes extends StatefulWidget {
  const Clothes({ Key? key }) : super(key: key);

  @override
  _ClothesState createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {


  static List<String> cloName = ['Black Denim', 'Denim Shirt', 'Floral Shirt', 'Grey Shirt' ,'Jeans', ' Plain Shirt', 'Trouser' , 'Women Coat'];
    static List<String> cloPrice = ['2000 Rs', '1500 Rs', '1000 Rs', '1000 Rs' ,'2000 Rs', ' 1500 Rs', '500 Rs' , '4000 Rs'];
  static List<String> cloImage = ['images/clothes/bdenim.jpg','images/clothes/denim.jpg','images/clothes/floral.jpg','images/clothes/greyshirt.jpg','images/clothes/jeans.jpg','images/clothes/plain.jpg','images/clothes/trouser.jpg','images/clothes/wcoat.jpg',];

  final List<ItemDetailModel> cloData = List.generate(cloName.length, (index) => ItemDetailModel('${cloName[index]}','${cloPrice[index]}', '${cloImage[index]}'));                            


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
                    'Clothes',
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
                    itemCount: cloData.length,
                    itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetail(itemDetailModel: cloData[index])));},
                  child: Card(child: Column(
                
                    
                    children: [
                      SizedBox(
                        width: 33.h,
                        height: 14.h,
                        child: Image.asset(cloImage[index],fit: BoxFit.fill,),
                      ),
                
                      
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        child: Column(
                          
                          children:[
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Text(cloName[index], style: TextStyle(fontSize: 2.h, fontWeight: FontWeight.bold), ),
                             ],
                           ),
                           Container(
                             
                             child: Row(
                               
                               children: [
                
                               Icon(Icons.attach_money_rounded,size: 3.h, color: Colors.green,),
                               Text(cloPrice[index],style: TextStyle(color: Colors.green,fontSize: 2.h), ),
                               
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
  }
}