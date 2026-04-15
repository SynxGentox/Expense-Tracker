import SwiftUI

enum SettingsDestination {
    case profile
    case changePassword
    case notifications
    case language
    case theme
    case currency
    case support
    case rateUs
    case feedback
    case about
}

struct SettingsItems {
    var title: String
    var icon: String
    var destination: SettingsDestination
}

struct SettingsView: View {
    let arrAcc = [
        SettingsItems(title: "Profile", icon: "person.circle", destination: .profile),
        SettingsItems(title: "Change password", icon: "person.badge.key", destination: .changePassword)
    ]
    let arrGen = [
        SettingsItems(title: "Notifications", icon: "bell", destination: .notifications),
        SettingsItems(title: "Language", icon: "a.circle", destination: .language),
        SettingsItems(title: "Theme", icon: "swatchpalette", destination: .theme),
        SettingsItems(title: "Currency", icon: "dollarsign.circle", destination: .currency)
    ]
    let arrPre = [
        SettingsItems(title: "Support", icon: "questionmark.circle", destination: .support),
        SettingsItems(title: "Rate us", icon: "star.fill", destination: .rateUs),
        SettingsItems(title: "Send Feedback", icon: "ladybug", destination: .feedback),
        SettingsItems(title: "About", icon: "info.circle", destination: .about)
    ]

    var body: some View {
        Form {
            // Profile header
            ZStack(alignment: .leading) {
                NavigationLink(value: SettingsDestination.profile) {
                    Image(systemName: "person.and.background.dotted")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 44, alignment: .leading)
                        .padding(.trailing)
                        .foregroundStyle(.accent)
                }
                Text("Gentox")
                    .amountFontStyleExt(numSize: FontT.titleF.valueF)
                    .padding(.leading, 70)
                Button { } label: {
                    Image(systemName: "square.and.arrow.up")
                        .buttonIconStyleExt(
                            buttonHeight: ButtonT.BHeight.circleH.valusBH,
                            buttonWidth: ButtonT.BWidth.smallW.valueBW,
                            iconColor: ButtonT.BColor.ColPrimary.valueBC,
                            alignLeft: false
                        )
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            }

            Section("Account") {
                ForEach(arrAcc, id: \.title) { item in
                    NavigationLink(value: item.destination) {
                        SettingsRow(icon: item.icon, title: item.title)
                    }
                }
            }

            Section("General") {
                ForEach(arrGen, id: \.title) { item in
                    NavigationLink(value: item.destination) {
                        SettingsRow(icon: item.icon, title: item.title)
                    }
                }
            }

            Section("Preferences") {
                ForEach(arrPre, id: \.title) { item in
                    NavigationLink(value: item.destination) {
                        SettingsRow(icon: item.icon, title: item.title)
                    }
                }
            }
        }
        .navigationDestination(for: SettingsDestination.self) { destination in
            switch destination {
            case .profile:          ProfileView()
            case .changePassword:   EmptyView()
            case .notifications:    NotificationsToggleView()
            case .language:         EmptyView()
            case .theme:            EmptyView()
            case .currency:         EmptyView()
            case .support:          EmptyView()
            case .rateUs:           EmptyView()
            case .feedback:         EmptyView()
            case .about:            EmptyView()
            }
        }
        .toolbarVisibility(.hidden, for: .tabBar)
    }
}

// Extracted to avoid repeating HStack 3 times
private struct SettingsRow: View {
    let icon: String
    let title: String
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 24, maxHeight: .infinity)
                .foregroundStyle(.accent)
                .padding(.trailing, 6)
            Text(title)
                .foregroundStyle(ButtonT.BColor.ColPrimary.valueBC)
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
