//
//  RankController.swift
//  Automatic
//
//  Created by Nikos Claman on 11/14/23.
//
import SwiftUI
import UIKit

class RankController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a UIHostingController with your SwiftUI view
        let rankHostingController = UIHostingController(rootView: RankView())

        // Add the UIHostingController as a child view controller
        addChild(rankHostingController)
        view.addSubview(rankHostingController.view)
        rankHostingController.didMove(toParent: self)
        
        // Set up constraints for the hosting controller's view
        rankHostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rankHostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            rankHostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rankHostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rankHostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

}




struct RankView: View {
    @State private var selectedSegment = 0 // 0 for hours, 1 for days

    var body: some View {
        VStack {
            Picker("Statistics", selection: $selectedSegment) {
                Text("Hours").tag(0)
                Text("Days").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(8)
            .padding(.horizontal)

            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Group {
                        RankTextView(rank: .master, selectedSegment: $selectedSegment)
                        RankTextView(rank: .emperor, selectedSegment: $selectedSegment)
                        RankTextView(rank: .silver, selectedSegment: $selectedSegment)
                        RankTextView(rank: .bronze, selectedSegment: $selectedSegment)
                        RankTextView(rank: .legend, selectedSegment: $selectedSegment)
                        RankTextView(rank: .copper, selectedSegment: $selectedSegment)
                        RankTextView(rank: .gold, selectedSegment: $selectedSegment)
                        RankTextView(rank: .beginner, selectedSegment: $selectedSegment)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Rankings") // If using a NavigationView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}

struct RankTextView: View {
    let rank: Rank
    @Binding var selectedSegment: Int

    var body: some View {
        Text(rankText(for: rank))
            .font(.headline)
            .fontWeight(.medium)
            .foregroundColor(Color.blue)
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func rankText(for rank: Rank) -> String {
        switch rank {
        case .master:
            return "Master: \(selectedSegment == 0 ? "1000 Hours" : "1000 Days")"
        case .emperor:
            return "Emperor: \(selectedSegment == 0 ? "750 Hours" : "750 Days")"
        case .silver:
            return "Silver: \(selectedSegment == 0 ? "200 Hours" : "200 Days")"
        case .bronze:
            return "Bronze: \(selectedSegment == 0 ? "100 Hours" : "100 Days")"
        case .legend:
            return "Legend: \(selectedSegment == 0 ? "500 Hours" : "500 Days")"
        case .copper:
            return "Copper: \(selectedSegment == 0 ? "50 Hours" : "50 Days")"
        case .gold:
            return "Gold: \(selectedSegment == 0 ? "300 Hours" : "300 Days")"
        case .beginner:
            return "Beginner: \(selectedSegment == 0 ? "5 Hours" : "5 Days")"
        }
    }
}

enum Rank {
    case master, emperor, silver, bronze, legend, copper, gold, beginner
}

struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}
