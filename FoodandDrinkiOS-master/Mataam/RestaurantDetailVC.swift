import UIKit
import Cosmos

class RestaurantDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate, AreaHeaderTVCDelegate, PressPlusButton {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var segMenu: UISegmentedControl!
    @IBOutlet weak var tvMenu: UITableView!
    @IBOutlet weak var vReviews: UIView!
    @IBOutlet weak var vInfo: UIView!
    @IBOutlet weak var vTime: UIView!
    @IBOutlet weak var cosmosVRate: CosmosView!
    
    //FooterView
    @IBOutlet weak var vFooter: UIView!
    @IBOutlet weak var lblAddedAmount: UILabel!
    @IBOutlet weak var btnViewCart: UIButton!
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    //Reviews
    @IBOutlet weak var tvReviews: UITableView!
    @IBOutlet weak var lblReviews: UILabel!
    @IBOutlet weak var btnAddReview: UIButton!
    //time
    @IBOutlet weak var btnMakeReservaton: UIButton!
    @IBOutlet weak var txvReservationNote: UITextView!
    @IBOutlet weak var vBtnDate: UIView!
    @IBOutlet weak var vBtnTime: UIView!
    @IBOutlet weak var vBtnPerson: UIView!
    @IBOutlet weak var scrvTime: UIScrollView!
    
    @IBOutlet weak var lblTimeSlot1: UILabel!
    @IBOutlet weak var lblTimeSlot2: UILabel!
    
    
    var sectionAreas = [SectionArea]()
    var areaList1 = ["Ahmadi","Al Julayah","Abu Halifa", "Al Julayah - Azvarur Sulah","Al Julayah"]
    var areaList2 = ["Ahmadi","Al Julayah","Abu Halifa", "Al Julayah - Azvarur Sulah","Al Julayah","Abu Halifa"]
    
    var selectedSection = 1;
    var isHeaderOpen = true
    var serviceType = 1
    var keyboardSize = CGRect()
    
    var orderCount = 0
    var pickerType = 1
    
    var timeSlot1 = false
    var timeSlot2 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initVC()
        self.tvMenu.register(UINib(nibName: "AreaHeaderTVC", bundle: nil), forHeaderFooterViewReuseIdentifier: "areaheader")
        
