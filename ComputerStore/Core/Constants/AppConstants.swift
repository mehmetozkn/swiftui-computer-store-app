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
        
        static let buttonHeightSize = UIScreen.screenHeight * 0.05
        static let buttonWidthSize = UIScreen.screenWidth * 0.6
    }
    
    struct Radius {
        static let cornerRadiusValue : CGFloat = 8

    }
    
    struct Theme {
        static let textFieldOpacityValue : Double = 0.05
    }
}
