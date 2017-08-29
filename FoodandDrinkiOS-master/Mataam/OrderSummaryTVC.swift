
import UIKit

class OrderSummaryTVC: UITableViewCell {

    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    
    var val = 1
    var strV = "1"
    var serviceType = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.btnPlus.layer.cornerRadius = CGFloat(Corner_radious2)
        self.btnPlus.layer.borderWidth = 1
        self.btnPlus.layer.borderColor = UIColor.lightGray.cgColor
        
        self.btnMinus.layer.cornerRadius = CGFloat(Corner_radious2)
        self.btnMinus.layer.borderWidth = 1
        self.btnMinus.layer.borderColor = UIColor.lightGray.cgColor

        
        strV = String(val)
        lblValue.text  = strV
        imgLogo.layer.borderColor = UIColor.lightGray.cgColor
        imgLogo.layer.borderWidth = 1

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func onBtnMinus(_ sender: Any) {
        if val < 1 {
            self.lblValue.text = "0"
        }else {
            val = val - 1
            strV = String(val)
            self.lblValue.text = strV
        }
    }
    @IBAction func onBtnPlus(_ sender: Any) {
        val = val + 1
        strV = String(val)
        self.lblValue.text = strV
    }
    
}
