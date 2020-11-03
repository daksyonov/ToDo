//
//  DAButton.swift
//  ToDo
//
//  Created by developer03 on 02.11.2020.
//

import UIKit

@IBDesignable
class DAButton: UIButton {
    
    enum DAButtonSetup {
        case defaultRed
    }
    
    @IBInspectable var bgColor: UIColor? {
        didSet { self.backgroundColor = bgColor }
    }
    
    @IBInspectable var corners: CGFloat = 0.0 {
        didSet { self.layer.cornerRadius = corners }
    }
    
    @IBInspectable var borders: CGFloat = 0.0 {
        didSet { self.layer.borderWidth = borders }
    }
    
    @IBInspectable var bordersColor: CGColor? {
        didSet { self.layer.borderColor = bordersColor }
    }
    
    @IBInspectable var txtColor: UIColor? {
        didSet { self.setTitleColor(txtColor, for: .normal) }
    }
    
    var onTapBegin: ((DAButton) -> Void) = { button in
        button.alpha = 0.75
    }
    
    var onTapEnd: ((DAButton) -> Void) = { button in
        button.alpha = 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.onTapBegin(self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.onTapEnd(self)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        self.onTapEnd(self)
    }
    
    func setup(mode: DAButtonSetup, title: String) {
        switch mode {
        case .defaultRed:
            self.bgColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            self.corners = 5
            self.borders = 1
            self.txtColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        
        self.setTitle(title, for: .normal)
    }
    
    func fillSuperview() {
        if let superview = superview {
            self.widthAnchor.constraint(equalTo: superview.widthAnchor).isActive = true
            self.heightAnchor.constraint(equalTo: superview.heightAnchor).isActive = true
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        }
    }
}
