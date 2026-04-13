//
//  NotificaitonsView.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 13/04/26.
//

import SwiftUI
import UserNotifications

struct NotificationsToggleView: View {
    @AppStorage("dailyReminder") var dailyReminder: Bool = false
    @AppStorage("scheduleReminder") var scheduleReminder: Bool = false
    var body: some View {
        Form {
            Toggle("Daily Reminder", isOn: $dailyReminder)
                .onChange(of: dailyReminder) { _, newValue in
                    if newValue {
                        NotificationManager.shared.requestPermission { granted in
                            if !granted {
                                dailyReminder = false
                            }
                        }
                    }
                }
            Toggle("Scheduled Reminder", isOn: $scheduleReminder)
                .onChange(of: scheduleReminder) { _, newValue in
                    if newValue {
                        NotificationManager.shared.requestPermission { granted in
                            if !granted {
                                scheduleReminder = false
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    NotificationsToggleView()
}
