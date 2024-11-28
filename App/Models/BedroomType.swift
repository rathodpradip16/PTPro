
import Foundation
import Apollo

struct BedroomType: Codable{
    var isBedroom: Bool = true
    var bedroomName: String = ""
    var bedroomId: String = ""
    var bedType: [BedType]?
    
    // Custom initializer
    init(isBedroom: Bool, bedroomName: String, bedroomId: String, bedType: [BedType]?) {
        self.isBedroom = isBedroom
        self.bedroomName = bedroomName
        self.bedroomId = bedroomId
        self.bedType = bedType
    }
    
    
    // Method to convert instance to JSON string
    func toJsonString() -> String? {
        if let jsonData = try? JSONEncoder().encode(self) {
            return String(data: jsonData, encoding: .utf8)
        }
        return nil
    }
    
    // Method to create an instance from JSON string
    static func fromJsonString(_ jsonString: String) -> BedroomType? {
        if let jsonData = jsonString.data(using: .utf8) {
            return try? JSONDecoder().decode(BedroomType.self, from: jsonData)
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


struct BedType : Codable{
    var bedCount: String = ""
    var bedname: String = ""
    var bedId: String = ""
    var bedtype: String = ""
    var bedsize: String = ""

    // Custom initializer
    init(bedCount: String, bedname: String, bedId: String, bedtype: String, bedsize: String) {
        self.bedCount = bedCount
        self.bedname = bedname
        self.bedId = bedId
        self.bedtype = bedtype
        self.bedsize = bedsize
    }
//    // Method to convert instance to JSON string
//    func toJsonString() -> String? {
//        if let jsonData = try? JSONEncoder().encode(self) {
//            return String(data: jsonData, encoding: .utf8)
//        }
//        return nil
//    }
//
//    // Method to create an instance from JSON string
//    static func fromJsonString(_ jsonString: String) -> BedType? {
//        if let jsonData = jsonString.data(using: .utf8) {
//            return try? JSONDecoder().decode(BedType.self, from: jsonData)
//        }
//        return nil
//    }
}
