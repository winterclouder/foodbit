import 'package:flutter/material.dart';
import 'package:food_bit/model/food.dart';

class FoodList extends StatelessWidget {
    final foodItems = <Food>[
    Food(
      title: "Jimmy's Steak",
      price: "34.00",
      img: 'assets/icons/foods/food5.jpg',
      rating: "4.2"
    ),
    Food(
      title: "Butter Steak",
      price: "45.00",
      img: 'assets/icons/foods/food6.jpg',
      rating: "4.2"
    ),
    Food(
      title: "Sushi",
      price: "10.00",
      img: 'assets/icons/foods/food7.jpg',
      rating: "4.7"
    )
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: foodItems.asMap().map((key, value) => MapEntry(
        key,
        _foodWidget(key,value)
        )).values.toList(),
    );
  }
}
Widget _foodWidget(int index, Food food) {

  return GestureDetector(
    onTap: () {},
    child: Padding(
      padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 20.0),
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color:Colors.grey[300], width:1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: <Widget>[
              Container(
                height:180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(10), topRight:Radius.circular(10)),
                  image: DecorationImage(image: AssetImage(food.img),fit: BoxFit.cover)
                ),
                child: Row(),
              )
            ],
          )
        ),
      ),
    );
}