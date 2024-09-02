//
//  SFont.swift
//  Store-ios
//
//  Created by TaeWook Park on 8/27/24.
//

import UIKit

enum SFont {
    // UILable().font = SFont.r10
    static var r10: UIFont = UIFont.systemFont(ofSize: 10, weight: .regular)
    
    // 12
    static var r12: UIFont = UIFont.systemFont(ofSize: 12, weight: .regular)
    static var m12: UIFont = UIFont.systemFont(ofSize: 12, weight: .medium)
    static var b12: UIFont = UIFont.systemFont(ofSize: 12, weight: .bold)
    
    // 14
    static var r14: UIFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    static var b14: UIFont = UIFont.systemFont(ofSize: 14, weight: .bold)
    
    // 16
    static var m16: UIFont = UIFont.systemFont(ofSize: 16, weight: .medium)
    static var b16: UIFont = UIFont.systemFont(ofSize: 16, weight: .bold)
     
    // 17
    static var l17: UIFont = UIFont.systemFont(ofSize: 17, weight: .light)
    static var m17: UIFont = UIFont.systemFont(ofSize: 17, weight: .medium)
    static var b17: UIFont = UIFont.systemFont(ofSize: 17, weight: .bold)
    
    // 20
    static var m20: UIFont = UIFont.systemFont(ofSize: 20, weight: .medium)
    static var b20: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)
}
