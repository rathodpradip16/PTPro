
import Foundation
import Apollo

struct BathroomType : Codable{
    var isBathroom: Bool = true
    var bathroomName: String = ""
    var bathroomId: String = ""
    var bathroomType: String = ""
    var bathroomAmenities: String = ""
    
    // Custom initializer
    init(isBathroom: Bool, bathroomName: String, bathroomId: String, bathroomType: String, bathroomAmenities: String) {
        self.isBathroom = isBathroom
        self.bathroomName = bathroomName
        self.bathroomId = bathroomId
        self.bathroomType = bathroomType
        self.bathroomAmenities = bathroomAmenities
    }
    
    // Method to convert instance to JSON string
    func toJsonString() -> String? {
        if let jsonData = try? JSONEncoder().encode(self) {
            return String(data: jsonData, encoding: .utf8)
        }
        return nil
    }
    
    // Method to create an instance from JSON string
    static func fromJsonString(_ jsonString: String) -> BathroomType? {
        if let jsonData = jsonString.data(using: .utf8) {
            return try? JSONDecoder().decode(BathroomType.self, from: jsonData)
        }
        return nil
    }
    
    // Method to convert instance to JSON object (Dictionary)
    func toJsonObject() -> [String: Any]? {
        if let jsonData = try? JSONEncoder().encode(self),
           let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
            return jsonObject
        }
        return nil
    }
}

