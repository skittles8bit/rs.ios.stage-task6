import Foundation

class CoronaClass {
    var seats = [Int]()
    var seatCount: Int

    init(n: Int) {
        seatCount = n
    }
     
    func seat() -> Int {
        var place = 0
        var count = 0
        var indexOfPlace = 0

        if seats.isEmpty {
            seats.append(0)
        } else if !seats.contains(0) {
            seats.insert(0, at: 0)
            
            return place
        } else if (seats.first == 0 && seats.count == 1) || seats.last != seatCount - 1 {
            place = seatCount - 1
            seats.append(place)
        } else {
            for i in 1..<seats.count{
                if (seats[i] - seats[i - 1] ) / 2 > count{
                    count = (seats[i] - seats[i - 1])/2
                    indexOfPlace = i
                    place = seats[i - 1] + count
                }
            }
            
            seats.insert(place, at: indexOfPlace)
        }
        
        return place
    }
    
    func leave(_ p: Int) {
        if seats.contains(p) {
            if let firstIndexAtSeat = seats.firstIndex(of: p) {
                seats.remove(at: firstIndexAtSeat)
            }
        }
    }
}
