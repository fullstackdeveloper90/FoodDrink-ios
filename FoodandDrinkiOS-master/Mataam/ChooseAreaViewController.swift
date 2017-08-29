
import UIKit

class ChooseAreaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AreaHeaderTVCDelegate {

    @IBOutlet weak var tvChooseLocation: UITableView!
    @IBOutlet weak var btnApply: UIButton!
    @IBOutlet weak var btnCancel: UIButton!

    var sectionAreas = [SectionArea]()
    var areaList1 = ["Ahmadi","Al Julayah","Abu Halifa", "Al Julayah - Azvarur Sulah","Al Julayah"]
    var areaList2 = ["Ahmadi","Al Julayah","Abu Halifa", "Al Julayah - Azvarur Sulah","Al Julayah","Abu Halifa"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sectionArea1 = SectionArea(isOpen:false,isSelect:false, areas:areaList1, values: areaList1)
        let sectionArea2 = SectionArea(isOpen:false,isSelect:false, areas:areaList2, values: areaList1)
        sectionAreas = [sectionArea1!,sectionArea2!]
        
        self.tvChooseLocation.register(UINib(nibName: "AreaHeaderTVC", bundle: nil), forHeaderFooterViewReuseIdentifier: "areaheader")
        self.initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: - MyFunc
    func initUI() {
        self.btnApply.layer.cornerRadius = CGFloat(Corner_radious2)
        self.btnCancel.layer.cornerRadius = CGFloat(Corner_radious2)
    }

    // MARK: - Table view data source
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionAreas.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let sectionA = sectionAreas[section]
        let isOpen = sectionA.isOpen
        if isOpen == true {
            return sectionA.areas.count
        }else {
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AreaCuisineCell"
        tableView.register(UINib(nibName: "AreaCuisineTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AreaCuisineTableViewCell!
        cell?.selectionStyle = .none

        
        let sectionA = sectionAreas[indexPath.section]
        cell?.lblName.text = sectionA.areas[indexPath.row] as? String
        
        return cell!
    }
    
    
    //MARK: TableViewDelegate
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell = tableView.cellForRow(at: indexPath) as! AreaCuisineTableViewCell
        cell.imgvSelect.image = #imageLiteral(resourceName: "checkboxp")
        dismiss(animated: true, completion: nil)

        
    }

    // Header
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "areaheader") as! AreaHeaderTVC
        
        header.section = section
        
        let sectionA = sectionAreas[section]
        let isOpen = sectionA.isOpen
        if isOpen == true {
            header.btnHeader.backgroundColor = GREEN_COLOR
            header.lblTitle.textColor = UIColor.white

            header.imgArrow.image = #imageLiteral(resourceName: "Arrowup")
        }else{
            header.btnHeader.backgroundColor = UIColor.lightGray
            header.lblTitle.textColor = UIColor.black
            header.imgArrow.image = #imageLiteral(resourceName: "arrowdown1")
        }
        
        header.lblTitle.text = "Ahumadi"
        header.delegate = self
        header.btnHeader.layer.cornerRadius = CGFloat(Corner_radious2)
        return header
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
        
        self.tvChooseLocation .reloadData()
    }
    
    //MARK: - IBAction
    
    @IBAction func onApplyArea(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onCancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }
    

}
