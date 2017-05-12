//
//  TableViewController.swift
//  CollectInTable
//
//  Created by Tu on 5/11/17.
//  Copyright © 2017 Moza. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{
    
    var images = [[]]
    var category = [[]]
    override func viewDidLoad() {
        super.viewDidLoad()
        var images = [["beverage1.jpg","beverage2.jpg","beverage3.jpg","beverage4.jpg","beverage5.jpg","beverage6.jpg"],        ["grill1.jpg","grill2.jpg","grill3.jpg","grill4.jpg","grill5.jpg","grill6.jpg",],["seafood1.jpg","seafood2.jpg","seafood3.jpg","seafood4.jpg","seafood5.jpg","seafood6.jpg"]]
        category = [["Beverage",images[0]],
                    ["Grill",images[1]],
                    ["Seafood",images[2]],
                    ["Beverage2",images[0]],
                    ["Grill2",images[1]],
                    ["Seafood2",images[2]]]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return category.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        let detail = storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailVC
        print(category[indexPath.section])
        
        cell.configCell(list: category[indexPath.section][1] as! [String])
        
        cell.showDetail = { [weak self] (indexpath) in
            let image = UIImage(named: cell.imageList[indexpath.row])
            detail.image = image!
            self?.navigationController?.pushViewController(detail, animated: true)
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.blue
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return category[section][0] as? String
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
