import UIKit
import SwiftyJSON

class ShowBriefModel: NSObject {
    var id: Int?
    var image: String?
    var name: String?
    var genres: [String]?
    var runtime: Int?
    var summary: String?
    var rating: Double?
    
    func jsonMapper(json: JSON){
        id = json["id"].intValue
        image = json["image"]["medium"].stringValue
        name = json["name"].stringValue
        genres = json["genres"].arrayObject as? [String]
        runtime = json["runtime"].intValue
        summary = json["summary"].stringValue
        rating = json["rating"]["average"].doubleValue
    }
}
