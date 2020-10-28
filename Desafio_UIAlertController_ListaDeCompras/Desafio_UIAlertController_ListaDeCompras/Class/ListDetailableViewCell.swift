//
//  ListDetailableViewCell.swift
//  Desafio_UIAlertController_ListaDeCompras
//
//  Created by Grazi Berti on 28/10/20.
//

import UIKit

class ListDetailableViewCell: UITableViewCell {

    @IBOutlet weak var labelList: UILabel!
    
    func setup(list: List){
        labelList.text = list.name
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
