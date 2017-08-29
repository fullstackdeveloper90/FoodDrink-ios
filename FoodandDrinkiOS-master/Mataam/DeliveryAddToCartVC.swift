
import UIKit

class DeliveryAddToCartVC: UIViewController, UITableViewDataSource, UITableViewDelegate, AreaHeaderTVCDelegate {
    @IBOutlet weak var tvAddToCart: UITableView!
    
    
    var sectionAreas = [SectionArea]()
    var areaList1 = ["Potato wideges + Pepsi","Potato wideges + Mirinda","Potato wideges + 7 Up"]
    var areaList2 = ["KD 10000","KD 10000","KD 10000"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sectionArea1 = SectionArea(isOpen:false,isSelect:false, areas:areaList1, values:areaList2)
        let sectionArea2 = SectionArea(isOpen:false,isSelect:false, areas:areaList1, values:areaList2)
        let sectionArea3 = SectionArea(isOpen:false,isSelect:false, areas:areaList1, values:areaList2)
        sectionAreas = [sectionArea1!,sectionArea2!,sectionArea3!]
        
        self.tvAddToCart.register(UINib(nibName: "AreaHeaderTVC", bundle: nil), forHeaderFooterViewReuseIdentifier: "areaheader")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Table view data source
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sectionAreas.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        let sectionA = sectionAreas[section]
        let isOpen = sectionA.isOpen
        if isOpen == true {
            if section == 2 {
                return 1
            }
            return sectionA.areas.count
        }else {
            return 0
        }

        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 2 {
            let cellIdentifier = "CartCell"
            tableView.register(UINib(nibName: "AddCartNoteTVCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AddCartNoteTVCell!
            cell?.selectionStyle = .none
            return cell!
        }else{

            let cellIdentifier = "AreaCuisineCell"
            tableView.register(UINib(nibName: "AreaCuisineTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AreaCuisineTableViewCell!
            cell?.selectionStyle = .none
            let sectionA = sectionAreas[indexPath.section]
            cell?.lblName.text = sectionA.areas[indexPath.row] as? String
            cell?.lblValue.text = sectionA.values[indexPath.row] as? String
            
            return cell!
        }
    }
    
    
    //MARK: TableViewDelegate
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if indexPath.section == 2  {

        }else {
            let cell = tableView.cellForRow(at: indexPath) as! AreaCuisineTableViewCell
            cell.imgvSelect.image = #imageLiteral(resourceName: "checkboxp")
        }
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 2  {
            
        }else {
            let cell = tableView.cellForRow(at: indexPath) as! AreaCuisineTableViewCell
            cell.imgvSelect.image = #imageLiteral(resourceName: "checkbox")
        }
    }
    
    
    // Header
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "areaheader") as! AreaHeaderTVC
        
        header.section = section
        
        let sectionA = sectionAreas[section]
        let isOpen = sectionA.isOpen
        if isOpen == true {
            header.btnHeader.backgroundColor = GREEN_COLOR
            header.imgArrow.image = #imageLiteral(resourceName: "Arrowup")
        }else{
            header.btnHeader.backgroundColor = UIColor.lightGray
            header.imgArrow.image = #imageLiteral(resourceName: "arrowdown1")
        }
        
        header.lblTitle.text = "Make it a meal (Choose from the list)"

        if section == 2 {
            header.lblTitle.text = "Order Notes"
        }
        header.delegate = self
        header.btnHeader.layer.cornerRadius = CGFloat(Corner_radious2)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 {
            return 88
        }else {
            return 28
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 4.0
    }
    
    //MARK: - AreaHeaderTVCDelegate
    
    func didSelectAreaHeaderTVC(Selected: Bool, UserHeader: AreaHeaderTVC) {
        let sectionA = sectionAreas[UserHeader.section]
        sectionA.isOpen = !sectionA.isOpen
        
        self.tvAddToCart .reloadData()
    }
    
    //MARK: - IBAction
    
    @IBAction func onAddToCart(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onCancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }

}
