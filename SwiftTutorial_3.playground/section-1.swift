let possibleTipsInferred = [0.15,0.18,0.20]
let possibleTipsExplicit:[Double] = [0.15,0.18,0.20]
var numberOfItems = possibleTipsInferred.count
var shoppingList:[String] = ["Eggs","Milk"]


shoppingList += ["Baking Powder"]
//shoppingList now contains 4 itemes
shoppingList += ["Shocolate Spread","Cheese","Butter"]
//shoppingList now contains 7 itemes

shoppingList.insert("Maple Syrup", atIndex: 0)
//shoppingList now contains 7 itemes
//"Maple Syrup" is now the first item in the list

shoppingList.append("Flour")
//shoppingList now contains 3 itemes, and someone is making pancakes
shoppingList += ["Baking Powder"]
var firstItem = shoppingList[0]

shoppingList[4...6] = ["Bananas","Apples"]
shoppingList

let apples = shoppingList.removeLast()

let mapleSyrup = shoppingList.removeAtIndex(0)
shoppingList
