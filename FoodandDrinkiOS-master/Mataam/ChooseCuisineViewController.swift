
import UIKit

class ChooseCuisineViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CusineCVCDelegate{

    let cuisineList = ["All (94)","Arabic (16)","Asian (33)", "Chinese (25)","Arabic (16)","Asian (33)", "Chinese (25)","Arabic (16)","Asian (33)", "Chinese (25)","Arabic (16)","Asian (33)", "Chinese (25)"]
    var cuisineItems = [CuisineItem]()
    
    @IBOutlet weak var cvCuisine: UICollectionView!
    @IBOutlet weak var btnApply: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cuisineItem1 = CuisineItem(isSelect:false, cuisineName:"All (90)")
        let cuisineItem2 = CuisineItem(isSelect:false, cuisineName:"Arabic (16)")
        let cuisineItem3 = CuisineItem(isSelect:false, cuisineName:"Chinese (16)")
        let cuisineItem4 = CuisineItem(isSelect:false, cuisineName:"Arabic (16)")
        let cuisineItem5 = CuisineItem(isSelect:false, cuisineName:"Arabic (16)")
        let cuisineItem6 = CuisineItem(isSelect:false, cuisineName:"Asian (16)")
        let cuisineItem7 = CuisineItem(isSelect:false, cuisineName:"Arabic (16)")
        let cuisineItem8 = CuisineItem(isSelect:false, cuisineName:"Chinese (16)")
        let cuisineItem9 = CuisineItem(isSelect:false, cuisineName:"Arabic (16)")
        
        self.cuisineItems = [cuisineItem1!,cuisineItem2!,cuisineItem3!,cuisineItem4!,cuisineItem5!,cuisineItem6!,cuisineItem7!,cuisineItem8!,cuisineItem9!]
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        cvCuisine!.register(UINib(nibName: "CuisineCVC", bundle: nil), forCellWithReuseIdentifier: "CuisineCVC")
        
        self.initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //UICollectionViewDelegateFlowLayout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0;
    }
    
    
    //MARK: -UICollectionViewDatasource methods
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return cuisineItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CuisineCVC", for: indexPath) as! CuisineCVC
        cell.delegate = self
        cell.selectedItem = indexPath.item
        
        let cuisineItem = self.cuisineItems[indexPath.item]
        let isSelect = cuisineItem.isSelect

        if isSelect == true {
            cell.imvCheck.image = #imageLiteral(resourceName: "checkboxp")
        }else{
            cell.imvCheck.image = #imageLiteral(resourceName: "checkbox")
        }
        cell.lblCuisine.text = cuisineItem.cuisineName
        
        return cell
    }
    //MARK: -CVDelegate

    //MARK: - MyFunc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    func initUI() {
        self.btnApply.layer.cornerRadius = CGFloat(Corner_radious2)
        self.btnCancel.layer.cornerRadius = CGFloat(Corner_radious2)
    }
    
    //MARK: - CuisineCVCDelegate
    func didSelectCusineCVC(Selected: Bool, Cell: CuisineCVC) {
        
        let cuisineItem = cuisineItems[Cell.selectedItem]
        cuisineItem.isSelect = !cuisineItem.isSelect
        for item in cuisineItems{
            if item != cuisineItem{
                item.isSelect = false
            }
        }
        self.cvCuisine .reloadData()
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

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
