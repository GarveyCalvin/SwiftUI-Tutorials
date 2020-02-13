//
//  GCPresentedView.swift
//  GCSheetModalView
//
//  Created by GarveyCalvin on 2020/2/13.
//  Copyright © 2020 GarveyCalvin. All rights reserved.
//

import SwiftUI

struct GCPresentedView: View {
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        Button(action: {
            self.mode.wrappedValue.dismiss()
        }, label: {
            Text("Dismiss")
        })
    }
}

struct GCPresentedView_Previews: PreviewProvider {
    static var previews: some View {
        GCPresentedView()
    }
}
