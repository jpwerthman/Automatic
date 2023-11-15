import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        // Use a TabView to create tabs
        TabView {
            // First Tab
            CalendarViewControllerWrapper()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }

            
            RankControllerWrapper()
                .tabItem {
                    Image(systemName: "rosette")
                    Text("Ranking")
                }
            
            HabitsViewControllerWrapper()
                .tabItem {
                    Image(systemName: "checklist")
                    Text("Habits")
                }
            
        }
    }
}

// Use UIViewControllerRepresentable for each view controller
struct CalendarViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CalendarViewController {
        return CalendarViewController()
    }

    func updateUIViewController(_ uiViewController: CalendarViewController, context: Context) {
        // Update the view controller if needed
    }
}


struct RankControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> RankController {
        return RankController()
    }

    func updateUIViewController(_ uiViewController: RankController, context: Context) {
        // Update the view controller if needed
    }
}


struct HabitsViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> HabitsViewController {
        return HabitsViewController()
    }

    func updateUIViewController(_ uiViewController: HabitsViewController, context: Context) {
        // Update the view controller if needed
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

