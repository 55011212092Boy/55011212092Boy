var arrayInt = [55011212092,55011221005,55011212018]
var arrayString = ["Boy Pasakorn","Den Pramot","Ark Natthaphong"]

var newID = arrayInt[0]+1

arrayInt += [55011212127,55011212088]

//newID = arrayInt[4]-1
arrayInt.append(55011212153)//เพิ่มได้ 1 ค่า

arrayInt
arrayInt[0...5] = [55011212153,55011212088,55011212127,arrayInt[0],arrayInt[1],arrayInt[2]]
//a[0...2]=a[3...5], a[3...5]=a[0...2]
arrayInt

/*************************/

let tutorialTeam = 56
let editoriakTeam = 23
var totalTeam = tutorialTeam + editoriakTeam

totalTeam += 1
let priceIntInferred = -19
let priceIntExplicit:Int = -19

let priceInferred = -19.99
let priceExplicit:Double = -19.99

let priceFloatInferred = -19.99
let priceFloatExplicit:Float = -19.99


let onSaleInferred = true
let onSaleExplicit:Bool = false

let nameInferred = "Whoopie Cushion"
let nameExplicit:String = "Whoopie Cushion"

if (onSaleInferred) {
    println("\(nameInferred) on sale for \(priceInferred)!")
} else {
    println("\(nameInferred) at regular price: \(priceInferred)!")
}

/****************************************/
//Dictoinnary

let array:Array<Int> = [1,2,3,4]
let dictionary:Dictionary<String,Int> = ["dog":1,"elephent":2,"fog":3]

var airports:[String: String] = ["Bangkok":"BKK","Donmuang":"DM","Suwannabhumi":"SWB","London":"LHR"]

//update

if let oldValue = airports.updateValue("Dublin International", forKey: "DUB")
println("The old value for DUB was \(oldValue).")


















