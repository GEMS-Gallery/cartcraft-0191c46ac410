import Bool "mo:base/Bool";
import Hash "mo:base/Hash";
import List "mo:base/List";
import Nat "mo:base/Nat";

import Array "mo:base/Array";
import Text "mo:base/Text";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";

actor {
  type Item = {
    name: Text;
    icon: Text;
  };

  type ShoppingListItem = {
    name: Text;
    icon: Text;
    quantity: Nat;
    category: Text;
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
        { name = "Kiwi"; icon = "🥝" },
        { name = "Watermelon"; icon = "🍉" },
        { name = "Peach"; icon = "🍑" },
        { name = "Pear"; icon = "🍐" },
        { name = "Cherry"; icon = "🍒" },
        { name = "Blueberry"; icon = "🫐" },
        { name = "Lemon"; icon = "🍋" },
        { name = "Avocado"; icon = "🥑" }
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
        { name = "Bell Pepper"; icon = "🫑" },
        { name = "Eggplant"; icon = "🍆" },
        { name = "Corn"; icon = "🌽" },
        { name = "Mushroom"; icon = "🍄" },
        { name = "Garlic"; icon = "🧄" },
        { name = "Pumpkin"; icon = "🎃" },
        { name = "Spinach"; icon = "🍃" },
        { name = "Asparagus"; icon = "🥦" }
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
        { name = "Cottage Cheese"; icon = "🧀" },
        { name = "Whipped Cream"; icon = "🍨" },
        { name = "Mozzarella"; icon = "🧀" },
        { name = "Cheddar"; icon = "🧀" },
        { name = "Parmesan"; icon = "🧀" },
        { name = "Gouda"; icon = "🧀" },
        { name = "Feta"; icon = "🧀" },
        { name = "Cream Cheese"; icon = "🧀" }
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
        { name = "Cookies"; icon = "🍪" },
        { name = "Baguette"; icon = "🥖" },
        { name = "Pretzel"; icon = "🥨" },
        { name = "Pancakes"; icon = "🥞" },
        { name = "Waffle"; icon = "🧇" },
        { name = "Cupcake"; icon = "🧁" },
        { name = "Biscuit"; icon = "🍪" },
        { name = "Danish Pastry"; icon = "🥐" }
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
        { name = "Ham"; icon = "🍖" },
        { name = "Steak"; icon = "🥩" },
        { name = "Bacon"; icon = "🥓" },
        { name = "Salami"; icon = "🍖" },
        { name = "Shrimp"; icon = "🍤" },
        { name = "Crab"; icon = "🦀" },
        { name = "Lobster"; icon = "🦞" },
        { name = "Duck"; icon = "🦆" }
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
        { name = "Smoothie"; icon = "🥤" },
        { name = "Milk Shake"; icon = "🥛" },
        { name = "Lemonade"; icon = "🍋" },
        { name = "Cocktail"; icon = "🍸" },
        { name = "Hot Chocolate"; icon = "☕" },
        { name = "Iced Tea"; icon = "🧊🍵" },
        { name = "Energy Drink"; icon = "⚡🥤" },
        { name = "Coconut Water"; icon = "🥥" }
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
        { name = "Trail Mix"; icon = "🥜" },
        { name = "Candy"; icon = "🍬" },
        { name = "Gummy Bears"; icon = "🐻" },
        { name = "Fruit Snacks"; icon = "🍇" },
        { name = "Rice Cakes"; icon = "🍘" },
        { name = "Beef Jerky"; icon = "🥩" },
        { name = "Peanut Butter"; icon = "🥜" },
        { name = "Cheese Puffs"; icon = "🧀" }
      ];
    },
    {
      name = "Household";
      icon = "fa-house";
      items = [
        { name = "Soap"; icon = "🧼" },
        { name = "Toilet Paper"; icon = "🧻" },
        { name = "Detergent"; icon = "🧺" },
        { name = "Trash Bags"; icon = "🗑️" },
        { name = "Paper Towels"; icon = "🧻" },
        { name = "Sponge"; icon = "🧽" },
        { name = "Dish Soap"; icon = "🍽️" },
        { name = "Air Freshener"; icon = "🌬️" },
        { name = "Light Bulb"; icon = "💡" },
        { name = "Batteries"; icon = "🔋" },
        { name = "Candles"; icon = "🕯️" },
        { name = "Matches"; icon = "🔥" },
        { name = "Aluminum Foil"; icon = "🔲" },
        { name = "Plastic Wrap"; icon = "🎁" },
        { name = "Ziploc Bags"; icon = "💼" }
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

  public query func searchItems(searchQuery: Text) : async [(Text, [Item])] {
    let lowercaseQuery = Text.toLowercase(searchQuery);
    let results = Array.mapFilter<Category, (Text, [Item])>(categoriesArray, func(category: Category) : ?(Text, [Item]) {
      let matchingItems = Array.filter<Item>(category.items, func(item: Item) : Bool {
        Text.contains(Text.toLowercase(item.name), #text lowercaseQuery)
      });
      if (matchingItems.size() > 0) {
        ?(category.name, matchingItems)
      } else {
        null
      }
    });
    results
  };
}