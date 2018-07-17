//
//  DoubleFrameLayout.swift
//  FrameLayoutKit
//
//  Created by Nam Kennic on 7/17/18.
//

import UIKit

public enum LayoutDirection : Int {
    case horizontal = 0 // left - right
    case vertical // top - bottom
    case auto
}

public enum LayoutAlignment : Int {
	case top = 0
    case bottom
    static let left: LayoutAlignment = .top
    static let right: LayoutAlignment = .bottom
    case split
    case center
}

public class DoubleFrameLayout: FrameLayout {
	
	public var layoutAlignment: LayoutAlignment = .top
	public var layoutDirection: LayoutDirection = .auto
	public var spacing: CGFloat = 0 {
		didSet {
			if spacing != oldValue {
				setNeedsLayout()
			}
		}
	}
	public var splitRatio: CGFloat = 0.5
	
	public var frameLayout1: FrameLayout? = nil {
		didSet {
			if frameLayout1 != oldValue {
				if let oldFrameLayout = oldValue, oldFrameLayout.superview == self {
					oldFrameLayout.removeFromSuperview()
				}
				
				if frameLayout1 != nil && frameLayout1 != self {
					self.addSubview(frameLayout1!)
				}
			}
		}
	}
	
	public var frameLayout2: FrameLayout? = nil {
		didSet {
			if frameLayout2 != oldValue {
				if let oldFrameLayout = oldValue, oldFrameLayout.superview == self {
					oldFrameLayout.removeFromSuperview()
				}
				
				if frameLayout2 != nil && frameLayout2 != self {
					self.addSubview(frameLayout2!)
				}
			}
		}
	}
	
	override public var shouldCacheSize: Bool {
		didSet {
			self.frameLayout1?.shouldCacheSize = shouldCacheSize
			self.frameLayout2?.shouldCacheSize = shouldCacheSize
		}
	}
	
	override public var allowContentVerticalGrowing: Bool {
		didSet {
			self.frameLayout1?.allowContentVerticalGrowing = allowContentVerticalGrowing
			self.frameLayout2?.allowContentVerticalGrowing = allowContentVerticalGrowing
		}
	}
	
	override public var allowContentVerticalShrinking: Bool {
		didSet {
			self.frameLayout1?.allowContentVerticalShrinking = allowContentVerticalShrinking
			self.frameLayout2?.allowContentVerticalShrinking = allowContentVerticalShrinking
		}
	}
	
	override public var allowContentHorizontalGrowing: Bool {
		didSet {
			self.frameLayout1?.allowContentHorizontalGrowing = allowContentHorizontalGrowing
			self.frameLayout2?.allowContentHorizontalGrowing = allowContentHorizontalGrowing
		}
	}
	
	override public var allowContentHorizontalShrinking: Bool {
		didSet {
			self.frameLayout1?.allowContentHorizontalShrinking = allowContentHorizontalShrinking
			self.frameLayout2?.allowContentHorizontalShrinking = allowContentHorizontalShrinking
		}
	}
	
	override public var frame: CGRect {
		didSet {
			self.setNeedsLayout()
		}
	}
	
	override public var bounds: CGRect {
		didSet {
			self.setNeedsLayout()
		}
	}
	
	// MARK: -
	
	convenience init(direction: LayoutDirection, alignment: LayoutAlignment = .top, views: [UIView]? = nil) {
		self.init()
		
		self.layoutDirection = direction
		self.layoutAlignment = alignment
		
		if let views = views {
			let count = views.count
			
			if count > 0 {
				var targetView = views[0]
			}
		}
	}
	
	override init() {
		super.init()
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	// MARK: -
	
	override public func setNeedsLayout() {
		super.setNeedsLayout()
		self.frameLayout1?.setNeedsLayout()
		self.frameLayout2?.setNeedsLayout()
	}
	
}
