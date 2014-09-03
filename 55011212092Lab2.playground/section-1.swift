class animal{
    var name:[String:String]
    //var nameDic:Dictionary<String,String>
    
    
    init(name:[String:String]/*,nameDic:Dictionary<String,String>*/){
        self.name = name
        //self.nameDic = nameDic
    }
    
    func addAnimal()->[String:String]{
        name["Monkey"] = "Banana"
        return name
    }
    func removeAnimal(){
       let rm = name.removeValueForKey("Sheep");
            println("remove name \(rm).")
    }
    func updateAnimal(){
        let ud = name.updateValue("Fish", forKey: "Cat" )
    }
    /*func addAni(name:Dictionary<String,String>){
        for (key,value) in name {
            nameDic[key] = value
            println("key: \(key)  value:\(value)")
        }
    }*/
}
let add = animal(name:["Sheep":"Corn","Bird":"Rice","Tiger":"Beef","Chicken":"Rice","Cat":"Grass"])

add.addAnimal()





