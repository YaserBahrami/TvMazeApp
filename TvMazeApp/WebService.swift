import Foundation
import Alamofire
import SwiftyJSON

var baseURL = "http://api.tvmaze.com/shows"

typealias getShowListsuccessHandler = ([ShowBriefModel]) -> Void
typealias errorHandler = (String?) -> Void
typealias getDetailSuccessHandler = (ShowDetailModel) -> Void

func getShowList(sucessHandler: getShowListsuccessHandler? = nil, errorHandler: errorHandler? = nil){
    Alamofire.request(baseURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
        switch response.result{
        case .success(let value):
            let json = JSON(value)
            var successModels = [ShowBriefModel]()
            for jsonIndex in 0 ... (json.count - 1){
                let tempModel = ShowBriefModel()
                tempModel.jsonMapper(json: json[jsonIndex])
                
                successModels.append(tempModel)
            }
            sucessHandler?(successModels)
            
            
        case .failure(let error):
            print(error)
            errorHandler?("\(error)")
        }
    }
}

func getShowDetail(id: Int, sucessHandler: getDetailSuccessHandler? = nil, errorHandler: errorHandler? = nil){
    
    Alamofire.request(baseURL + "/\(id)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
        switch response.result{
        case .success(let value):
            let json = JSON(value)
            let model = ShowDetailModel()
            model.jsonMapper(json: json)
            sucessHandler?(model)
        case .failure(let error):
            errorHandler?("\(error)")
        }
    }
}

func getCastNames(id: Int,errorHander: errorHandler? = nil) {
        
        var castNames = ""

        Alamofire.request(baseURL + "/\(id)/cast", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                if (json.count > 0){
                    for index in 0 ... (json.count - 1){
                        castNames += json[index]["person"]["name"].stringValue
                        if index < ((json.count) - 1){
                            castNames += ", "
                        }
                    }
                }
                errorHander?(castNames)
                
            case .failure( _):
                break
            }
        }
}
