//
//  GCCalendarView.swift
//  GCLocalUserNotification
//
//  Created by GarveyCalvin on 2020/5/22.
//  Copyright © 2020 GarveyCalvin. All rights reserved.
//

import SwiftUI

struct GCCalendarView: View {
    @State var alert = false
    @State var date = Date()
    @State var isEveryDay = false
    
    var body: some View {
        VStack {
            DatePicker(selection: $date, label: { Text("Date") })
            
            Toggle(isOn: $isEveryDay) {
                Text("是否每天进行提醒")
            }
            
            Button(action: {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (status, err) in
                    if !status {
                        self.alert.toggle()
                        return
                    }
                    
                    let content = UNMutableNotificationContent()
                    content.title = "添加朋友 对着月亮敲代码"
//                    content.subtitle = "子标题"
                    content.body = "公众号 gh_6a83a7c19315"
                    content.badge = 1
                    
                    let dateComponents =  Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self.date)
//                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: self.isEveryDay)
                    let trigger = UNCalendarNotificationTrigger(dateMatching: DateComponents(second: 5), repeats: true)
                    let request = UNNotificationRequest(identifier: "Notification", content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request) { err in
                        err != nil ? print("添加本地通知错误", err!.localizedDescription) : print("添加本地通知成功")
                    }
                }
            }) {
                Text("本地通知")
            }
        }
        .alert(isPresented: $alert) {
            Alert(title: Text("APP需要你给予通知权限，才能每天提醒你记录成功日记噢，点击确定前往设置开启。 "),
                  message: nil,
                  primaryButton: .cancel(Text("取消"), action: {}),
                  secondaryButton: .default(Text("确定"), action: {
                    guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, completionHandler: nil)
                    }
                  }))
        }
    }
}

struct GCCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        GCCalendarView()
    }
}
