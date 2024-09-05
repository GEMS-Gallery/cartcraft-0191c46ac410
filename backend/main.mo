import Float "mo:base/Float";
import Hash "mo:base/Hash";

import Array "mo:base/Array";
import Text "mo:base/Text";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";

actor {
  // Types
  type Category = {
    id: Text;
    name: Text;
    icon: Text;
  };

  type Item = {
    id: Text;
    name: Text;
    icon: Text;
    description: ?Text;
    price: ?Float;
  };

  // Stable variables
  stable var categoriesArray: [Category] = [];
  stable var itemsEntries: [(Text, [Item])] = [];

  // In-memory state
  var categories = categoriesArray;
  var items = HashMap.fromIter<Text, [Item]>(itemsEntries.vals(), 10, Text.equal, Text.hash);

  // Initialize with some data
  public func initialize() : async () {
    categoriesArray := [
      { id = "fruits"; name = "Fruits"; icon = "apple" },
      { id = "vegetables"; name = "Vegetables"; icon = "local_florist" },
      { id = "dairy"; name = "Dairy"; icon = "local_drink" },
      { id = "bakery"; name = "Bakery"; icon = "cake" }
    ];
    categories := categoriesArray;

    let fruitsItems: [Item] = [
      { id = "apple"; name = "Apple"; icon = "apple"; description = ?"Fresh red apple"; price = ?0.5 },
      { id = "banana"; name = "Banana"; icon = "banana"; description = ?"Ripe yellow banana"; price = ?0.3 }
    ];
    items.put("fruits", fruitsItems);

    let vegetablesItems: [Item] = [
      { id = "carrot"; name = "Carrot"; icon = "local_florist"; description = ?"Organic carrot"; price = ?0.4 },
      { id = "broccoli"; name = "Broccoli"; icon = "local_florist"; description = ?"Fresh broccoli"; price = ?1.2 }
    ];
    items.put("vegetables", vegetablesItems);

    let dairyItems: [Item] = [
      { id = "milk"; name = "Milk"; icon = "local_drink"; description = ?"Fresh milk"; price = ?2.0 },
      { id = "yogurt"; name = "Yogurt"; icon = "local_drink"; description = ?"Greek yogurt"; price = ?1.5 }
    ];
    items.put("dairy", dairyItems);
  };

  // API methods
  public query func getCategories() : async [Category] {
    return categories;
  };

  public query func getItemsByCategory(categoryId: Text) : async ?[Item] {
    return items.get(categoryId);
  };

  // Upgrade hooks
  system func preupgrade() {
    categoriesArray := categories;
    itemsEntries := Iter.toArray(items.entries());
  };

  system func postupgrade() {
    categories := categoriesArray;
    items := HashMap.fromIter<Text, [Item]>(itemsEntries.vals(), 10, Text.equal, Text.hash);
  };
}