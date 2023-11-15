import SwiftUI

struct RankView: View {
    @State private var selectedSegment = 0 // 0 for hours, 1 for days

    var body: some View {
        VStack {
            Picker("Statistics", selection: $selectedSegment) {
                Text("Hours").tag(0)
                Text("Days").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())

            Group {
                Text(rankText(for: .master))
                Text(rankText(for: .emperor))
                Text(rankText(for: .silver))
                Text(rankText(for: .bronze))
                Text(rankText(for: .legend))
                Text(rankText(for: .copper))
                Text(rankText(for: .gold))
                Text(rankText(for: .beginner))
            }
        }
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

    enum Rank {
        case master, emperor, silver, bronze, legend, copper, gold, beginner
    }
}

struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}
