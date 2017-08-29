
import UIKit

class SectionArea:NSObject{
    
    //MARK: - Properties
    var isOpen: Bool
    var isSelect: Bool
    var areas: Array<Any>
    var values: Array<Any>
    
    //MARK: - Funcs
    init?(isOpen: Bool, isSelect: Bool, areas: Array<Any>, values:Array <Any> ) {
        self.isOpen = isOpen
        self.isSelect = isSelect
        self.areas = areas
        self.values = values
    }
    
}
