//
//  SColor.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/1/24.
//

import UIKit
import SwiftUI

enum SColor { }

extension SColor {
    enum UIKit {
        static var bk: UIColor = UIColor(named: "bk") ?? UIColor.black
        static var wh: UIColor = UIColor(named: "wh") ?? UIColor.white
        static var blue: UIColor = UIColor(named: "uclaBlue") ?? UIColor.systemBlue
        static var gold: UIColor = UIColor(named: "uclaGold") ?? UIColor.systemYellow
        static var lighterBlue: UIColor = UIColor(named: "uclaLighterBlue") ?? UIColor.systemTeal
        static var lightestBlue: UIColor = UIColor(named: "uclaLightestBlue") ?? UIColor.gray
        static var darkerBlue: UIColor = UIColor(named: "uclaDarkerBlue") ?? UIColor.systemIndigo
        static var darkestBlue: UIColor = UIColor(named: "uclaDarkestBlue") ?? UIColor.blue
        static var darkerGold: UIColor = UIColor(named: "uclaDarkerGold") ?? UIColor.orange
        static var darketGold: UIColor = UIColor(named: "uclaDarkestGold") ?? UIColor.brown
    }
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
        static var darkestGold: Color = Color("uclaDarkestGold", bundle: nil)
    }
}
