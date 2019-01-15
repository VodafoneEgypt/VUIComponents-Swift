//
//  RatePlanCardView.swift
//  Ana Vodafone
//
//  Created by Ahmad Ragab on 12/21/18.
//  Copyright © 2018 Vodafone Egypt. All rights reserved.
//

import UIKit
import VUIComponents
import Languagehandlerpod

class RatePlanCardTabelModel : NSObject {
    var img: String = ""
    var title: NSMutableAttributedString = NSMutableAttributedString(string: "")
}

class RatePlanCardView: ExpandableBaseCardViewWithButtons {
    
    //MARK: Outlets
    @IBOutlet weak private var titleLabel: AnaVodafoneLabel!
    @IBOutlet weak private var outerViewCustomStackView: UIView!
    @IBOutlet weak private var customStackView: CustomStackView!
    @IBOutlet weak private var feesLabel: AnaVodafoneLabel!
    @IBOutlet weak private var descriptionLabel: AnaVodafoneLabel!
    @IBOutlet weak private var subDescriptionLabel: AnaVodafoneLabel!
    @IBOutlet weak private var infoImageView: UIImageView!
    @IBOutlet weak private var infoLabel: AnaVodafoneLabel!
    @IBOutlet weak private var showMoreLessLabel: AnaVodafoneLabel!
    @IBOutlet weak private var expandButton: CustomButton!
    @IBOutlet weak private var expandedViewContentTableView: UITableView!
    
    //Heigh Constraints
    @IBOutlet weak private var titleHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var outerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var feesHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var descriptionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var descriptionSeparatorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var subDescriptionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var subDescriptionSeparatorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var infoViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var infoImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var infoViewSeparatorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var showMoreLessViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var showMoreLessSeparatorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var expandButtonHeightConstraint: NSLayoutConstraint!
    
    //Top and Bottom Constraints
    @IBOutlet weak private var outerViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak private var feesTopConstraint: NSLayoutConstraint!
    @IBOutlet weak private var descriptionTopConstraint: NSLayoutConstraint!
    @IBOutlet weak private var descriptionBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak private var subDescriptionTopConstraint: NSLayoutConstraint!
    @IBOutlet weak private var subDescriptionBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak private var infoViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak private var infoViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak private var showMoreLessViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak private var showMoreLessViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak private var expandableViewBottomConstraint: NSLayoutConstraint!
    //------------------------------------------------------------------
    
    //MARK: Local Variables
    private var isExpanded = false
    private var titleString = ""
    private var feesString = ""
    private var descriptionString = ""
    private var subDescriptionString = ""
    private var infoString = ""
    private var infoImg = ""
    private var showMoreLessString = ""
    private var tableViewData = [RatePlanCardTabelModel]()
    var isGrandfather = false
    //------------------------------------------------------------------
    
    //MARK: Setters
    func setTitleString(_ title: NSAttributedString) {
        titleLabel.attributedText = title
        titleString = title.string
        self.initialize()
    }
    
    func setFeesString(_ fees: NSAttributedString) {
        feesLabel.attributedText = fees
        feesString = fees.string
        self.initialize()
    }
    
    func setDescriptionString(_ desc: NSAttributedString) {
        descriptionLabel.attributedText = desc
        descriptionString = desc.string
        self.initialize()
    }
    
    func setSubDescriptionString(_ subDesc: NSAttributedString) {
        subDescriptionLabel.attributedText = subDesc
        subDescriptionString = subDesc.string
        self.initialize()
    }
    
    func setInfoViewImage(_ image: String, andInfoText infoText: NSAttributedString) {
        infoImageView.image = UIImage(named: image)
        infoLabel.attributedText = infoText
        infoImg = image
        infoString = infoText.string
        self.initialize()
    }
    
