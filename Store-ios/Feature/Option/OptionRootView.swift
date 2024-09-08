//
//  OptionRootView.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/7/24.
//

import SwiftUI

struct OptionRootView: View {
    @ObservedObject var viewModel: OptionViewModel
    
    var body: some View {
        Text("Option View")
    }
}

#Preview {
    OptionRootView(viewModel: OptionViewModel())
}
