import SwiftUI
<<<<<<< HEAD
import UIKit
=======
>>>>>>> main

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
<<<<<<< HEAD
                    Text("Ranking")
                }
            
            HabitsViewControllerWrapper()
                .tabItem {
=======
                    Text("Rankings")
                }
            
            HabitsViewControllerWrapper()
                .tabItem{
>>>>>>> main
                    Image(systemName: "checklist")
                    Text("Habits")
                }
            
        }
    }
}

<<<<<<< HEAD
// Use UIViewControllerRepresentable for each view controller
=======

>>>>>>> main
struct CalendarViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CalendarViewController {
        return CalendarViewController()
    }

    func updateUIViewController(_ uiViewController: CalendarViewController, context: Context) {
        // Update the view controller if needed
    }
}


<<<<<<< HEAD
struct RankControllerWrapper: UIViewControllerRepresentable {
=======

struct RankControllerWrapper: UIViewControllerRepresentable {
    
>>>>>>> main
    func makeUIViewController(context: Context) -> RankController {
        return RankController()
    }

    func updateUIViewController(_ uiViewController: RankController, context: Context) {
<<<<<<< HEAD
        // Update the view controller if needed
=======
//         Update the view controller if needed
>>>>>>> main
    }
}


struct HabitsViewControllerWrapper: UIViewControllerRepresentable {
<<<<<<< HEAD
=======
    
>>>>>>> main
    func makeUIViewController(context: Context) -> HabitsViewController {
        return HabitsViewController()
    }

    func updateUIViewController(_ uiViewController: HabitsViewController, context: Context) {
<<<<<<< HEAD
        // Update the view controller if needed
    }
}

=======
//         Update the view controller if needed
    }
}



>>>>>>> main

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

