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
       
        
        rightTableView.reloadData()
        leftTableView.reloadData()
    }

    @IBAction func moveLeftBtn(_ sender: Any) {
        
        for model in arrLeftTableView {
            if model.isSelected {
                arrRightTableView.append(model)
//                arrLeftTableView.removeAll()
                
            } else {
                print(arrLeftTableView)
            }
        }
       
//        if model.leftTableArr.contains(model.multipleSelection) {
//
//            print(model.multipleSelection)
//        } else {
//            model.leftTableArr.append(contentsOf: model.multipleSelection)
//        }
//        model.multipleSelection.removeAll()
        leftTableView.reloadData()
        rightTableView.reloadData()
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
        cell.renderData(model: self.arrLeftTableView[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch tableView{
        case self.leftTableView:
            let model = self.arrLeftTableView[indexPath.row]
            debugPrint(model.isSelected)
            model.isSelected = true
            debugPrint(model.isSelected)
            break
        case self.leftTableView:
            break
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
