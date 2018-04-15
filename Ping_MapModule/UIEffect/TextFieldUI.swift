//
//  TextFieldUI.swift
//  Ping_MapModule
//
//  Created by Developer on 15/04/2018.
//  Copyright © 2018 XenoSoft. All rights reserved.
//

import Foundation
import UIKit

extension String{
    
//true if self contains characters
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

//for controlling displays and editable text includes boilerplates animation setup
open class TextFieldUI : UITextField {
    
    //Animataion type
    //  textEntry: animation effect when focusing textfield
    //  textDisplay: animation effect when textfield lose focus
    public enum AnimationType: Int {
        case textEntry
        case textDisplay
    }
    
    //Closure executed when animation completed
    public typealias AnimationCompletionHandler = (_ type: AnimationType)->()
    
    //UILabel that holds all placeholder information
    open let placeholderLabel = UILabel()
    
    
    //Error Handler
    
    //Creates all animation that are used to leave the text field in the entering text state
    open func animateViewsForTextEntry(){
        fatalError("\(#function) must be ovverride")
    }
    open func animateViewsForTextDisplay(){
        fatalError("\(#function) must be ovverride")
    }
    
    //Textfield ended animation
    open var animationCompletionHandler: AnimationCompletionHandler?
    
    //Receiver image within passed in rectangle
        // portion of view bound need to be updated
    open func drawViewsForRect(_ rect: CGRect) {
        fatalError("\(#function) must be overriden")
    }
    open func updateViewsForBoundChange(_ bounds: CGRect){
         fatalError("\(#function) must be overriden")
    }
    override open func draw(_ rect: CGRect) {
        guard isFirstResponder == false else {return}
        drawViewsForRect(rect)
    }
    
    override open func drawPlaceholder(in rect: CGRect) {
        //dont draw placeholder
    }
    
    override open var text: String? {
        didSet {
            if let text = text, text.isNotEmpty{
                animateViewsForTextEntry()
            }else{
                animateViewsForTextDisplay()
            }
            
        }
    }
    
    override open func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview != nil {
            NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidEndEditing), name: NSNotification.Name.UITextFieldTextDidEndEditing, object: self)
            NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidBeginEditing), name: NSNotification.Name.UITextFieldTextDidBeginEditing, object: self)
            
        }else{
            NotificationCenter.default.removeObserver(self)
            
        }
    }
    
    @objc open func textFieldDidBeginEditing() {
        animateViewsForTextEntry()
    }
    
    @objc open func textFieldDidEndEditing(){
        animateViewsForTextDisplay()
    }
    
    
    open override func prepareForInterfaceBuilder() {
        fatalError("\(#function) must be overriden")
        
    }
    
}

