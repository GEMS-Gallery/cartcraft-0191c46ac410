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
        { name = "Apple"; icon = "🍎" },
        { name = "Banana"; icon = "🍌" },
        { name = "Orange"; icon = "🍊" },
        { name = "Grapes"; icon = "🍇" },
        { name = "Strawberry"; icon = "🍓" },
        { name = "Pineapple"; icon = "🍍" },
        { name = "Mango"; icon = "🥭" },
        { name = "Kiwi"; icon = "🥝" }
      ];
    },
    {
      name = "Vegetables";
      icon = "fa-carrot";
      items = [
        { name = "Carrot"; icon = "🥕" },
        { name = "Broccoli"; icon = "🥦" },
        { name = "Tomato"; icon = "🍅" },
        { name = "Cucumber"; icon = "🥒" },
        { name = "Lettuce"; icon = "🥬" },
        { name = "Potato"; icon = "🥔" },
        { name = "Onion"; icon = "🧅" },
        { name = "Bell Pepper"; icon = "🫑" }
      ];
    },
    {
      name = "Dairy";
      icon = "fa-cheese";
      items = [
        { name = "Milk"; icon = "🥛" },
        { name = "Cheese"; icon = "🧀" },
        { name = "Yogurt"; icon = "🍶" },
        { name = "Butter"; icon = "🧈" },
        { name = "Cream"; icon = "🍶" },
        { name = "Ice Cream"; icon = "🍦" },
        { name = "Sour Cream"; icon = "🥛" },
        { name = "Cottage Cheese"; icon = "🧀" }
      ];
    },
    {
      name = "Bakery";
      icon = "fa-bread-slice";
      items = [
        { name = "Bread"; icon = "🍞" },
        { name = "Croissant"; icon = "🥐" },
        { name = "Muffin"; icon = "🧁" },
        { name = "Cake"; icon = "🎂" },
        { name = "Bagel"; icon = "🥯" },
        { name = "Donut"; icon = "🍩" },
        { name = "Pie"; icon = "🥧" },
        { name = "Cookies"; icon = "🍪" }
      ];
    },
    {
      name = "Meat";
      icon = "fa-drumstick-bite";
      items = [
        { name = "Chicken"; icon = "🍗" },
        { name = "Beef"; icon = "🥩" },
        { name = "Pork"; icon = "🥓" },
        { name = "Fish"; icon = "🐟" },
        { name = "Turkey"; icon = "🦃" },
        { name = "Lamb"; icon = "🍖" },
        { name = "Sausage"; icon = "🌭" },
        { name = "Ham"; icon = "🍖" }
      ];
    },
    {
      name = "Beverages";
      icon = "fa-bottle-water";
      items = [
        { name = "Water"; icon = "💧" },
        { name = "Soda"; icon = "🥤" },
        { name = "Coffee"; icon = "☕" },
        { name = "Tea"; icon = "🍵" },
        { name = "Juice"; icon = "🧃" },
        { name = "Beer"; icon = "🍺" },
        { name = "Wine"; icon = "🍷" },
        { name = "Smoothie"; icon = "🥤" }
      ];
    },
    {
      name = "Snacks";
      icon = "fa-cookie";
      items = [
        { name = "Chips"; icon = "🍟" },
        { name = "Popcorn"; icon = "🍿" },
        { name = "Nuts"; icon = "🥜" },
        { name = "Chocolate"; icon = "🍫" },
        { name = "Crackers"; icon = "🍘" },
        { name = "Pretzels"; icon = "🥨" },
        { name = "Granola Bar"; icon = "🍫" },
        { name = "Trail Mix"; icon = "🥜" }
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