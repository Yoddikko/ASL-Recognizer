import Foundation


extension Double {
    ///Function for rounding long numbers
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
