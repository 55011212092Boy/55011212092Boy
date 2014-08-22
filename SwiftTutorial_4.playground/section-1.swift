let array: Array<Int> = [1,2,3,4]
let dictionare: Dictionary<String,Int> = ["dog":1,"elephamt":2]

var airports: [String:String] = ["TYO":"Tokyo","DUB":"Dublin"]
if airports.isEmpty {
    print("The airports dictionary is empty")
} else {
    print("The airports dictionary is not empty")
}
//print "The airports dictionary is not empty"

print("The airports dictionary contains \(airports.count) items.")
//print "The airports dictionary contains 2 items."


//add
airports["LHR"] = "London Heathrow"
//the value for "LHR" has been changed to "London Heathow"


if let oldValue = airports.updateValue("Dublin International", forKey: "DUB"){
    println("The old value for DUB was \(oldValue).")
}
// prints "The old value for DUB was Dublin."

//remove
airports["APL"] = "Apple International"
    //"Apple International" is not the real airport for APL, so delete it
    airports["APL"] = nil
    //APL has now been remove from the dictionary
    
if  let removedValue = airports.removeValueForKey("DUB") {
    println("The removed airport's name is \(removedValue).")
} else {
    println("The airports dictionary dose not contain a value for DUB.")
}
//print "The remove airport's name is Dublin International.







