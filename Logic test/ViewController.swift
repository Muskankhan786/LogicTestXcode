//
//  ViewController.swift
//  Logic test
//
//  Created by Muskan on 13/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rightTableView: UITableView!
    @IBOutlet weak var leftTableView: UITableView!
    
    var model = Model()
    //    var leftTableArr = ["A","B","C","D","E"]
    //    var rightTableArr = ["F","G","H","I","J"]
    //    var multipleSelection = [String]()
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rightTableView.register(UINib(nibName: "TblViewCell", bundle: nil), forCellReuseIdentifier: "TblViewCell")
        self.leftTableView.register(UINib(nibName: "TblViewCell", bundle: nil), forCellReuseIdentifier: "TblViewCell")
        
    }
    
    
    @IBAction func moveRightBtn(_ sender: Any) {
        if model.rightTableArr.contains(model.multipleSelection) {
            print(model.leftTableArr)
        } else {
            model.rightTableArr.append(contentsOf: model.multipleSelection)
        }
        model.multipleSelection.removeAll()
        rightTableView.reloadData()
        leftTableView.reloadData()
    }
    
    @IBAction func moveLeftBtn(_ sender: Any) {
        if model.leftTableArr.contains(model.multipleSelection) {
            
            print(model.multipleSelection)
        } else {
            model.leftTableArr.append(contentsOf: model.multipleSelection)
        }
        model.multipleSelection.removeAll()
        leftTableView.reloadData()
        rightTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView{
        case self.rightTableView:
            return 5
            
        case self.leftTableView:
            return 5
            
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TblViewCell") as? TblViewCell else {
            return UITableViewCell()
        }
        //cell.lblFirst.text = self.model.rightTableArr[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
