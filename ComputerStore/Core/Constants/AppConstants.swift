//
//  AppConstants.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 7.12.2023.
//

import SwiftUI

struct AppConstants {
    
    struct Sizes {
        static let textFieldHeightSize = UIScreen.screenHeight * 0.05
        static let textFieldWidthSize = UIScreen.screenWidth *  0.8
        
        static let generalButtonHeightSize = UIScreen.screenHeight * 0.05
        static let generalButtonWidthSize = UIScreen.screenWidth * 0.6
        
        static let addButtonWidthSize = UIScreen.screenWidth * 0.12
        
        static let cartViewHeightSize = UIScreen.screenHeight * 0.2
        
    }
    
    struct Radius {
        static let cornerRadiusValue : CGFloat = 8

    }
    
    struct Theme {
        static let textFieldOpacityValue : Double = 0.05
        static let backgroundOpacityValue : Double = 0.8
    }
}
