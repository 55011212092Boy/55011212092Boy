//
//  ViewController.swift
//  Exam1_Final_55011212092
//
//  Created by student on 12/17/14.
//  Copyright (c) 2014 app. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textVolume: UITextField!
    @IBOutlet weak var textPrice: UITextField!
    @IBOutlet weak var textTotal: UITextField!
    @IBOutlet weak var btTotal: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "cellIdentifier"
    var tableData = ["PriceUp","PriceDown","Cell3Text"]
    
    //var items = [String]()
    var items = [NSManagedObject]()
    
    var inputName:String = ""
    var inputVolume:Int = 400
    var inputPrice:Double = 2.32
    func refreshUI(){
        textName.text = String(inputName)
        textVolume.text = String(format:"%d",inputVolume)
        textPrice.text = String(format: "%0.2f",inputPrice )
        textTotal.text = ""
    }
    
    
    @IBAction func sumShare(sender: AnyObject) {
        var v = Double((textVolume.text as NSString).doubleValue);
        var p = Double((textPrice.text as NSString).doubleValue);
        
        var sum = v*p;
        
        textTotal.text = "\(sum)"
    }
    
    @IBAction func Clear(sender: AnyObject) {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "Item")
        
        if let tv = tableView {
            var bas: NSManagedObject!
            for bas : AnyObject in items
            {
                context.deleteObject(bas as NSManagedObject)
            }
            items.removeAll(keepCapacity: false)
            tv.reloadData()
        }
        
    }
    
    @IBAction func addItem(sender: AnyObject) {
        var alert = UIAlertController(title: "Stocks", message: "Add a new stock", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) { (action: UIAlertAction!) -> Void in
            
            let textField = alert.textFields![0] as UITextField
           // let textField2 = alert.textFields![1] as UITextField
           // let textField3 = alert.textFields![2] as UITextField
            self.saveName(textField.text)
            //self.saveName(textField2.text)
            //self.saveName(textField3.text)
            
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default){ (action: UIAlertAction!) -> Void in
        }
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
            
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
    }
    func saveName(name: String){
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Stocks", inManagedObjectContext: managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        item.setValue(name, forKey: "name")
        
        textName.text = name
        
        var error: NSError?
        if !managedContext.save(&error){
            println("Could not save \(error), \(error?.userInfo)")
        }
       
        items.append(item)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        let item = items[indexPath.row]
        cell.textLabel!.text = item.valueForKey("name") as String?
        
        return cell
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName:"Stocks")
        
        var error: NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as[NSManagedObject]?
        
        if let results = fetchedResults {
            items = results
        } else {
            println("Could not save \(error), \(error!.userInfo)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
        //self.tableView.registerClass(UITableViewCell.self ,forCellReuseIdentifier: self.cellIdentifier)
        tableView.registerClass(UITableViewCell.self ,forCellReuseIdentifier:"Cell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell = tableView!.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
        
        cell.textLabel!.text = self.tableData[indexPath.row]
        var imageName = UIImage(named: tableData[indexPath.row])
        cell.imageView!.image = imageName
        return cell
    }
    
}


