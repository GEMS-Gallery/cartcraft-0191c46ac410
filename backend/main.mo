import Bool "mo:base/Bool";
import Hash "mo:base/Hash";

import Array "mo:base/Array";
import Text "mo:base/Text";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";

actor {
  type Item = {
    name: Text;
    icon: Text;
  };

  type Category = {
    name: Text;
    icon: Text;
    items: [Item];
  };

  stable var categoriesArray: [Category] = [
    {
      name = "Fruits";
      icon = "fa-apple-whole";
      items = [
        { name = "Apple"; icon = "fa-apple-whole" },
        { name = "Banana"; icon = "fa-banana" },
        { name = "Orange"; icon = "fa-citrus" },
        { name = "Grapes"; icon = "fa-grape" },
        { name = "Strawberry"; icon = "fa-strawberry" },
        { name = "Pineapple"; icon = "fa-pineapple" },
        { name = "Mango"; icon = "fa-mango" },
        { name = "Kiwi"; icon = "fa-kiwi-fruit" }
      ];
    },
    {
      name = "Vegetables";
      icon = "fa-carrot";
      items = [
        { name = "Carrot"; icon = "fa-carrot" },
        { name = "Broccoli"; icon = "fa-broccoli" },
        { name = "Tomato"; icon = "fa-tomato" },
        { name = "Cucumber"; icon = "fa-cucumber" },
        { name = "Lettuce"; icon = "fa-leaf" },
        { name = "Potato"; icon = "fa-potato" },
        { name = "Onion"; icon = "fa-onion" },
        { name = "Bell Pepper"; icon = "fa-pepper-hot" }
      ];
    },
    {
      name = "Dairy";
      icon = "fa-cheese";
      items = [
        { name = "Milk"; icon = "fa-bottle-droplet" },
        { name = "Cheese"; icon = "fa-cheese" },
        { name = "Yogurt"; icon = "fa-jar" },
        { name = "Butter"; icon = "fa-butter" },
        { name = "Cream"; icon = "fa-bottle-droplet" },
        { name = "Ice Cream"; icon = "fa-ice-cream" },
        { name = "Sour Cream"; icon = "fa-jar" },
        { name = "Cottage Cheese"; icon = "fa-cheese" }
      ];
    },
    {
      name = "Bakery";
      icon = "fa-bread-slice";
      items = [
        { name = "Bread"; icon = "fa-bread-slice" },
        { name = "Croissant"; icon = "fa-croissant" },
        { name = "Muffin"; icon = "fa-cupcake" },
        { name = "Cake"; icon = "fa-cake-candles" },
        { name = "Bagel"; icon = "fa-bagel" },
        { name = "Donut"; icon = "fa-donut" },
        { name = "Pie"; icon = "fa-pie" },
        { name = "Cookies"; icon = "fa-cookie" }
      ];
    },
    {
      name = "Meat";
      icon = "fa-drumstick-bite";
      items = [
        { name = "Chicken"; icon = "fa-drumstick-bite" },
        { name = "Beef"; icon = "fa-cow" },
        { name = "Pork"; icon = "fa-bacon" },
        { name = "Fish"; icon = "fa-fish" },
        { name = "Turkey"; icon = "fa-turkey" },
        { name = "Lamb"; icon = "fa-sheep" },
        { name = "Sausage"; icon = "fa-sausage" },
        { name = "Ham"; icon = "fa-ham" }
      ];
    },
    {
      name = "Beverages";
      icon = "fa-bottle-water";
      items = [
        { name = "Water"; icon = "fa-bottle-water" },
        { name = "Soda"; icon = "fa-can-food" },
        { name = "Coffee"; icon = "fa-mug-hot" },
        { name = "Tea"; icon = "fa-mug-saucer" },
        { name = "Juice"; icon = "fa-glass-citrus" },
        { name = "Beer"; icon = "fa-beer-mug-empty" },
        { name = "Wine"; icon = "fa-wine-glass" },
        { name = "Smoothie"; icon = "fa-blender" }
      ];
    },
    {
      name = "Snacks";
      icon = "fa-cookie";
      items = [
        { name = "Chips"; icon = "fa-bag-shopping" },
        { name = "Popcorn"; icon = "fa-popcorn" },
        { name = "Nuts"; icon = "fa-nut" },
        { name = "Chocolate"; icon = "fa-chocolate-bar" },
        { name = "Crackers"; icon = "fa-cookie" },
        { name = "Pretzels"; icon = "fa-pretzel" },
        { name = "Granola Bar"; icon = "fa-rectangle-vertical" },
        { name = "Trail Mix"; icon = "fa-seedling" }
      ];
    }
  ];

  public query func getCategories() : async [Category] {
    return categoriesArray;
  };

  public query func getItemsByCategory(categoryName: Text) : async ?[Item] {
    let category = Array.find(categoriesArray, func(c: Category) : Bool { c.name == categoryName });
    switch (category) {
      case (?c) ?c.items;
      case null null;
    };
  };
}