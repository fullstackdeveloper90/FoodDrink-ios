
import UIKit

protocol CusineCVCDelegate {
    func didSelectCusineCVC(Selected: Bool, Cell: CuisineCVC)
}

class CuisineCVC: UICollectionViewCell {

    var selectedItem = -1
    
    @IBOutlet weak var imvCheck: UIImageView!
    @IBOutlet weak var lblCuisine: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var delegate : CusineCVCDelegate?

    
    @IBAction func selectBtnCusine(_ sender: Any) {
        self.delegate?.didSelectCusineCVC(Selected: false, Cell: self)
    }

}
