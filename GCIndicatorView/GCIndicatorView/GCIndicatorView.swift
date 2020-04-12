//
//  GCIndicatorView.swift
//  GCIndicatorView
//
//  Created by GarveyCalvin on 2020/4/12.
//  Copyright © 2020 GarveyCalvin. All rights reserved.
//

import SwiftUI

struct GCIndicatorView: UIViewRepresentable {
    @Binding var isShowing: Bool
    
    let style: UIActivityIndicatorView.Style
    var color: UIColor? = nil
    
    func makeUIView(context: UIViewRepresentableContext<GCIndicatorView>) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: style)
        activityIndicatorView.color = color
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<GCIndicatorView>) {
        isShowing ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
    typealias UIViewType = UIActivityIndicatorView
}

struct GCIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        GCIndicatorView(isShowing: .constant(false), style: .large)
    }
}
