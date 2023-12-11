//
//  AppConstants.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 7.12.2023.
//

import SwiftUI

struct AppConstants {
    
    struct Sizes {
        static let textFieldHeightValue = UIScreen.screenHeight * 0.05
        static let textFieldWidthValue = UIScreen.screenWidth *  0.8
        
        static let generalButtonHeightValue = UIScreen.screenHeight * 0.05
        static let generalButtonWidthValue = UIScreen.screenWidth * 0.8
        
        static let addButtonWidthSize = UIScreen.screenWidth * 0.12
        
        static let cartViewHeightSize = UIScreen.screenHeight * 0.2
        
        static let authTextSpacingValue : CGFloat = 3
        static let productCardSpacingValue : CGFloat = 10
    }
    
    struct Radius {
        static let radiusValue : CGFloat = 8

    }
    
    struct Theme {
        static let textFieldOpacityValue : Double = 0.05
        static let backgroundOpacityValue : Double = 0.8
        static let buttonOpacityValue : Double = 0.8
        static let productCardOpacityValue : Double = 0.5
        static let buttonLineWidthValue : Double = 6
    }
}
