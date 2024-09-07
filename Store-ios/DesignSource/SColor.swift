//
//  SColor.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/1/24.
//

import UIKit
import SwiftUI

enum SColor {

}

extension SColor {
    static var bk: UIColor = UIColor(resource: .bk)
    static var wh: UIColor = UIColor(resource: .wh)
    static var blue: UIColor = UIColor(resource: .uclaBlue)
    static var gold: UIColor = UIColor(resource: .uclaGold)
    static var lighterBlue: UIColor = UIColor(resource: .uclaLighterBlue)
    static var lightestBlue: UIColor = UIColor(resource: .uclaLightestBlue)
    static var darkerBlue: UIColor = UIColor(resource: .uclaDarkerBlue)
    static var darkestBlue: UIColor = UIColor(resource: .uclaDarkestBlue)
    static var darkerGold: UIColor = UIColor(resource: .uclaDarkerGold)
    static var darketGold: UIColor = UIColor(resource: .uclaDarkestGold)
}

extension SColor {
    enum SwiftUI {
        static var bk: Color = Color("bk", bundle: nil)
        static var wh: Color = Color("wh", bundle: nil)
        static var blue: Color = Color("uclaBlue", bundle: nil)
        static var gold: Color = Color("uclaGold", bundle: nil)
        static var lighterBlue: Color = Color("uclaLighterBlue", bundle: nil)
        static var lightestBlue: Color = Color("uclaLightestBlue", bundle: nil)
        static var darkerBlue: Color = Color("uclaDarkerBlue", bundle: nil)
        static var darkestBlue: Color = Color("uclaDarkestBlue", bundle: nil)
        static var darkerGold: Color = Color("uclaDarkerGold", bundle: nil)
        static var darketGold: Color = Color("uclaDarkestGold", bundle: nil)
    }
}
