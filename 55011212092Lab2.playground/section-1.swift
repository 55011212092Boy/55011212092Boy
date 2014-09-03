class animal{
    var name:[String:String]
    
    init(name:[String:String]){
        self.name = name
    }
    func addAnimal()->[String:String]{
        name["Monkey"] = "Banana"
        name["Cat"] = "Grass"
        name["Chicken"] = "Rice"
        return name
    }
}
let add = animal(name: ["Sheep":"Corn",])
add.addAnimal()