    func setTabelViewData(data: [RatePlanCardTabelModel]) {
        tableViewData = data
        expandedViewContentTableView.register(UINib(nibName: "RatePlanDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "RatePlanDetailTableViewCell")
        expandedViewContentTableView.delegate = self
        expandedViewContentTableView.dataSource = self
        self.expanded = isExpanded
    }
    //------------------------------------------------------------------
    
    //MARK: Customization Functions
    @IBAction func expandButtonPressed(_ sender: Any) {
        
        if isExpanded {
            expandButton.setImage(UIImage(named: "arrow_down_gray"), for: .normal)
            showMoreLessLabel.text = LanguageHandler.sharedInstance().string(forKey: "Show more")
            showMoreLessViewBottomConstraint.constant = 15
            showMoreLessSeparatorHeightConstraint.constant = 1
        } else {
            expandButton.setImage(UIImage(named: "arrow_up_gray"), for: .normal)
            showMoreLessLabel.text = LanguageHandler.sharedInstance().string(forKey: "Show less")
            showMoreLessViewBottomConstraint.constant = 0
            showMoreLessSeparatorHeightConstraint.constant = 0
            expandedViewContentTableView.reloadData()
        }
        
        isExpanded = !isExpanded
        self.expanded = isExpanded
    }
    
    func addRatePlanCards(cards: [UIView]) {
        customStackView.createStackWith(viewsArr: cards)
    }
    //------------------------------------------------------------------
    
    //MARK: Height Adjustment
    override func initializeContentView() {
        
        adjustHeights()
        
        var contentViewHeight: CGFloat = 15 + titleHeightConstraint.constant
        
        contentViewHeight += outerViewTopConstraint.constant + outerViewHeightConstraint.constant
        
        contentViewHeight += feesTopConstraint.constant + feesHeightConstraint.constant
        
        contentViewHeight += descriptionTopConstraint.constant + descriptionHeightConstraint.constant + descriptionBottomConstraint.constant
        contentViewHeight += descriptionSeparatorHeightConstraint.constant
        
        contentViewHeight += subDescriptionTopConstraint.constant + subDescriptionHeightConstraint.constant + subDescriptionBottomConstraint.constant
        contentViewHeight += subDescriptionSeparatorHeightConstraint.constant
        
        contentViewHeight += infoViewTopConstraint.constant + infoViewHeightConstraint.constant + infoViewBottomConstraint.constant
        contentViewHeight += infoViewSeparatorHeightConstraint.constant
        
        contentViewHeight += showMoreLessViewTopConstraint.constant + showMoreLessViewHeightConstraint.constant + showMoreLessViewBottomConstraint.constant
        contentViewHeight += showMoreLessSeparatorHeightConstraint.constant
        
        self.setContentViewHeight(contentViewHeight)
    }
    
    override func initializeExpandedView() {
        self.setExpandViewHeigh(CGFloat(tableViewData.count * 79) + 15)
    }
    
    func adjustHeights() {
        
        if titleString != "" {
            titleLabel.adjustHeight()
            titleHeightConstraint.constant = titleLabel.frame.size.height + 10
        }
        
        if feesString != "" {
            feesLabel.adjustHeight()
            feesTopConstraint.constant = 15
            descriptionBottomConstraint.constant = 15
            feesHeightConstraint.constant = feesLabel.frame.size.height
            descriptionSeparatorHeightConstraint.constant = 1
        }
        
        if descriptionString != "" {
            descriptionLabel.adjustHeight()
            descriptionTopConstraint.constant = 15
            descriptionBottomConstraint.constant = 15
            descriptionHeightConstraint.constant = descriptionLabel.frame.size.height
            
            if !isGrandfather {
                descriptionSeparatorHeightConstraint.constant = 1
            }
        }
        
        if subDescriptionString != "" {
            subDescriptionLabel.adjustHeight()
            subDescriptionTopConstraint.constant = 15
            subDescriptionBottomConstraint.constant = 15
            subDescriptionHeightConstraint.constant = subDescriptionLabel.frame.size.height
            subDescriptionSeparatorHeightConstraint.constant = 1
        }
        
        if feesString == "" && descriptionString == "" && subDescriptionString == "" {
            descriptionBottomConstraint.constant = 15
            descriptionBottomConstraint.constant = 15
            descriptionSeparatorHeightConstraint.constant = 1
        }
        
        if infoImg != "" || infoString != "" {
            infoLabel.adjustHeight()
            infoViewTopConstraint.constant = 15
            infoViewBottomConstraint.constant = 15
            infoViewSeparatorHeightConstraint.constant = 1
            infoViewHeightConstraint.constant = 15 + infoLabel.frame.size.height + 15
            
            if infoImageHeightConstraint.constant > infoLabel.frame.size.height {
                infoViewHeightConstraint.constant = 15 + infoImageHeightConstraint.constant + 15
            }
        }
        
        if isGrandfather {
            descriptionSeparatorHeightConstraint.constant = 0
            
            outerViewTopConstraint.constant  = 0
            outerViewHeightConstraint.constant = 0
            
            showMoreLessViewTopConstraint.constant = 0
            showMoreLessViewHeightConstraint.constant = 0
            expandButtonHeightConstraint.constant = 0
            showMoreLessViewBottomConstraint.constant = 0
            
            showMoreLessSeparatorHeightConstraint.constant = 0
        }
        
        if self.buttons == nil || self.buttons.count == 0 {
            expandableViewBottomConstraint.constant = 0
        } else {
            expandableViewBottomConstraint.constant = 15
        }
    }
    //------------------------------------------------------------------
    
    //MARK: Component Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }
    
    override func commonInit() {
        guard let view = Bundle.main.loadNibNamed("RatePlanCardView", owner: self, options: nil)?[0] as? UIView else {
            return
        }
        
        view.frame = bounds
        prepView()
        self.addSubview(view)
    }
    
    func prepView() {
        outerViewCustomStackView.layer.borderWidth = 1
        outerViewCustomStackView.layer.borderColor = UIColor(hexString: "CCCCCC")?.cgColor
        
        feesHeightConstraint.constant = 0
        descriptionHeightConstraint.constant = 0
        descriptionSeparatorHeightConstraint.constant = 0
        subDescriptionHeightConstraint.constant = 0
        subDescriptionSeparatorHeightConstraint.constant = 0
        infoViewHeightConstraint.constant = 0
        infoImageHeightConstraint.constant = 0
        infoViewSeparatorHeightConstraint.constant = 0
        
        feesTopConstraint.constant = 0
        descriptionTopConstraint.constant = 0
        descriptionBottomConstraint.constant = 0
        subDescriptionTopConstraint.constant = 0
        subDescriptionBottomConstraint.constant = 0
        infoViewTopConstraint.constant = 0
        infoViewBottomConstraint.constant = 0
        
        isExpanded = false
    }
    //------------------------------------------------------------------
}


extension RatePlanCardView : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 79
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatePlanDetailTableViewCell", for: indexPath) as! RatePlanDetailTableViewCell
        cell.setContent(detailModel: tableViewData[indexPath.row])
        return cell
    }
}
