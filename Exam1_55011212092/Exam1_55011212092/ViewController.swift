//
//  ViewController.swift
//  Exam1_55011212092
//
//  Created by Student on 10/10/14.
//  Copyright (c) 2014 Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate{
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textVolume: UITextField!
    @IBOutlet weak var textPrice: UITextField!
    @IBOutlet weak var textTotal: UITextField!
    @IBOutlet weak var btTotal: UIButton!
    
    @IBOutlet weak var btProfit: UIButton!
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "cellIdentifier"
    var tableData = ["PriceUp","PriceDown","Cell3Text"]
    
    let inputName = "BTS"
    let inputVolume = 400
    let inputPrice = 2.32
    func refreshUI(){
        textName.text = String(inputName)
        textVolume.text = String(format:"%d",inputVolume)
        textPrice.text = String(format: "%0.2f",inputPrice )
        textTotal.text = ""
    }
    
    
    @IBAction func sumShare(sender: AnyObject) {
        //let sum = inputVolume * inputPrice
        //textTotal.text = sum
    }
    
    @IBAction func resultPro(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
       self.tableView.registerClass(UITableViewCell.self ,forCellReuseIdentifier: self.cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

