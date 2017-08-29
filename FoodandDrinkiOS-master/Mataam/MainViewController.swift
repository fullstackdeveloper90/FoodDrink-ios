
import UIKit

enum LeftMenu: Int {
    case order = 0
    case reservation
    case points
    case setting
    case promotion
    case chat
}

class MainViewController: UIViewController, SecondVCDelegate, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var imgvMain: UIImageView!
    
    @IBOutlet weak var btnDelivery: UIButton!
    @IBOutlet weak var btnPickup: UIButton!
    @IBOutlet weak var btnReservation: UIButton!
    @IBOutlet weak var btnCatering: UIButton!
    
    //View
    @IBOutlet weak var vtransparent1: UIView!
    @IBOutlet weak var vtransparent2: UIView!
    
    //Delivery
    @IBOutlet weak var stVDelivery: UIStackView!
    @IBOutlet weak var btnDeliverySearch: UIButton!
    @IBOutlet weak var btnDeliveryArea: UIButton!
    @IBOutlet weak var btnDeliveryCuisine: UIButton!
    
    //Catering
    @IBOutlet weak var stVCatering: UIStackView!
    @IBOutlet weak var btnCateringArea: UIButton!
    @IBOutlet weak var btnCateringCuisine: UIButton!
    @IBOutlet weak var btnCateringSearch: UIButton!
    
    //Pickup
    @IBOutlet weak var stVPickup: UIStackView!
    @IBOutlet weak var btnPickupArea: UIButton!
    @IBOutlet weak var btnPickupCuisine: UIButton!
    @IBOutlet weak var btnPickupSearch: UIButton!
    
    //Reservation
    @IBOutlet weak var stVReservation: UIStackView!
    @IBOutlet weak var btnReservDate: UIButton!
    @IBOutlet weak var btnReservTime: UIButton!
    @IBOutlet weak var btnReservPersion: UIButton!
    @IBOutlet weak var btnRerservArea: UIButton!
    @IBOutlet weak var btnReservCuisine: UIButton!
    @IBOutlet weak var btnReservSearch: UIButton!

    //Reft menu
    @IBOutlet weak var vLeftMenu: UIView!
    @IBOutlet weak var vAlpha: UIView!
    @IBOutlet weak var imgvProfile: UIImageView!
    @IBOutlet weak var tvLeftMenu: UITableView!

    var serviceType = 1
    var pickerType = 1
    var selectedMenu = 1
    
    let menus = ["MY ORDERS", "MY RESERVATION", "PROMOTION","MY POINTS", "MY SETTINGS", "LIVE CHAT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideLeftView))
        vAlpha.addGestureRecognizer(tap)

        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.left
        self.vLeftMenu.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeUp)
        
        self.vLeftMenu.translatesAutoresizingMaskIntoConstraints = true
        
        self.initUI()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        hideLeftView()
    }
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ordertvc"
        
        tvLeftMenu.register(UINib(nibName: "LeftMenuTVCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        let cell = tvLeftMenu.dequeueReusableCell(withIdentifier: cellIdentifier) as! LeftMenuTVCell!
        
        cell?.selectionStyle = .none
        
        cell?.lblMenuTitle.text = menus[indexPath.row]
        switch indexPath.row {
        case 0:
            cell?.imgvMenus.image = #imageLiteral(resourceName: "order")
        case 1:
            cell?.imgvMenus.image = #imageLiteral(resourceName: "clock")
        case 2:
            cell?.imgvMenus.image = #imageLiteral(resourceName: "broadcast")
        case 3:
            cell?.imgvMenus.image = #imageLiteral(resourceName: "trophy")
        case 4:
            cell?.imgvMenus.image = #imageLiteral(resourceName: "gear")
        case 5:
            cell?.imgvMenus.image = #imageLiteral(resourceName: "chats")
        default:
            break
        }
        return cell!
    }
    
    // MARK: - Table view data delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "OrderL", sender: nil)
        case 1:
            performSegue(withIdentifier: "ReservationL", sender: nil)
        case 2:
            performSegue(withIdentifier: "PromotionL", sender: nil)
        case 3:
            performSegue(withIdentifier: "PointsL", sender: nil)
        case 4:
            performSegue(withIdentifier: "SettingL", sender: nil)
        case 5:
            performSegue(withIdentifier: "ChatL", sender: nil)

        default:
            break;
        }
    }


    
    //MARK: - SecondVCDelegate
    func didFinishSecondVC(controller: SearchMainViewController) {
        self.serviceType = controller.serviceType
        self.updateView(type: self.serviceType)
    }
    
    // MARK: - IBActions
    @IBAction func onMenu(_ sender: Any) {
        showLeftView()
    }
    
    @IBAction func onBtnDelivery(_ sender: Any) {
        self.serviceType = 1
        self.updateView(type: self.serviceType)
    }
    @IBAction func onBtnPickup(_ sender: Any) {
        self.serviceType = 2
        self.updateView(type: self.serviceType)
    }
    @IBAction func onBtnReservation(_ sender: Any) {
        self.serviceType = 3

        self.updateView(type: self.serviceType)
    }
    @IBAction func onBtnCatering(_ sender: Any) {
        self.serviceType = 4
        self.updateView(type: self.serviceType)
    }
    
    @IBAction func onSearchDelivery(_ sender: Any) {
        search(no: 1)
    }
    @IBAction func onDeliveryChooseArea(_ sender: Any) {
        chooseArea(no: 1)
    }
    @IBAction func onDeliveryChooseCuisine(_ sender: Any) {
        chooseCuisine(no: 1)
    }
    
    
    ////////
    @IBAction func onCateringChooseArea(_ sender: Any) {
        chooseArea(no: 1)
    }
    @IBAction func onCateringChooseCuisine(_ sender: Any) {
        chooseCuisine(no: 1)
    }
    @IBAction func onCateringSearch(_ sender: Any) {
        search(no: 1)
    }

    ////////
    @IBAction func onReservDate(_ sender: Any) {
        pickerType = 1
        performSegue(withIdentifier: "datepicker", sender: nil)
    }
    
    @IBAction func onReservTime(_ sender: Any) {
        pickerType = 2
        performSegue(withIdentifier: "datepicker", sender: nil)
    }
    
    @IBAction func onReservPerson(_ sender: Any) {
        pickerType = 3
        performSegue(withIdentifier: "datepicker", sender: nil)
    }
    
    @IBAction func onReservArea(_ sender: Any) {
        chooseArea(no: 1)
    }
    @IBAction func onReservCuisine(_ sender: Any) {
        chooseCuisine(no: 1)
    }
    @IBAction func onReservSearch(_ sender: Any) {
        search(no: 1)
    }
    
    
    ////////
    @IBAction func onPickupArea(_ sender: Any) {
        chooseArea(no: 1)
    }
    @IBAction func onPickupCuisine(_ sender: Any) {
        chooseCuisine(no: 1)
    }
    @IBAction func onPickupSearch(_ sender: Any) {
        search(no: 1)
    }
    
    //leftmenu
    @IBAction func onCrossBtn(_ sender: Any) {
        hideLeftView()
    }
    
    
    //MARK: - my func
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.left:
                hideLeftView()
            case UISwipeGestureRecognizerDirection.right:
                showLeftView()
            default:
                break
            }
        }
    }
    
    func showLeftView () {

        UIView.animate(withDuration: 0.2, animations: {
            self.navigationController?.isNavigationBarHidden = true
            let rect1 = CGRect(x: 0, y: self.vLeftMenu.frame.origin.y , width: self.vLeftMenu.frame.size.width, height: self.vLeftMenu.frame.size.height)
            self.vLeftMenu.frame = rect1

        }) { (finished: Bool) in
            self.vAlpha.isHidden = false
        }
        
    }
    
    func hideLeftView () {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.navigationController?.isNavigationBarHidden = false
            let rect1 = CGRect(x: self.vLeftMenu.frame.origin.x - self.vLeftMenu.frame.width, y: self.vLeftMenu.frame.origin.y , width: self.vLeftMenu.frame.size.width, height: self.vLeftMenu.frame.size.height)
            self.vLeftMenu.frame = rect1

        }) { (finish: Bool) in
            self.vAlpha.isHidden = true
        }
    }

    
    func updateView(type:Int){
        
        self.serviceType = type
        switch type {
        case 1:
            navigationController?.navigationBar.barTintColor = GREEN_COLOR
            navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
            
            btnDelivery.setBackgroundImage(UIImage(named: "btn-delivery-pressed"), for: UIControlState.normal)
            btnPickup.setBackgroundImage(UIImage(named: "btn-pickup"), for: UIControlState.normal)
            btnReservation.setBackgroundImage(UIImage(named: "btn-reservation"), for: UIControlState.normal)
            btnCatering.setBackgroundImage(UIImage(named: "btn-catering"), for: UIControlState.normal)
            imgvMain.image = UIImage(named: "main-delivery")
            stVDelivery.isHidden = false
            stVCatering.isHidden = true
            stVReservation.isHidden = true
            stVPickup.isHidden = true
            vtransparent1.isHidden = false
            vtransparent2.isHidden = true
            
        case 2:
            navigationController?.navigationBar.barTintColor = BLUE_COLOR
            navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
            
            btnPickup.setBackgroundImage(UIImage(named: "btn-pickup-pressed"), for: UIControlState.normal)
            btnDelivery.setBackgroundImage(UIImage(named: "btn-delivery"), for: UIControlState.normal)
            btnReservation.setBackgroundImage(UIImage(named: "btn-reservation"), for: UIControlState.normal)
            btnCatering.setBackgroundImage(UIImage(named: "btn-catering"), for: UIControlState.normal)
            imgvMain.image = UIImage(named: "main-pickup")
            stVDelivery.isHidden = true
            stVCatering.isHidden = true
            stVReservation.isHidden = true
            stVPickup.isHidden = false
            vtransparent1.isHidden = false
            vtransparent2.isHidden = true
            
        case 3:
            navigationController?.navigationBar.barTintColor = RED_COLOR
            navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
            
            btnReservation.setBackgroundImage(UIImage(named: "btn-reservation-pressed"), for: UIControlState.normal)
            btnDelivery.setBackgroundImage(UIImage(named: "btn-delivery"), for: UIControlState.normal)
            btnPickup.setBackgroundImage(UIImage(named: "btn-pickup"), for: UIControlState.normal)
            btnCatering.setBackgroundImage(UIImage(named: "btn-catering"), for: UIControlState.normal)
            imgvMain.image = UIImage(named: "main-reservation")
            stVDelivery.isHidden = true
            stVCatering.isHidden = true
            stVReservation.isHidden = false
            stVPickup.isHidden = true
            vtransparent1.isHidden = true
            vtransparent2.isHidden = false
            
        case 4:
            navigationController?.navigationBar.barTintColor = ORANGE_COLOR
            navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
            
            btnCatering.setBackgroundImage(UIImage(named: "btn-catering-pressed"), for: UIControlState.normal)
            btnDelivery.setBackgroundImage(UIImage(named: "btn-delivery"), for: UIControlState.normal)
            btnPickup.setBackgroundImage(UIImage(named: "btn-pickup"), for: UIControlState.normal)
            btnReservation.setBackgroundImage(UIImage(named: "btn-reservation"), for: UIControlState.normal)
            imgvMain.image = UIImage(named: "main-catering")
            stVDelivery.isHidden = true
            stVCatering.isHidden = false
            stVReservation.isHidden = true
            stVPickup.isHidden = true
            vtransparent1.isHidden = false
            vtransparent2.isHidden = true
            
        default:
            break
        }
    }
    
    func search(no:Int){
        performSegue(withIdentifier: "search", sender: nil)
    }
    
    func chooseArea(no:Int){
        performSegue(withIdentifier: "area", sender: nil)
    }
    func chooseCuisine(no:Int){
        performSegue(withIdentifier: "cuisine", sender: nil)
    }
    
    func initUI (){
        
        self.navigationController?.isNavigationBarHidden = false
        
        let image = UIImage(named: "main-title")
        navigationItem.titleView = UIImageView(image: image)
        
        navigationController?.navigationBar.barTintColor = GREEN_COLOR
        
        self.vtransparent1.layer.cornerRadius = CGFloat(Corner_radious2)
        self.vtransparent2.layer.cornerRadius = CGFloat(Corner_radious2)
        hideLeftView()
        //btnCornerRadius
        
        
        btnReservDate.layer.cornerRadius = CGFloat(Corner_radious2)
        btnReservTime.layer.cornerRadius = CGFloat(Corner_radious2)
        btnReservPersion.layer.cornerRadius = CGFloat(Corner_radious2)
        btnReservCuisine.layer.cornerRadius = CGFloat(Corner_radious2)
        btnRerservArea.layer.cornerRadius = CGFloat(Corner_radious2)
        btnReservSearch.layer.cornerRadius = CGFloat(Corner_radious2)
        
        
        
        btnDeliveryArea.layer.cornerRadius = CGFloat(Corner_radious2)
        btnDeliverySearch.layer.cornerRadius = CGFloat(Corner_radious2)
        btnDeliveryCuisine.layer.cornerRadius = CGFloat(Corner_radious2)
        
        
        btnCateringArea.layer.cornerRadius = CGFloat(Corner_radious2)
        btnCateringCuisine.layer.cornerRadius = CGFloat(Corner_radious2)
        btnCateringSearch.layer.cornerRadius = CGFloat(Corner_radious2)
        
        btnPickupArea.layer.cornerRadius = CGFloat(Corner_radious2)
        btnPickupSearch.layer.cornerRadius = CGFloat(Corner_radious2)
        btnPickupCuisine.layer.cornerRadius = CGFloat(Corner_radious2)

        
        //
        tvLeftMenu.tableFooterView = UIView();
        
        imgvProfile.layer.borderColor = UIColor.lightGray.cgColor
        imgvProfile.layer.borderWidth = 1
    }
    
    //MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "search" {
            let searchVC = segue.destination as? SearchMainViewController
            searchVC?.delegate = self
            searchVC?.serviceType = self.serviceType
            
        }else if segue.identifier == "datepicker"{
            let pickerV = segue.destination as? DatePickerVC
            pickerV?.pickerType = pickerType
            
        }
    }


}
