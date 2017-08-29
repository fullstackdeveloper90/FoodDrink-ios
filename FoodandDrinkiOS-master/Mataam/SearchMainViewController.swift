
import UIKit

protocol SecondVCDelegate {
    func didFinishSecondVC(controller: SearchMainViewController)
}

class SearchMainViewController: UIViewController, UIPopoverPresentationControllerDelegate, UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource{

    //viewtop
    @IBOutlet weak var vTopSearch: UIView!
    @IBOutlet weak var btnDelivery: UIButton!
    @IBOutlet weak var btnReservation: UIButton!
    @IBOutlet weak var btnPickup: UIButton!
    @IBOutlet weak var btnCatering: UIButton!
    
    @IBOutlet weak var stvDelivery: UIStackView!
    @IBOutlet weak var stvPickup: UIStackView!
    @IBOutlet weak var stvReservation: UIStackView!
    @IBOutlet weak var stvCatering: UIStackView!
    
    
    @IBOutlet weak var cvFoods: UICollectionView!
    @IBOutlet weak var tvFoods: UITableView!
    
    @IBOutlet weak var btnCollectionView: UIButton!
    @IBOutlet weak var btnTableView: UIButton!
    
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnFliter: UIButton!
    
    @IBOutlet weak var tfSearch: UITextField!
    
    //
    @IBOutlet weak var btnDeliveryArea: UIButton!
    @IBOutlet weak var btnDeliveryCuisine: UIButton!
    @IBOutlet weak var btnDeliverySearch: UIButton!
    
    @IBOutlet weak var btnPickupArea: UIButton!
    @IBOutlet weak var btnPickupCuisine: UIButton!
    @IBOutlet weak var btnPickupSearch: UIButton!
    
    @IBOutlet weak var btnReservDate: UIButton!
    @IBOutlet weak var btnReservTime: UIButton!
    @IBOutlet weak var btnReservPerson: UIButton!
    @IBOutlet weak var btnReservArea: UIButton!
    @IBOutlet weak var btnReservCuisine: UIButton!
    @IBOutlet weak var btnReservSearch: UIButton!
    
    @IBOutlet weak var btnCateringArea: UIButton!
    @IBOutlet weak var btnCateringCuisine: UIButton!
    @IBOutlet weak var btnCateringSearch: UIButton!
    
    //
    
    
    @IBOutlet weak var barBtnArrow: UIBarButtonItem!
    @IBOutlet weak var btnHideKeyboard: UIButton!
    
    
    var delegate: SecondVCDelegate! = nil
    
    var serviceType = 1
    var pickerType = 1
    var isUp = false
    
    //ForUpperView
    var topSearchViewOrigin = 0.0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

