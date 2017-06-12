//
//  ResultsTVCell.swift
//  sorting-compare
//

import UIKit

class ResultsTVCell: UITableViewCell {
   
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblSorted: UILabel!
    @IBOutlet weak var lblWeak: UILabel!
    @IBOutlet weak var lblReverse: UILabel!
    @IBOutlet weak var lblUnsorted: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
