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
    
    var arrLeftTableView = [DataModel(title: "A", value: 0),
                            DataModel(title: "B", value: 0),
                            DataModel(title: "C", value: 0),
                            DataModel(title: "D", value: 0),
                            DataModel(title: "E", value: 0),
                            DataModel(title: "F", value: 0),
                            DataModel(title: "G", value: 0)]
    
    var arrRightTableView = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rightTableView.register(UINib(nibName: "TblViewCell", bundle: nil), forCellReuseIdentifier: "TblViewCell")
        self.leftTableView.register(UINib(nibName: "TblViewCell", bundle: nil), forCellReuseIdentifier: "TblViewCell")
    }
    
    
    @IBAction func moveRightBtn(_ sender: Any) {
        for (index, model) in arrLeftTableView.enumerated().reversed() {
            if model.isSelected {
                self.arrRightTableView.append(model)
                model.isSelected = false
                self.arrLeftTableView.remove(at: index)
            }
        }
        leftTableView.reloadData()
        rightTableView.reloadData()
    }
    
    @IBAction func moveLeftBtn(_ sender: Any) {
        for (index, model) in arrRightTableView.enumerated().reversed() {
            if model.isSelected {
                self.arrLeftTableView.append(model)
                model.isSelected = false
                self.arrRightTableView.remove(at: index)
            }
            rightTableView.reloadData()
            leftTableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView{
        case self.rightTableView:
            return self.arrRightTableView.count
            
        case self.leftTableView:
            return self.arrLeftTableView.count
            
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TblViewCell") as? TblViewCell else {
            return UITableViewCell()
        }
        switch tableView {
        case self.leftTableView:
            cell.renderData(model: self.arrLeftTableView[indexPath.row])
            return cell
            
        case self.rightTableView:
            cell.renderData(model: self.arrRightTableView[indexPath.row])
            return cell
            
        default:
            break
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch tableView{
        case self.leftTableView:
            let model = self.arrLeftTableView[indexPath.row]
            model.isSelected = true
            break
        case self.rightTableView:
            let model = self.arrRightTableView[indexPath.row]
            model.isSelected = true
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        switch tableView{
        case self.leftTableView:
            let model = self.arrLeftTableView[indexPath.row]
            model.isSelected = false
            break
        case self.rightTableView:
            let model = self.arrRightTableView[indexPath.row]
            model.isSelected = false
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
