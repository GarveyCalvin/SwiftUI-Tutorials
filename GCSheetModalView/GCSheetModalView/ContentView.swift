//
//  ContentView.swift
//  GCSheetModalView
//
//  Created by GarveyCalvin on 2020/2/13.
//  Copyright © 2020 GarveyCalvin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented = false
    
    var body: some View {
        Button(action: {
            self.isPresented = true
        }, label: {
            Text("Present Modally")
        })
        .sheet(isPresented: $isPresented) {
            GCPresentedView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
