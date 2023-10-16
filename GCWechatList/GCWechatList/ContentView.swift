//
//  ContentView.swift
//  GCWechatList
//
//  Created by GarveyCalvin on 2020/4/28.
//  Copyright © 2020 GarveyCalvin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let bgColor = Color(uiColor: UIColor(red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 245.0 / 255.0, alpha: 1))
    
    var body: some View {
        List {
            ForEach(0 ..< 20) { item in
                GCMainRow()
                    .listRowInsets(EdgeInsets()) //
                    .listRowSeparator(.hidden) // iOS15新增的API,隐藏默认分隔线
                    .listRowBackground(bgColor) // 设置每行的背景颜色
            }
        }
        .listStyle(PlainListStyle())
        .background(bgColor) // 同时也需要设置背景颜色，不然上边和下边会漏出来
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GCMainRow: View {
    init() {
        print("aaaaaa", self)
    }
    var body: some View {
        HStack(alignment: .top) {
            Image("1")
                .resizable()
                .frame(width: 46, height: 46)
                .cornerRadius(6)
                .overlay(
                    Color.red
                        .overlay(
                            Text("1")
                                .font(.caption)
                                .foregroundColor(.white)
                    )
                        .frame(width: 16, height: 16)
                        .cornerRadius(8)
                        .offset(x: 23, y: -23)
            )
            
            VStack {
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text("女神")
                            .font(.body)

                        Spacer()

                        Text("下午 2:55")
                            .font(.caption)
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                    Text("对不起，你是个好人")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                }
                .padding(.trailing)
                Divider()
            }
        }
        .padding(.top)
        .padding(.leading)
    }
}
