import Foundation


extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
