
import UIKit

class DeliveryCheckoutVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scvContainer: UIScrollView!
    
  //Delivery
    
    @IBOutlet weak var vDelivery: UIView!
    //view0
    @IBOutlet weak var btnRedeemCoupon: UIButton!
    @IBOutlet weak var btnLoyaltyPoints: UIButton!
    @IBOutlet weak var btnMataamPoints: UIButton!
    
    @IBOutlet weak var tfInsertCouponCode: UITextField!
    @IBOutlet weak var btnApplyCoupon: UIButton!
    
    @IBOutlet weak var vLoyaltyPoints: UIView!
    @IBOutlet weak var lblGainedUsed: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    
    @IBOutlet weak var vMataamPoints: UIView!
    @IBOutlet weak var lblGainedMataam: UILabel!
    @IBOutlet weak var lblMataamBalance: UILabel!
    
    //view1
    @IBOutlet weak var lblAddAddress: UILabel!
    @IBOutlet weak var btnAddress: UIButton!
    @IBOutlet weak var vAddress: UIView!
    
    //view2
    @IBOutlet weak var btnNow: UIButton!
    @IBOutlet weak var btnPreorder: UIButton!
    @IBOutlet weak var btnDate: UIButton!
    @IBOutlet weak var btnTime: UIButton!
    
    //view3
    @IBOutlet weak var txtvNote: UITextView!
    
    //view4
    @IBOutlet weak var btnPlaceOrder: UIButton!
    @IBOutlet weak var lblSubtotal: UILabel!
    @IBOutlet weak var lblDeliveryFee: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var btnCashondelivery: UIButton!
    @IBOutlet weak var btnCreditCard: UIButton!
    @IBOutlet weak var btnKnet: UIButton!
    
  //Reservation
    @IBOutlet weak var vReservation: UIView!
    //view0
    
    //view1
    @IBOutlet weak var tvNoteRestaurant: UITextView!
    
    //view2
    @IBOutlet weak var btnRedeemCoupon2: UIButton!
    @IBOutlet weak var btnLoyalty2: UIButton!
    @IBOutlet weak var btnMataamPoints2: UIButton!
    @IBOutlet weak var vLoyaltyPoints2: UIView!
    @IBOutlet weak var vMataamPoints2: UIView!
    @IBOutlet weak var btnApplyCoupon2: UIButton!
    
    //view3
    @IBOutlet weak var btnCashdelivery2: UIButton!
    @IBOutlet weak var btnCreditCard2: UIButton!
    @IBOutlet weak var btnKnet2: UIButton!
    @IBOutlet weak var btnProceedCheckout2: UIButton!
    
    
    var serviceType = 1
    var remainString = String ()
    var pickerType = 1
    var canEditDate = false
    
    var point1 = SectionArea(isOpen:false,isSelect:false, areas:["1"], values: ["coupon"])
    var point2 = SectionArea(isOpen:false,isSelect:false, areas:["1"], values: ["loyalty"])
    var point3 = SectionArea(isOpen:false,isSelect:false, areas:["1"], values: ["mataam"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.updateView(type: self.serviceType)
    }
    override func viewDidLayoutSubviews() {
        self.scvContainer.translatesAutoresizingMaskIntoConstraints = true
        if self.serviceType == 3 {
            self.scvContainer.contentSize = CGSize(width: self.scvContainer.frame.width, height:663)
            self.vReservation.isHidden = false
            self.vDelivery.isHidden = true
        }else {
            self.scvContainer.contentSize = CGSize(width: self.scvContainer.frame.width, height:823)
            self.vReservation.isHidden = true
            self.vDelivery.isHidden = false
        }
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(gotoAddAddress))
        lblAddAddress.addGestureRecognizer(tap1)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       remainString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
        if remainString == "" {
            self.btnApplyCoupon.isEnabled = false
            self.btnApplyCoupon.backgroundColor = UIColor.lightGray
        }else{
            self.btnApplyCoupon.isEnabled = true
            switch serviceType {
            case 1:
                self.btnApplyCoupon.backgroundColor = GREEN_COLOR
                self.btnApplyCoupon2.backgroundColor = GREEN_COLOR
            case 2:
                self.btnApplyCoupon.backgroundColor = BLUE_COLOR
                self.btnApplyCoupon2.backgroundColor = BLUE_COLOR
            case 3:
                self.btnApplyCoupon.backgroundColor = RED_COLOR
                self.btnApplyCoupon2.backgroundColor = RED_COLOR
            case 4:
                self.btnApplyCoupon.backgroundColor = ORANGE_COLOR
                self.btnApplyCoupon2.backgroundColor = ORANGE_COLOR
            default:
                break
            }
        }
        return true
    }
    //MARK: - MyFunc
    
    func gotoAddAddress() {
        self.performSegue(withIdentifier: "newaddress", sender: self)
    }
    func initUI(){
      //delivery
        //view0
        btnApplyCoupon.layer.cornerRadius = CGFloat(Corner_radious2)
        
        self.vLoyaltyPoints.layer.cornerRadius = CGFloat(Corner_radious2)
        self.vLoyaltyPoints.layer.borderColor = ORANGE_COLOR.cgColor
        self.vLoyaltyPoints.layer.borderWidth = 1
        
        self.vMataamPoints.layer.cornerRadius = CGFloat(Corner_radious2)
        self.vMataamPoints.layer.borderColor = ORANGE_COLOR.cgColor
        self.vMataamPoints.layer.borderWidth = 1
        
        //view1
        vAddress.layer.cornerRadius = CGFloat(Corner_radious2)
        
        //view2
        btnDate.layer.cornerRadius = CGFloat(Corner_radious2)
        btnTime.layer.cornerRadius = CGFloat(Corner_radious2)
        
        //view3
        txtvNote.layer.cornerRadius = CGFloat(Corner_radious2)
        txtvNote.placeholder = "eg. if you have a food allergy or a request for driver."
        txtvNote.layer.borderColor = UIColor.lightGray.cgColor
        txtvNote.layer.borderWidth = 1

        //view4
        switch serviceType {
        case 1:
//            btnRedeemCoupon.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
            btnNow.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
            btnCashondelivery.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
//            btnRedeemCoupon2.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
            btnCashdelivery2.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
//            btnRedeemCoupon.setImage(UIImage(named:"blue"), for: UIControlState.normal)
            btnNow.setImage(UIImage(named:"blue"), for: UIControlState.normal)
            btnCashondelivery.setImage(UIImage(named:"blue"), for: UIControlState.normal)
//            btnRedeemCoupon2.setImage(UIImage(named:"blue"), for: UIControlState.normal)
            btnCashdelivery2.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
//            btnRedeemCoupon.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            btnNow.setImage(UIImage(named:"red"), for: UIControlState.normal)
            btnCashondelivery.setImage(UIImage(named:"red"), for: UIControlState.normal)
//            btnRedeemCoupon2.setImage(UIImage(named:"red"), for: UIControlState.normal)
            btnCashdelivery2.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
//            btnRedeemCoupon.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            btnNow.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            btnCashondelivery.setImage(UIImage(named:"orange"), for: UIControlState.normal)
//            btnRedeemCoupon2.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            btnCashdelivery2.setImage(UIImage(named:"orange"), for: UIControlState.normal)

        default:
            break
        }
//        btnCashondelivery.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        btnPlaceOrder.layer.cornerRadius = CGFloat(Corner_radious2)
        
      //reservation
        //view1
        tvNoteRestaurant.placeholder = "eg. if you have a food allergy or a request for driver."
        tvNoteRestaurant.layer.cornerRadius = CGFloat(Corner_radious2)
        tvNoteRestaurant.layer.borderColor = UIColor.lightGray.cgColor
        tvNoteRestaurant.layer.borderWidth = 1

        //view2
        self.vLoyaltyPoints2.layer.cornerRadius = CGFloat(Corner_radious2)
        self.vLoyaltyPoints2.layer.borderColor = ORANGE_COLOR.cgColor
        self.vLoyaltyPoints2.layer.borderWidth = 1
        
        self.vMataamPoints2.layer.cornerRadius = CGFloat(Corner_radious2)
        self.vMataamPoints2.layer.borderColor = ORANGE_COLOR.cgColor
        self.vMataamPoints2.layer.borderWidth = 1
        
        self.btnApplyCoupon2.layer.cornerRadius = CGFloat(Corner_radious2)

        //view3
        btnProceedCheckout2.layer.cornerRadius = CGFloat(Corner_radious2)
    }
    
    func updateView(type:Int) {
        
        self.scvContainer.translatesAutoresizingMaskIntoConstraints = true
        
        if type == 3 {
            self.scvContainer.contentSize = CGSize(width: self.scvContainer.frame.width, height:663)
            self.vReservation.isHidden = false
            self.vDelivery.isHidden = true
        }else {
            self.scvContainer.contentSize = CGSize(width: self.scvContainer.frame.width, height:823)
            self.vReservation.isHidden = true
            self.vDelivery.isHidden = false
        }
        
        switch serviceType {
        case 1:
            btnPlaceOrder.backgroundColor = GREEN_COLOR
            btnProceedCheckout2.backgroundColor = GREEN_COLOR
        case 2:
            btnPlaceOrder.backgroundColor = BLUE_COLOR
            btnProceedCheckout2.backgroundColor = BLUE_COLOR
        case 3:
            btnPlaceOrder.backgroundColor = RED_COLOR
            btnProceedCheckout2.backgroundColor = RED_COLOR
        case 4:
            btnPlaceOrder.backgroundColor = ORANGE_COLOR
            btnProceedCheckout2.backgroundColor = ORANGE_COLOR
        default:
            break
        }


    }
    
    //MARK: - IBAction
    
    @IBAction func onBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
   //delivery,pickup,catering
    //view0
    @IBAction func onBtnRedeemCoupon(_ sender: Any) {
        if point1?.isSelect == true {
            switch serviceType {
            case 1:
                self.btnRedeemCoupon.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
            case 2:
                self.btnRedeemCoupon.setImage(UIImage(named:"blue"), for: UIControlState.normal)
            case 3:
                self.btnRedeemCoupon.setImage(UIImage(named:"red"), for: UIControlState.normal)
            case 4:
                self.btnRedeemCoupon.setImage(UIImage(named:"orange"), for: UIControlState.normal)
                
            default:
                break
            }
            point1?.isSelect = false

        }else{
        switch serviceType {
        case 1:
            self.btnRedeemCoupon.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
            self.btnRedeemCoupon.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
            self.btnRedeemCoupon.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
            self.btnRedeemCoupon.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            
        default:
            break
        }
            point1?.isSelect = true

        }
        self.btnLoyaltyPoints.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        self.btnMataamPoints.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
    }
    @IBAction func onBtnLoyaltyPoints(_ sender: Any) {
        if point2?.isSelect == true {
            switch serviceType {
            case 1:
                self.btnLoyaltyPoints.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
            case 2:
                self.btnLoyaltyPoints.setImage(UIImage(named:"blue"), for: UIControlState.normal)
            case 3:
                self.btnLoyaltyPoints.setImage(UIImage(named:"red"), for: UIControlState.normal)
            case 4:
                self.btnLoyaltyPoints.setImage(UIImage(named:"orange"), for: UIControlState.normal)
                
            default:
                break
            }
            point2?.isSelect = false
        }else{
        switch serviceType {
        case 1:
            self.btnLoyaltyPoints.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
            self.btnLoyaltyPoints.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
            self.btnLoyaltyPoints.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
            self.btnLoyaltyPoints.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            
        default:
            break
        }
            point2?.isSelect = true
        }
        self.btnRedeemCoupon.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        self.btnMataamPoints.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
    }
    @IBAction func onBtnMataamPoints(_ sender: Any) {
        if point3?.isSelect == true {
            switch serviceType {
            case 1:
                self.btnMataamPoints.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
            case 2:
                self.btnMataamPoints.setImage(UIImage(named:"blue"), for: UIControlState.normal)
            case 3:
                self.btnMataamPoints.setImage(UIImage(named:"red"), for: UIControlState.normal)
            case 4:
                self.btnMataamPoints.setImage(UIImage(named:"orange"), for: UIControlState.normal)
                
            default:
                break
            }
            point3?.isSelect = false
        }else{
        switch serviceType {
        case 1:
            self.btnMataamPoints.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
            self.btnMataamPoints.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
            self.btnMataamPoints.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
            self.btnMataamPoints.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            
        default:
            break
        }
            point3?.isSelect = true
        }
        self.btnRedeemCoupon.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        self.btnLoyaltyPoints.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)

    }
    
    //view1
    @IBAction func onAddressBtn(_ sender: Any) {
        performSegue(withIdentifier: "popaddress", sender: nil)
    }
    
    //view2
    @IBAction func onNowBtn(_ sender: Any) {
        switch serviceType {
        case 1:
            self.btnNow.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
            self.btnNow.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
            self.btnNow.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
            self.btnNow.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            
        default:
            break
        }

        self.btnPreorder.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        
        btnDate.isEnabled = false
        btnTime.isEnabled = false
    }
    @IBAction func onPreorderBtn(_ sender: Any) {
        switch serviceType {
        case 1:
            self.btnPreorder.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
            self.btnPreorder.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
            self.btnPreorder.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
            self.btnPreorder.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            
        default:
            break
        }

        self.btnNow.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        

            btnDate.isEnabled = true
            btnTime.isEnabled = true

        


    }

    @IBAction func onBtnDate(_ sender: Any) {
        pickerType = 1
        performSegue(withIdentifier: "datepicker", sender: nil)

    }
    @IBAction func onBtnTime(_ sender: Any) {
        pickerType = 2
        performSegue(withIdentifier: "datepicker", sender: nil)

    }
    
    //view3
    
    //view4
    @IBAction func onBtnCashonDelivery(_ sender: Any) {
        switch serviceType {
        case 1:
            self.btnCashondelivery.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
            self.btnCashondelivery.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
            self.btnCashondelivery.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
            self.btnCashondelivery.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            
        default:
            break
        }

        self.btnCreditCard.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        self.btnKnet.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
    }
    @IBAction func onBtnCreditCard(_ sender: Any) {
        
        switch serviceType {
        case 1:
            self.btnCreditCard.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
            self.btnCreditCard.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
            self.btnCreditCard.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
            self.btnCreditCard.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            
        default:
            break
        }

        self.btnCashondelivery.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        self.btnKnet.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
    }
    @IBAction func onBtnKnet(_ sender: Any) {
        switch serviceType {
        case 1:
            self.btnKnet.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
            self.btnKnet.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
            self.btnKnet.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
            self.btnKnet.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            
        default:
            break
        }

        self.btnCashondelivery.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        self.btnCreditCard.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
    }
    
    @IBAction func onPlaceOrder(_ sender: Any) {
        performSegue(withIdentifier: "confirmation", sender: nil)
    }

    @IBAction func onBtnRedeemCoupon2(_ sender: Any) {
        if point1?.isOpen == true {
            switch serviceType {
            case 1:
                self.btnRedeemCoupon2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
            case 2:
                self.btnRedeemCoupon2.setImage(UIImage(named:"blue"), for: UIControlState.normal)
            case 3:
                self.btnRedeemCoupon2.setImage(UIImage(named:"red"), for: UIControlState.normal)
            case 4:
                self.btnRedeemCoupon2.setImage(UIImage(named:"orange"), for: UIControlState.normal)
                
            default:
                break
            }
            point1?.isOpen = false
        }else{
        switch serviceType {
        case 1:
            self.btnRedeemCoupon2.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
            self.btnRedeemCoupon2.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
            self.btnRedeemCoupon2.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
            self.btnRedeemCoupon2.setImage(UIImage(named:"orange"), for: UIControlState.normal)

        default:
            break
        }
            point1?.isOpen = true
        }
        self.btnLoyalty2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        self.btnMataamPoints2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
    }
    
    @IBAction func onBtnLoyalty2(_ sender: Any) {
        if point2?.isOpen == true {
            switch serviceType {
            case 1:
                self.btnLoyalty2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
            case 2:
                self.btnLoyalty2.setImage(UIImage(named:"blue"), for: UIControlState.normal)
            case 3:
                self.btnLoyalty2.setImage(UIImage(named:"red"), for: UIControlState.normal)
            case 4:
                self.btnLoyalty2.setImage(UIImage(named:"orange"), for: UIControlState.normal)
                
            default:
                break
            }
            point2?.isOpen = false
        }else{
        switch serviceType {
        case 1:
            self.btnLoyalty2.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
            self.btnLoyalty2.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
            self.btnLoyalty2.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
            self.btnLoyalty2.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            
        default:
            break
        }
            point2?.isOpen = true
        }
        self.btnRedeemCoupon2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        self.btnMataamPoints2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
    }
    
    @IBAction func onBtnMataamPoints2(_ sender: Any) {
        if point3?.isOpen == true {
            switch serviceType {
            case 1:
                self.btnMataamPoints2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
            case 2:
                self.btnMataamPoints2.setImage(UIImage(named:"blue"), for: UIControlState.normal)
            case 3:
                self.btnMataamPoints2.setImage(UIImage(named:"red"), for: UIControlState.normal)
            case 4:
                self.btnMataamPoints2.setImage(UIImage(named:"orange"), for: UIControlState.normal)
                
            default:
                break
            }
            point3?.isOpen = false
        }else{
        switch serviceType {
        case 1:
            self.btnMataamPoints2.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
            self.btnMataamPoints2.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
            self.btnMataamPoints2.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
            self.btnMataamPoints2.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            
        default:
            break
        }
            point3?.isOpen = true
        }
        self.btnRedeemCoupon2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        self.btnLoyalty2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
    }
    
    //view3
    @IBAction func onBtnCashdelivery2(_ sender: Any) {
        switch serviceType {
        case 1:
            self.btnCashdelivery2.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
            self.btnCashdelivery2.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
            self.btnCashdelivery2.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
            self.btnCashdelivery2.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            
        default:
            break
        }

        self.btnCreditCard2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        self.btnKnet2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
    }
    
    @IBAction func onBtnCreditCard2(_ sender: Any) {
        switch serviceType {
        case 1:
            self.btnCreditCard2.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
            self.btnCreditCard2.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
            self.btnCreditCard2.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
            self.btnCreditCard2.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            
        default:
            break
        }

        self.btnCashdelivery2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        self.btnKnet2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
    }
    @IBAction func onBtnKnet2(_ sender: Any) {
        switch serviceType {
        case 1:
            self.btnKnet2.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        case 2:
            self.btnKnet2.setImage(UIImage(named:"blue"), for: UIControlState.normal)
        case 3:
            self.btnKnet2.setImage(UIImage(named:"red"), for: UIControlState.normal)
        case 4:
            self.btnKnet2.setImage(UIImage(named:"orange"), for: UIControlState.normal)
            
        default:
            break
        }

        self.btnCashdelivery2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        self.btnCreditCard2.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
    }
    
    @IBAction func onBtnProceedCheckout2(_ sender: Any) {
        performSegue(withIdentifier: "confirmation", sender: nil)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "datepicker"{
            let pickerV = segue.destination as? DatePickerVC
            pickerV?.pickerType = pickerType
            
       }else if segue.identifier == "confirmation"{
        let confirmVC = segue.destination as? OrderConfirmationVC
        confirmVC?.serviceType = serviceType
        
        }
        
    }
    

}
