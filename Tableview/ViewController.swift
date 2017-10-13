//
//  ViewController.swift
//  Tableview
//
//  Created by jayaraj on 08/11/16.
//  Copyright © 2016 sample. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableview : UITableView!
    var temp : Int! = 0
    
    var items: [(time: String, from: String, to: String, other: String)] = [("16:21","Strasbourg","Munich","Selfish"),("17:21","Strasbourg","Munich","DusselDof"),("18:21","Strasbourg","Munich","Selfish"),("19:21","Strasbourg","Munich","Selfish"),("20:21","Strasbourg","Munich","Selfish"),("21:21","Strasbourg","Munich","Selfish"),("22:21","Strasbourg","Munich","Selfish"),("23:21","Strasbourg","Munich","Selfish"),("24:21","Strasbourg","Munich","Selfish"),("25:21","Strasbourg","Munich","Selfish"),("26:21","Strasbourg","Munich","Selfish"),("27:21","Strasbourg","Munich","Selfish"),("28:21","Strasbourg","Munich","Selfish"),("29:21","Strasbourg","Munich","Selfish")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnReloadAction(sender : UIBarButtonItem) {
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if temp != 0 && indexPath.row == temp{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! TableViewCell
            cell.btnBuy.layer.borderColor = UIColor.lightGray.cgColor
            cell.btnBuy.layer.borderWidth = 2
            cell.btnBuy.layer.cornerRadius = 5
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.lblTime.text = items[indexPath.row].time
        cell.lblFrom.text = items[indexPath.row].from
        cell.lblTo.text = items[indexPath.row].to
        cell.lblOther.text = items[indexPath.row].other
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
        // Update Table Data
        if temp == 0 {
            self.tableview.beginUpdates()
            self.tableview.insertRows(at: [IndexPath.init(row: indexPath.row+1, section: 0)], with: .middle)
            self.temp = indexPath.row+1
            self.items.insert(("", "", "", ""), at: self.temp)
            self.tableview.endUpdates()
        }else{
            self.tableview.beginUpdates()
            self.items.remove(at: self.temp)
            self.tableview.deleteRows(at: [IndexPath.init(row: self.temp, section: 0)], with: .top)
            self.temp = 0
            self.tableview.endUpdates()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if temp != 0 && indexPath.row == temp{
            return 269
        }
        return 124
    }
}

