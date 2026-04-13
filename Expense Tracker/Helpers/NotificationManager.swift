//
//  NotificationManager.swift
//  Expense Tracker
//
//  Created by Aryan Verma on 13/04/26.
//

import Foundation
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()
    
    func scheduleDailyReminder(at time: Date) {
        let content = UNMutableNotificationContent()
            content.title = "Expense Reminder"
            content.sound = .default
            content.body = "Did you log your expenses today?"
        
        let component = Calendar.current.dateComponents([.hour, .minute], from: time)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: true)
        
        let request = UNNotificationRequest(identifier: "dailyReminder", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    func scheduleExpenseReminder(at time: Date, amount: Double, title: String, id: UUID) {
        let content = UNMutableNotificationContent()
            content.title = "Expense Reminder"
            content.body = "\(amount.formatted(.currency(code: Locale.current.currency?.identifier ?? "USD"))) for \(title)"
            content.sound = .default
        
        let component = Calendar.current.dateComponents([.hour, .minute, .day, .month, .year], from: time)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: false)
        
        let request = UNNotificationRequest(identifier: id.uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    func cancelReminder(of id: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
    }
    
    func cancelDailyReminder() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["dailyReminder"])
    }
    
    func requestPermission(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {
            (granted, error) in
            DispatchQueue.main.async {
                completion(granted)
            }
        }
    }
}
