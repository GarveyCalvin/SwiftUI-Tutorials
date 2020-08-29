//
//  GCColorView.swift
//  GCGridView
//
//  Created by GarveyCalvin on 2020/7/27.
//  Copyright © 2020 GarveyCalvin. All rights reserved.
//

import SwiftUI

struct GCColorView: View {
    var data: [Color] {
        [
            Color.random(),
            Color.random(),
            Color.random(),
            Color.random(),
            Color.random(),
            Color.random()
        ]
    }

    var body: some View {
        VStack {
            ForEach(0..<data.count) { index in
                self.data[index]
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct GCColorView_Previews: PreviewProvider {
    static var previews: some View {
        GCColorView()
    }
}

extension Double {
    static func randomData() -> Double {
        Double(arc4random()) / Double(UInt32.max)
    }
}

extension Color {
    static func random() -> Color {
        .init(red: Double.randomData(), green: Double.randomData(), blue: Double.randomData())
    }
}