        self.updateView(serviceType: self.serviceType)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let sectionArea1 = SectionArea(isOpen:false,isSelect:false, areas:areaList1, values: areaList1)
        let sectionArea2 = SectionArea(isOpen:false,isSelect:false, areas:areaList2, values: areaList1)
        sectionAreas = [sectionArea1!,sectionArea2!]
        
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(gotoViewCart1))
        lblTimeSlot1.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(gotoViewCart2))
        lblTimeSlot2.addGestureRecognizer(tap2)

        self.scrvTime.translatesAutoresizingMaskIntoConstraints = true
        
        imgLogo.layer.borderColor = UIColor.lightGray.cgColor
        imgLogo.layer.borderWidth = 1

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if orderCount > 2 {
            self.lblTotalAmount.isHidden = true
            self.lblAddedAmount.isHidden = false
            self.btnViewCart.isHidden = false
        }
    }
    
    //MARK: - MyFunc
    func gotoViewCart1(){
        if timeSlot1 == false {
            lblTimeSlot1.backgroundColor = LIGHT_RED
            timeSlot1 = true
        }else {
            lblTimeSlot1.backgroundColor = RED_COLOR
            timeSlot1 = false
        }

    }
    func gotoViewCart2(){
        if timeSlot2 == false {
            lblTimeSlot2.backgroundColor = LIGHT_RED
            timeSlot2 = true
        }else {
            lblTimeSlot2.backgroundColor = RED_COLOR
            timeSlot2 = false
        }
    }
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.keyboardSize = keyboardSize
            
            self.scrvTime.contentInset = UIEdgeInsets(top:0.0, left:0.0, bottom:keyboardSize.height, right:0.0)
            self.scrvTime.setContentOffset(CGPoint(x: 0, y: 170), animated: true)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.scrvTime.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                    self.scrvTime.setContentOffset(CGPoint(x: 0, y: 0), animated: true)

    }
    
    func initVC() {
        self.btnAddReview.layer.cornerRadius = CGFloat(Corner_radious2)
        self.updateViewFromSegIndex (index: 0)
        
        //time
        self.btnMakeReservaton.layer.cornerRadius = CGFloat(Corner_radious2)
        self.txvReservationNote.layer.cornerRadius = CGFloat(Corner_radious2)
        self.txvReservationNote.layer.borderWidth = 1
        self.txvReservationNote.layer.borderColor = UIColor.lightGray.cgColor
        self.txvReservationNote.placeholder = "Type here ..."


        
        self.vBtnDate.layer.cornerRadius = CGFloat(Corner_radious2)
        self.vBtnDate.layer.borderWidth = 1
        self.vBtnDate.layer.borderColor = UIColor.lightGray.cgColor
        self.vBtnTime.layer.cornerRadius = CGFloat(Corner_radious2)
        self.vBtnTime.layer.borderWidth = 1
        self.vBtnTime.layer.borderColor = UIColor.lightGray.cgColor
        self.vBtnPerson.layer.cornerRadius = CGFloat(Corner_radious2)
        self.vBtnPerson.layer.borderWidth = 1
        self.vBtnPerson.layer.borderColor = UIColor.lightGray.cgColor
        
        btnViewCart.layer.cornerRadius = CGFloat(Corner_radious2)
        
    }
    
    func updateViewFromSegIndex (index: Int) {
        switch  index{
        case 0:
            if self.serviceType == 3 {
                vTime.isHidden = false
                tvMenu.isHidden = true
                vFooter.isHidden = true
            }else{
                vTime.isHidden = true
                tvMenu.isHidden = false
                vFooter.isHidden = false
            }
            vReviews.isHidden = true
            vInfo.isHidden = true
        case 1:
            tvMenu.isHidden = true
            vReviews.isHidden = false
            vInfo.isHidden = true
            vFooter.isHidden = true
            vTime.isHidden = true
        case 2:
            tvMenu.isHidden = true
            vReviews.isHidden = true
            vInfo.isHidden = false
            vFooter.isHidden = true
            vTime.isHidden = true
        default:
            break;
        }
    }

    func updateView(serviceType:Int) {
        self.serviceType = serviceType
        switch serviceType {
        case 1:
            navigationController?.navigationBar.barTintColor = GREEN_COLOR
            self.cosmosVRate.settings.filledColor = GREEN_COLOR
            self.cosmosVRate.settings.filledBorderColor = GREEN_COLOR
            self.segMenu.setTitle("MENU", forSegmentAt: 0)
            self.updateViewFromSegIndex(index: 0)
        case 2:
            navigationController?.navigationBar.barTintColor = BLUE_COLOR
            self.cosmosVRate.settings.filledColor = BLUE_COLOR
            self.cosmosVRate.settings.filledBorderColor = BLUE_COLOR
            self.segMenu.setTitle("MENU", forSegmentAt: 0)
            self.updateViewFromSegIndex(index: 0)
        case 3:
            navigationController?.navigationBar.barTintColor = RED_COLOR
            navigationItem.rightBarButtonItem?.isEnabled = false
            self.cosmosVRate.settings.filledColor = RED_COLOR
            self.cosmosVRate.settings.filledBorderColor = RED_COLOR
            self.segMenu.setTitle("TIME", forSegmentAt: 0)
            self.updateViewFromSegIndex(index: 0)
        case 4:
            navigationController?.navigationBar.barTintColor = ORANGE_COLOR
            self.cosmosVRate.settings.filledColor = ORANGE_COLOR
            self.cosmosVRate.settings.filledBorderColor = ORANGE_COLOR
            self.segMenu.setTitle("MENU", forSegmentAt: 0)
            self.updateViewFromSegIndex(index: 0)
        default:
            navigationController?.navigationBar.barTintColor = GREEN_COLOR
            self.cosmosVRate.settings.filledColor = GREEN_COLOR
            self.cosmosVRate.settings.filledBorderColor = GREEN_COLOR
            self.segMenu.setTitle("MENU", forSegmentAt: 0)
            self.updateViewFromSegIndex(index: 0)
        }

    }
    //MARK: - TableViewDataSource

    public func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == self.tvMenu {
            return self.sectionAreas.count
        }else {
            return 1
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.tvMenu {
            let sectionA = sectionAreas[section]
            let isOpen = sectionA.isOpen
            if isOpen == true {
                return sectionA.areas.count
            }else {
                return 0
            }
        }else {
            return 6
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.tvMenu {
            let cellIdentifier = "DeliveryRestMenuTVC"
            tableView.register(UINib(nibName: "DeliveryRestaurantMenuTVC", bundle: nil), forCellReuseIdentifier: cellIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! DeliveryRestaurantMenuTVC!
            cell?.delegate = self
            switch serviceType {
            case 1:
                cell?.cosVRate.settings.filledColor = GREEN_COLOR
                cell?.cosVRate.settings.filledBorderColor = GREEN_COLOR
                
                cell?.btnPlus.setImage(UIImage(named:"greenadd"), for:UIControlState.normal)
                
            case 2:
                cell?.cosVRate.settings.filledColor = BLUE_COLOR
                cell?.cosVRate.settings.filledBorderColor = BLUE_COLOR
                cell?.btnPlus.setImage(UIImage(named:"blueadd"), for:UIControlState.normal)


            case 3:
                break
            case 4:
                cell?.cosVRate.settings.filledColor = ORANGE_COLOR
                cell?.cosVRate.settings.filledBorderColor = ORANGE_COLOR
                cell?.btnPlus.setImage(UIImage(named:"orangeadd"), for:UIControlState.normal)


            default:
                break
            }
            return cell!

        }else {
            let cellIdentifier = "RestaurantReviewTVC"
            tableView.register(UINib(nibName: "RestaurantReviewTVC", bundle: nil), forCellReuseIdentifier: cellIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RestaurantReviewTVC!
            cell?.vContainer.layer.borderWidth = 1
            cell?.vContainer.layer.borderColor = UIColor.lightGray.cgColor
            cell?.vContainer.layer.cornerRadius = 6
            return cell!
        }
    }

    
    //MARK: - TableViewDelegate
    // Header
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if tableView == self.tvMenu {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "areaheader") as! AreaHeaderTVC
            

            header.section = section
            
            let sectionA = sectionAreas[section]
            let isOpen = sectionA.isOpen
            if isOpen == true {
                
                switch serviceType {
                case 1:
                    header.btnHeader.backgroundColor = GREEN_COLOR
                case 2:
                    header.btnHeader.backgroundColor = BLUE_COLOR
                case 3:
                    header.btnHeader.backgroundColor = RED_COLOR
                case 4:
                    header.btnHeader.backgroundColor = ORANGE_COLOR
                default:
                    break
                }
                header.imgArrow.image = #imageLiteral(resourceName: "Arrowup")
            }else{
                header.btnHeader.backgroundColor = UIColor.lightGray
                header.imgArrow.image = #imageLiteral(resourceName: "arrowdown1")
            }
            
            header.lblTitle.text = "MostSelling"
            header.delegate = self
            header.btnHeader.layer.cornerRadius = CGFloat(Corner_radious2)
            return header
        }else{
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == tvMenu {
            return 32.0
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if tableView == tvMenu {
            return 4
        }else{
            return 4
        }

    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }

    //MARK: - AreaHeaderTVCDelegate
    
    func didSelectAreaHeaderTVC(Selected: Bool, UserHeader: AreaHeaderTVC) {
        let sectionA = sectionAreas[UserHeader.section]
        sectionA.isOpen = !sectionA.isOpen
        
        self.tvMenu.reloadData()
    }
    
    //MARK: - PressPlusButtonDelegate
    
    func onPlusButton() {
        self.performSegue(withIdentifier: "addtocart", sender: self)
        self.orderCount += 1
    }
    
    //MARK: - IBAction
    @IBAction func onBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onAddToCartBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "order", sender: self)
    }
    @IBAction func onMenu(_ sender: Any) {
        self.updateViewFromSegIndex(index: segMenu.selectedSegmentIndex)
    }

    @IBAction func onViewCartBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "order", sender: self)
    }
    @IBAction func onAddReview(_ sender: Any) {
        self.performSegue(withIdentifier: "rate", sender: self)
    }
    @IBAction func onMakeReservaton(_ sender: Any) {
        if timeSlot1 || timeSlot2 {
            self.performSegue(withIdentifier: "checkout", sender: self)
        }
    }
    @IBAction func onBtnDate(_ sender: Any) {
        pickerType = 1
        performSegue(withIdentifier: "datepicker", sender: nil)
    }
    
    @IBAction func onBtnTime(_ sender: Any) {
        pickerType = 2
        performSegue(withIdentifier: "datepicker", sender: nil)
    }
    
    @IBAction func onBtnPerson(_ sender: Any) {
        pickerType = 3
        performSegue(withIdentifier: "datepicker", sender: nil)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "checkout") {
            let searchVC = segue.destination as? DeliveryCheckoutVC
            searchVC?.serviceType = self.serviceType
        }else if (segue.identifier == "order") {
            let searchVC = segue.destination as? OrderTV
            searchVC?.serviceType = self.serviceType
        }else if segue.identifier == "datepicker"{
            let pickerV = segue.destination as? DatePickerVC
            pickerV?.pickerType = pickerType
            
        }

        
    }


}
