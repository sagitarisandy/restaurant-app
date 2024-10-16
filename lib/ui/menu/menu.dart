import 'dart:convert';

class MenuMakanan{
  List<Restaurant> restaurants;

  MenuMakanan({required this.restaurants});

  factory MenuMakanan.fromJson(Map<String, dynamic> json) {
    return MenuMakanan(
      restaurants: List<Restaurant>.from(json['restaurants'].map((data) => Restaurant.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'restaurants' : restaurants.map((restaurants) => restaurants.toJson()).toList()
    };
  }
}

class Restaurant{
    String id;
    String name;
    String description;
    String pictureId;
    String city;
    double rating;
    Menus menus;

    Restaurant({
      required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating,
      required this.menus
    });

    factory Restaurant.fromJson(Map<String, dynamic> json){
      return Restaurant(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        rating: json['rating'].toDouble(),
        menus: Menus.fromJson(json['menus'])
      );
    }

    Map <String, dynamic> toJson(){
      return{
        'id': id,
        'name' : name,
        'description' : description,
        'pictureId' : pictureId,
        'city' : city,
        'rating' : rating,
        'menus' : menus.toJson()
      };
    }
  }

  class Menus {
    List<Food> foods;
    List<Drink> drinks;

    Menus({required this.foods, required this.drinks});

    factory Menus.fromJson(Map<String, dynamic> json) {
      return Menus(
        foods: List<Food>.from(json['foods'].map((data) => Food.fromJson(data))),
        drinks: List<Drink>.from(json['drinks'].map((data) => Drink.fromJson(data))) // change 'drink' to 'drinks'
      );
    }



    Map<String, dynamic> toJson() {
      return {
        'foods': foods.map((food) => food.toJson()).toList(),
        'drinks' : drinks.map((drink) => drink.toJson()).toList()
      };
    }
  }

  class Food {
    String name;

    Food({required this.name});

    factory Food.fromJson(Map<String, dynamic> json) {
      return Food(
        name: json['name']
      );
    }

    Map<String, dynamic> toJson() {
      return {
        'name': name,
      };
    }
  }

  class Drink {
    String name;

    Drink({required this.name});

    factory Drink.fromJson(Map<String, dynamic> json) {
      return Drink(
        name: json['name']
      );
    }

    Map<String, dynamic> toJson() {
      return {
        'name' : name,
      };
    }
  }

  MenuMakanan parseMenuMakanan(String jsonStr) {
    final parsed = json.decode(jsonStr);
    return MenuMakanan.fromJson(parsed);
  }

  String toJsonString(MenuMakanan menuMakanan) {
    final jsonMap = menuMakanan.toJson();
    return json.encode(jsonMap);
  }