//
//  rightTableViewCell.swift
//  Logic test
//
//  Created by Muskan on 13/02/23.
//

import UIKit

class TblViewCell: UITableViewCell {
  
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    
    private var dataModel: DataModel?

    func renderData(model: DataModel) {
        self.dataModel = model
        self.lblTitle.text = model.title
        self.lblValue.text = model.getStringValue
    }
    
    @IBAction func btnPlus(_ sender: Any) {
        debugPrint(self.dataModel?.value as Any)
        self.dataModel?.value! += 1
        self.lblValue.text = self.dataModel?.getStringValue
        debugPrint(self.dataModel?.value as Any)
    }
    
    @IBAction func btnMinus(_ sender: Any) {
        debugPrint(self.dataModel?.value as Any)
        if self.dataModel!.value! > 0 {
            self.dataModel?.value! -= 1
            self.lblValue.text = self.dataModel?.getStringValue
            debugPrint(self.dataModel?.value as Any)
        }
    }
}
