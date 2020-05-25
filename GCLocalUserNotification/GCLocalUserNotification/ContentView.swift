//
//  ContentView.swift
//  GCLocalUserNotification
//
//  Created by GarveyCalvin on 2020/5/22.
//  Copyright © 2020 GarveyCalvin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: GCTimeIntervalView()) {
                    Text("UNTimeIntervalNotificationTrigger")
                }
                NavigationLink(destination: GCCalendarView()) {
                    Text("UNCalendarNotificationTrigger")
                }
            }
            .navigationBarTitle("Main")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
