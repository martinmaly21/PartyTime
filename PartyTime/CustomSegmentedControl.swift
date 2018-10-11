//
//  CustomSegmentedControl.swift
//  PartyTime
//
//  Created by Martin Maly on 2018-10-11.
//  Copyright © 2018 Martin Maly. All rights reserved.
//

import UIKit

//@IBDesignables allows you to see your changes right there on the StoryBoard
@IBDesignable
class CustomSegmentedControl: UIView {
    var buttons = [UIButton]()
    var selector: UIView!
//@IBInspectable means whatever property comes next you will be able to see in attribute inspector (storyboard)
@IBInspectable
    var borderWidth: CGFloat = 0 {
    didSet {
        layer.borderWidth = borderWidth
        }
        }
    
@IBInspectable
    var borderColour: UIColor = .white {
    didSet {
    layer.borderColor = borderColour.cgColor
        }
        }
    
@IBInspectable
    var selectorColour: UIColor = .white {
    didSet {
        updateView()
    }
    }
    
@IBInspectable
    var selectorTextColour: UIColor = .white {
    didSet {
        updateView()
    }
    }
    
@IBInspectable
    var commaSeperatedButtonTitles: String = "" {
    didSet {
        updateView()
    }
    }

@IBInspectable
    var textColour: UIColor = .white {
    didSet {
            updateView()
    }
    }
    
    func updateView() {
        buttons.removeAll()
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        let buttonTitles = commaSeperatedButtonTitles.components(separatedBy: ",")
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColour, for: .normal)
            
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColour, for: .normal)
        
        
       let selectorWidth = frame.width / CGFloat(buttonTitles.count)
       selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
       selector.layer.cornerRadius = frame.height / 2
       selector.backgroundColor = selectorColour
       addSubview(selector)
        
        
        let sv = UIStackView(arrangedSubviews: buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    }
    
    
    override func draw(_ rect: CGRect) {
        //Drawing Code
        layer.cornerRadius = frame.height / 2
        
    }
    
    @objc func buttonTapped(button: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            
            btn.setTitleColor(textColour, for: .normal)
            
            if btn == button {
                let selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.2, animations: {
                    self.selector.frame.origin.x = selectorStartPosition
                })
                
                btn.setTitleColor(selectorTextColour, for: .normal)
        
        }
        
        
        
    }
    
    }
    
}

