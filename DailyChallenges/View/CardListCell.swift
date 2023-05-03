//
//  CardListCell.swift
//  DailyChallenges
//
//  Created by 김은지 on 2023/05/03.
//

import UIKit

class CardListCell: UITableViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var cardSecondName: UILabel!
    @IBOutlet weak var cardDesCription: UILabel!
    @IBOutlet weak var yearPay: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
