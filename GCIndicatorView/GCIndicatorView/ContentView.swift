//
//  ContentView.swift
//  GCIndicatorView
//
//  Created by GarveyCalvin on 2020/4/12.
//  Copyright © 2020 GarveyCalvin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GCHomeView()
    }
}

struct GCHomeView: View {
    @State var isShowing = false
    
    var body: some View {
        ZStack {
            Button(action: {
                self.isShowing = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.isShowing = false
                }
            }) {
                Text("网络请求开始")
            }
            if isShowing {
                GCIndicatorView(isShowing: $isShowing, style: .large)
            }
        }
        .disabled(isShowing)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
