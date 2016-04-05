//
//  AppusPageControl.swift
//  demo
//
//  Created by Serhii Syrotynin on 12/21/15.
//  Copyright © 2015 appus.me. All rights reserved.
//

import UIKit

@IBDesignable public class APPageControl: UIControl {
    
    public var currentPage: Int = 0{
        didSet{
            currentPage = min(currentPage, pages - 1)
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var pages: Int = 2{
        didSet{
            
            pages = max(2, pages)
            
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var selectedColour: UIColor = UIColor.blackColor(){
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var tintColour: UIColor = UIColor.blackColor(){
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var margin: CGFloat = 12.0{
        didSet{
            setNeedsDisplay()
        }
    }
    
    
    @IBInspectable public var circleSize: CGFloat = 4.0{
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var circleBorderSize: CGFloat = 1.0{
        didSet{
            setNeedsDisplay()
        }
    }
    
    
    @IBInspectable public var selectedCircle: UIImage? = nil{
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var defaultCircle: UIImage? = nil{
        didSet{
            setNeedsDisplay()
        }
    }
    
    //MARK: - Drawing
    
    override public func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        // save context
        CGContextSaveGState(context)
        
        // allow antialiasing
        CGContextSetAllowsAntialiasing(context, true)
        
        //geometry
        let currentBounds = bounds
        
        let dotsWidth = CGFloat(pages) * circleSize + max(0, CGFloat(pages - 1)) * margin
        var x = CGRectGetMidX(currentBounds) - dotsWidth / 2
        let y = CGRectGetMidY(currentBounds) - circleSize / 2
        
        CGContextSetLineWidth(context, circleBorderSize)
        
        // actually draw the dots
        for i in 0..<pages{
            
            let dotRect = CGRectMake(x, y, circleSize, circleSize)
            
            if i == currentPage {
                if(selectedCircle != nil){
                    selectedCircle!.drawInRect(dotRect)
                }
                else{
                    CGContextSetFillColorWithColor(context, selectedColour.CGColor)
                    CGContextFillEllipseInRect(context, dotRect)
                    CGContextSetStrokeColorWithColor(context, selectedColour.CGColor)
                    CGContextStrokeEllipseInRect(context, dotRect)
                }
            }
            else {
                if(defaultCircle != nil){
                    defaultCircle!.drawInRect(dotRect)
                }
                else{
                    CGContextSetStrokeColorWithColor(context, tintColour.CGColor)
                    CGContextStrokeEllipseInRect(context, dotRect)
                }
            }
            
            x += circleSize + margin
        }
        
        // restore the context
        CGContextRestoreGState(context)
    }
    
    //MARK: - Actions Handling
    
    override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // get the touch location
        
        let theTouch = touches.first
        let touchLocation = theTouch?.locationInView(self);
        
        // check whether the touch is in the right or left hand-side of the control
        if touchLocation!.x < (self.bounds.size.width / 2){
            currentPage = max(currentPage - 1, 0)
        }
        else{
            currentPage = min(currentPage + 1, pages - 1)
        }
        
        // send the value changed action to the target
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
        setNeedsDisplay()
    }
    
}

