//
//  RatePlanDetailTableViewCell.swift
//  Ana Vodafone
//
//  Created by Ahmad Ragab on 12/26/18.
//  Copyright © 2018 Vodafone Egypt. All rights reserved.
//

import UIKit
import VUIComponents

public class RatePlanDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitleLabel: AnaVodafoneLabel!
    @IBOutlet weak var detailTitleLableHeightConstraint: NSLayoutConstraint!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setContent(detailModel: RatePlanCardTabelModel) {
        detailImageView.image = UIImage(named: detailModel.img)
        detailTitleLabel.attributedText = detailModel.title
    }
}
