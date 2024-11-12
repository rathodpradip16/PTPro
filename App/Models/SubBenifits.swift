
import Foundation
import Apollo

struct SubBenifits {
    var Title: String = ""
    var Desc: String = ""
    var Img: String = ""
    
    init(title:String, desc:String, img:String ) {
        self.Title = title
        self.Desc = desc
        self.Img = img
    }
}
