
import UIKit

class CuisineItem:NSObject{
    
    //MARK: Properties
    var isSelect: Bool
    var cuisineName: String
    
    //MARK: - Funcs
    init?(isSelect: Bool, cuisineName: String) {
        self.isSelect = isSelect
        self.cuisineName = cuisineName
    }
    
}
