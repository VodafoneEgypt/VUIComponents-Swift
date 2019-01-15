//
//  CustomStackView.swift
//  CustomStackView
//
//  Created by Samar Younan on 12/21/18.
//  Copyright © 2018 Samar Younan. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CustomStackView: UIView {
    
    var isSeparatorShow = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    
    func commonInit() {
        
        guard let view = Bundle.main.loadNibNamed("CustomStackView", owner: self, options: nil)?.first as? UIView else {
            return
        }

        self.addSubview(view)
    }
    
    
    func createStackWith(viewsArr: [UIView]) {

        let stackview = UIStackView(arrangedSubviews: viewsArr)
        var separatorCounter = 0
        
        for i in 0...stackview.arrangedSubviews.count - 1 {
            stackview.axis = .horizontal
            stackview.distribution = .fillProportionally
            stackview.alignment = .fill
            stackview.spacing = 10
            stackview.translatesAutoresizingMaskIntoConstraints = false
            stackview.addArrangedSubview(viewsArr[i])
            
            if let firstView = stackview.arrangedSubviews.first {
                viewsArr[i].widthAnchor.constraint(equalTo: firstView.widthAnchor).isActive = true
            }
        
            //separator
            if isSeparatorShow {
                if separatorCounter != (stackview.arrangedSubviews.count - separatorCounter - 1) {
                    
                    let containerView = UIView()
                    containerView.snp.makeConstraints { (make) in
                        make.width.equalTo(1.0)
                    }
                    
                    let separator = UIView()
                    separator.backgroundColor = UIColor.lightGray
                    containerView.addSubview(separator)
                    
                    separator.snp.makeConstraints { (make) in
                        make.width.equalTo(1.0)
                        make.height.equalTo(containerView).multipliedBy(0.6)
                        make.center.equalTo(containerView)
                    }

                    stackview.addArrangedSubview(containerView)
                    
                    separatorCounter += 1
                }
            }
        }
        
        self.addSubview(stackview)
    
        stackview.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.top.equalTo(self)
            make.bottom.equalTo(self)
        }

    }
}