        let swipeDown1 = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown1.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown1)
        
        let swipeUp1 = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp1.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp1)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.vTopSearch.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.vTopSearch.addGestureRecognizer(swipeUp)

        topSearchViewOrigin = Double(self.vTopSearch.frame.origin.y)

        
        cvFoods!.register(UINib(nibName: "TableViewingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "delivery-cv-cell")
        
        
        btnCollectionView.imageView?.image = #imageLiteral(resourceName: "btntable")
        btnTableView.imageView?.image = #imageLiteral(resourceName: "btnlistempty")
        
        self.updateView(serviceType: self.serviceType)
        
        self.gestureUp()
        
        //btnCornerRadius
        
        
        btnReservDate.layer.cornerRadius = CGFloat(Corner_radious2)
        btnReservTime.layer.cornerRadius = CGFloat(Corner_radious2)
        btnReservPerson.layer.cornerRadius = CGFloat(Corner_radious2)
        btnReservCuisine.layer.cornerRadius = CGFloat(Corner_radious2)
        btnReservArea.layer.cornerRadius = CGFloat(Corner_radious2)
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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    
    //MARK: - MyFunc
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {

            case UISwipeGestureRecognizerDirection.down:
                self.isUp = false
                setArrow()
            case UISwipeGestureRecognizerDirection.up:
                self.isUp = true
                setArrow()
            default:
                break
            }
        }
    }
    
    func gestureUp (){
        
        self.vTopSearch.translatesAutoresizingMaskIntoConstraints = true
        
        tvFoods.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        cvFoods.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)

        let originFrame = (self.navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.height;
        
        let rect1 = CGRect(x: self.vTopSearch.frame.origin.x, y: -( self.vTopSearch.frame.height - originFrame - 40 ), width: self.vTopSearch.frame.size.width, height: self.vTopSearch.frame.size.height)
        
        self.vTopSearch.frame = rect1

    }
    
    func gestureDown() {
        let rect1 = CGRect(x: vTopSearch.frame.origin.x, y: CGFloat(topSearchViewOrigin) , width: vTopSearch.frame.size.width, height: vTopSearch.frame.size.height)
        self.vTopSearch.frame = rect1
        
        tvFoods.contentInset = UIEdgeInsets(top: 302, left: 0, bottom: 0, right: 0)
        cvFoods.contentInset = UIEdgeInsets(top: 302, left: 0, bottom: 0, right: 0)

    }
    
    func dismissKeyboard() {
        self.tfSearch.isHidden = true
        view.endEditing(true)
    }
    
    func updateView(serviceType:Int) {
        
        self.serviceType = serviceType
        switch serviceType {
        case 1:
            navigationController?.navigationBar.barTintColor = GREEN_COLOR
            
            btnDelivery.setBackgroundImage(UIImage(named: "btndeliverygroupedpress"), for: UIControlState.normal)
            self.btnPickup.setBackgroundImage(UIImage(named: "btnpickupgrouped"), for: UIControlState.normal)
            self.btnReservation.setBackgroundImage(UIImage(named: "btnreservgrouped"), for: UIControlState.normal)
            self.btnCatering.setBackgroundImage(UIImage(named: "btncateringgrouped"), for: UIControlState.normal)
            
            self.stvDelivery.isHidden = false
            self.stvPickup.isHidden = true
            self.stvReservation.isHidden = true
            self.stvCatering.isHidden = true
            
            self.tvFoods.reloadData()
            self.cvFoods.reloadData()
        case 2:
            navigationController?.navigationBar.barTintColor = BLUE_COLOR
            
            btnDelivery.setBackgroundImage(UIImage(named: "btndeliverygrouped"), for: UIControlState.normal)
            self.btnPickup.setBackgroundImage(UIImage(named: "btnpickupgroupedpress"), for: UIControlState.normal)
            self.btnReservation.setBackgroundImage(UIImage(named: "btnreservgrouped"), for: UIControlState.normal)
            self.btnCatering.setBackgroundImage(UIImage(named: "btncateringgrouped"), for: UIControlState.normal)
            
            self.stvDelivery.isHidden = true
            self.stvPickup.isHidden = false
            self.stvReservation.isHidden = true
            self.stvCatering.isHidden = true

            
            self.tvFoods.reloadData()
            self.cvFoods.reloadData()
        case 3:
            navigationController?.navigationBar.barTintColor = RED_COLOR
            
            btnDelivery.setBackgroundImage(UIImage(named: "btndeliverygrouped"), for: UIControlState.normal)
            self.btnPickup.setBackgroundImage(UIImage(named: "btnpickupgrouped"), for: UIControlState.normal)
            self.btnReservation.setBackgroundImage(UIImage(named: "btnreservgroupedpress"), for: UIControlState.normal)
            self.btnCatering.setBackgroundImage(UIImage(named: "btncateringgrouped"), for: UIControlState.normal)
            
            self.stvDelivery.isHidden = true
            self.stvPickup.isHidden = true
            self.stvReservation.isHidden = false
            self.stvCatering.isHidden = true

            
            self.tvFoods.reloadData()
            self.cvFoods.reloadData()
        case 4:
            navigationController?.navigationBar.barTintColor = ORANGE_COLOR
            
            btnDelivery.setBackgroundImage(UIImage(named: "btndeliverygrouped"), for: UIControlState.normal)
            self.btnPickup.setBackgroundImage(UIImage(named: "btnpickupgrouped"), for: UIControlState.normal)
            self.btnReservation.setBackgroundImage(UIImage(named: "btnreservgrouped"), for: UIControlState.normal)
            self.btnCatering.setBackgroundImage(UIImage(named: "btncateringgroupedpress"), for: UIControlState.normal)
            
            self.stvDelivery.isHidden = true
            self.stvPickup.isHidden = true
            self.stvReservation.isHidden = true
            self.stvCatering.isHidden = false

            
            self.tvFoods.reloadData()
            self.cvFoods.reloadData()

        default:
            break

        }
    }
    
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tfSearch.isHidden = true
        view.endEditing(true)
        return true
    }
    
    
    
    //MARK: UICollectionViewDelegateFlowLayout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 16;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 1;
    }
    
    
    //MARK: UICollectionViewDatasource methods
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if self.serviceType == 1 {
            collectionView.register(UINib(nibName:"DeliveryCollectionViewCell",bundle:nil), forCellWithReuseIdentifier: "DeliveryCollectionViewCell")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DeliveryCollectionViewCell", for: indexPath) as! DeliveryCollectionViewCell
            
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.cornerRadius = 8
            
            return cell
        }else if self.serviceType == 2{
            collectionView.register(UINib(nibName:"PickupCollectionViewCell",bundle:nil), forCellWithReuseIdentifier: "PickupCollectionViewCell")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PickupCollectionViewCell", for: indexPath) as! PickupCollectionViewCell
            
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.cornerRadius = 8
            
            return cell
        }else if self.serviceType == 3{
            collectionView.register(UINib(nibName:"ReservationCollectionViewCell",bundle:nil), forCellWithReuseIdentifier: "ReservationCollectionViewCell")

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReservationCollectionViewCell", for: indexPath) as! ReservationCollectionViewCell
            
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.cornerRadius = 8
            
            return cell
        }else{
            collectionView.register(UINib(nibName:"CateringCollectionViewCell",bundle:nil), forCellWithReuseIdentifier: "CateringCollectionViewCell")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CateringCollectionViewCell", for: indexPath) as! CateringCollectionViewCell
            
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.cornerRadius = 8
            
            return cell
        }

    }
    
    
    //MARK: CollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailrestaurant", sender: self)
    }
    
    //MARK: TableViewDelegate
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.performSegue(withIdentifier: "detailrestaurant", sender: self)
    }
    
    //MARK: TableViewDataSource
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.serviceType == 1 {
            let cellIdentifier = "DeliveryTableViewCell"
            tableView.register(UINib(nibName: "DeliveryTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! DeliveryTableViewCell!
            cell?.selectionStyle = .none
            return cell!
        }else if self.serviceType == 2{
            let cellIdentifier = "PickupTableViewCell"
            tableView.register(UINib(nibName: "PickupTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! PickupTableViewCell!
            cell?.selectionStyle = .none
            return cell!
        }else if self.serviceType == 3{
            let cellIdentifier = "ReservationTableViewCell"
            tableView.register(UINib(nibName: "ReservationTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ReservationTableViewCell!
            cell?.selectionStyle = .none
            return cell!
        }else{
            let cellIdentifier = "CateringTableViewCell"
            tableView.register(UINib(nibName: "CateringTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CateringTableViewCell!
            cell?.selectionStyle = .none
            return cell!
        }
    }
    
    //MARK: IBAction
    
    
    //viewtop
    @IBAction func onDeliveryBtn(_ sender: Any) {
        self.updateView(serviceType: 1)
    }
    @IBAction func onReservation(_ sender: Any) {
        self.updateView(serviceType: 3)
    }
    @IBAction func onPickupBtn(_ sender: Any) {
        self.updateView(serviceType: 2)
    }
    @IBAction func onCateringBtn(_ sender: Any) {
        self.updateView(serviceType: 4)
    }
    
    @IBAction func onCollectionView(_ sender: Any) {
        self.cvFoods.isHidden = false
        self.tvFoods.isHidden = true
        
        btnCollectionView.imageView?.image = #imageLiteral(resourceName: "btntable")
        btnTableView.imageView?.image = #imageLiteral(resourceName: "btnlistempty")
    }
    
    @IBAction func onTableView(_ sender: Any) {
        self.cvFoods.isHidden = true
        self.tvFoods.isHidden = false
        
        btnTableView.imageView?.image = #imageLiteral(resourceName: "btnlist")
        btnCollectionView.imageView?.image = #imageLiteral(resourceName: "btntableempty")
    }
    
    @IBAction func onFliter(_ sender: Any) {
        
        
        let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fliterView")
        
        popController.modalPresentationStyle = UIModalPresentationStyle.popover
        
        popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        popController.popoverPresentationController?.delegate = self
        popController.popoverPresentationController?.sourceView = sender as? UIView
        popController.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
        popController.preferredContentSize = CGSize(width: 172, height: 228)

        self.present(popController, animated: true, completion: nil)
        
        self.isUp = true
        setArrow()

    }
    
    @IBAction func onSearch(_ sender: Any) {
        
        self.tfSearch.isHidden = false
        btnHideKeyboard.isHidden = false
        self.isUp = true
        setArrow()

    }
    @IBAction func onBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        delegate.didFinishSecondVC(controller: self)
    }
    
    func setArrow() {
        if isUp{
            gestureUp()
            isUp = !isUp
            barBtnArrow.image = #imageLiteral(resourceName: "downarrow")
        }else {
            gestureDown()
            isUp = !isUp
            barBtnArrow.image = #imageLiteral(resourceName: "uparrow")
        }
    }
    @IBAction func onSearchNavBtn(_ sender: Any) {
        setArrow()
    }
    //buttons for search
    @IBAction func onBtnDeliveryChooseArea(_ sender: Any) {
        performSegue(withIdentifier: "area", sender: nil)

    }
    @IBAction func onBtnDeliveryChooseCuisine(_ sender: Any) {
        performSegue(withIdentifier: "cuisine", sender: nil)

    }
    @IBAction func onBtnPickupChooseArea(_ sender: Any) {
        performSegue(withIdentifier: "area", sender: nil)

    }
    
    @IBAction func onBtnPickupChooseCuisine(_ sender: Any) {
        performSegue(withIdentifier: "cuisine", sender: nil)

    }
    @IBAction func onBtnReservDate(_ sender: Any) {
        pickerType = 1
        performSegue(withIdentifier: "datepicker", sender: nil)
    }
    @IBAction func onBtnReservTime(_ sender: Any) {
        pickerType = 2
        performSegue(withIdentifier: "datepicker", sender: nil)
    }
    @IBAction func onBtnReservPerson(_ sender: Any) {
        pickerType = 3
        performSegue(withIdentifier: "datepicker", sender: nil)
    }
    @IBAction func onBtnReservChoArea(_ sender: Any) {
        performSegue(withIdentifier: "area", sender: nil)

    }
    @IBAction func onBtnReservChoCuisine(_ sender: Any) {
        performSegue(withIdentifier: "cuisine", sender: nil)

    }
    @IBAction func onBtnCateringChoArea(_ sender: Any) {
        performSegue(withIdentifier: "area", sender: nil)

    }
    @IBAction func onBtnCateringChoCuisine(_ sender: Any) {
        performSegue(withIdentifier: "cuisine", sender: nil)

    }
    @IBAction func onBtnHideKeyboard(_ sender: Any) {
        self.tfSearch.isHidden = true
        view.endEditing(true)
        btnHideKeyboard.isHidden = true
    }
    
    
    //MARK: UIPopoverPresentationControllerDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailrestaurant") {
            let searchVC = segue.destination as? RestaurantDetailVC
            searchVC?.serviceType = self.serviceType
        }else if segue.identifier == "datepicker"{
            let pickerV = segue.destination as? DatePickerVC
            pickerV?.pickerType = pickerType
            
        }

    }


}
