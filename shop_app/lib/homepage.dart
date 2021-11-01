import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/cart.dart';
import 'package:shop_app/categories/clothes.dart';
import 'package:shop_app/categories/electronics.dart';
import 'package:shop_app/categories/gaming.dart';
import 'package:shop_app/categories/grocery.dart';
import 'package:shop_app/categories/mobiles.dart';
import 'package:shop_app/categories/stationery.dart';
import 'package:shop_app/itemDetail.dart';
import 'package:shop_app/itemDetailModel.dart';
import 'package:shop_app/profilepage.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart'; 

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static List<String> itemName = ['Iphone 13', 'S21', 'Macbook', 'Coat' ,'Bag', 'Galaxy S21 Case', 'Sony LED TV' , 'Black Watch','Dualshock', 'Headphones', 'GTA 5', 'Mouse','Gala', ' Pepsi'];
  static List<String> itemPrice = ['200,000 Rs', '150,000 Rs', '150,000 Rs', '5000 Rs' ,'2000 Rs', '200 Rs', '100,000 Rs' , '50,000 Rs','40,000 Rs', '10,000 Rs', '5000 Rs', '2000 ','100 Rs', '150 Rs'];
  static List<String> url = ['images/iphone13.jpg', 
                             'images/s21.jpg','images/macbook.jpg','images/pcoat.jpg', 
                             'images/bag.jpg', 'images/case.jpg', 'images/tv.jpg' , 'images/watch.jpg','images/gaming/ds.jpg','images/gaming/gh.jpg','images/gaming/gta5.jpg','images/gaming/mouse.jpg','images/grocery/gala.jpg','images/grocery/pepsi.jpg'] ;
  final List<ItemDetailModel>  itemData = List.generate(
    itemName.length,
     (index) => ItemDetailModel('${itemName[index]}','${itemPrice[index]}', '${url[index]}'));


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
                    // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=profile)},
                    child: InkWell(
                      onTap : (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));},
                      child: ListTile(
                      title: Text('Profile',style: TextStyle(fontSize: 2.h),),
                      leading: Icon(Icons.person, size: 5.h,),
                                    ),
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

      //BODY
      body: SingleChildScrollView(
        child: Container(
          color: Colors.pink.shade50.withOpacity(0.2),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              //SLIDER
              CarouselSlider(
                  items: [
                    carouselItems(
                        'images/iphone13.jpg'),
                    carouselItems(
                        'images/s21.jpg'),
                    carouselItems(
                        'images/macbook.jpg')
                  ],
                  options: CarouselOptions(
                    height: 25.h,
                    autoPlay: true,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                  )),
      
              SizedBox(
                height: 2.h,
              ),
      
      
      
      
      
      
              //CATEGORIES TEXT
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    'More Categories',
                    style: TextStyle(
                      fontSize: 3.h,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
              ),
      
      
      
              SizedBox(
                height: 3.h,
              ),
      
      
      
              //CATEGORY SECTION
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell
                  ( onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Electronics()));},
                    child: categoryItems('Electronics', 'images/logo/electronics.png')),
                  InkWell(
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Clothes()));} ,
                    child: categoryItems('Clothes', 'images/logo/clothes.png')),
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Grocery()));},
                    child: categoryItems('Grocery', 'images/logo/grocery.png'))
                ],
              ),
              SizedBox(height: 1.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Gaming()));},
                    child: categoryItems('Gaming', 'images/logo/gaming.png',)),
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Mobile()));},
                    child: categoryItems('Mobiles', 'images/logo/mobile.png')),
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Stationery()));},
                    child: categoryItems('Stationery', 'images/logo/pen.png'))
                ],
      
              
              ),

              SizedBox(height: 4.h,),
      
              
      
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    'New Items',
                    style: TextStyle(
                      fontSize: 3.h,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
              ),
      
      
              
                Container(
                  margin: EdgeInsets.only(top: 4.h),
                  height: 140.h,
                  width: 48.h,
                  // color: Colors.blue,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: itemData.length,
                    itemBuilder: (context , index){
                      return  InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ItemDetail(itemDetailModel: itemData[index],)));

                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.h)
                          ),
                      
                          
                      
                      
                          child: Column(
                                        children: [
                        SizedBox(
                        
                          width: 33.h,
                          height: 13.h,
                          child: Image.asset(itemData[index].itemImage,fit: BoxFit.fill,),
                        ),
                      
                        SizedBox(height: 1.5.h,),
                        Column(children:[
                           Padding(
                             padding:  EdgeInsets.symmetric(horizontal: 1.h),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text(itemData[index].itemName, style: TextStyle(fontSize: 2.2.h, fontWeight: FontWeight.bold), ),
                               ],
                             ),
                           ),
                           Container(
                             padding: EdgeInsets.symmetric(horizontal:0.5.h ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                               Icon(Icons.attach_money_rounded,size: 3.h, color: Colors.green,),
                              
                               Text(itemPrice[index],style: TextStyle(fontSize: 2.h,color: Colors.green),),
                               SizedBox(width: 3.h,),
                               IconButton(onPressed: (){}, icon: Icon(Icons.favorite_rounded,color: Colors.red,))
                             ],),
                           )
                          ])
                                        ],
                                      ),                    
                                      ),
                      );
                    },
                  )
                  
                  
                ),
                     
            ],
          ),
        ),
      ),
    );
  }
}














Widget carouselItems(String imgURL) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: AssetImage(imgURL),
          fit: BoxFit.cover,
        )),
  );

}


Widget categoryItems(String catName,String iconPath){
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 1.5.h),
    child: Container(   
        height: 8.h,    
        width: 12.h,  
        decoration: BoxDecoration(  
          color: Colors.white,  
          borderRadius: BorderRadius.circular(20)   
        ), 
              child: Column(
                children: [
                  Image.asset(iconPath),
                  Text(catName)
                ],
              )
              


      ),
  );
}




