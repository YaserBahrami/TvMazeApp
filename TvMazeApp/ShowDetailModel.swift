import UIKit
import SwiftyJSON

class ShowDetailModel: NSObject {
    var id: Int?
    var name: String?
    var language: String?
    var genres: [String]?
    var status: String?
    var premiered: String?
    var rating: Double?
    var image: String?
    var summary: String?
    var time: String?
    var days: [String]?
    var runtime: Int?

    
    func jsonMapper(json: JSON){
        id = json["id"].intValue
        name = json["name"].stringValue
        language = json["language"].stringValue
        genres = json["genres"].arrayObject as? [String]
        runtime = json["runtime"].intValue
        summary = json["summary"].stringValue
        rating = json["rating"]["average"].doubleValue
        status = json["status"].stringValue
        premiered = json["premiered"].stringValue
        image = json["image"]["original"].stringValue
        time = json["schedule"]["time"].stringValue
        days = json["schedule"]["days"].arrayObject as? [String]
        

        
    }
}

