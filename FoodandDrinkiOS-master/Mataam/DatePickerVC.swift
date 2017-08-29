
import UIKit

class DatePickerVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var vPicker: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var pvPicker: UIPickerView!
    @IBOutlet weak var dpvDate: UIDatePicker!
    
    var pickerType = 1
    let personNum = ["1 people","2 people","3 people","4 people","5 people","6 people","7 people","8 people","9 people","10 people","11 people","12 people","13 people","14 people","15 people","16 people","17 people","18 people","19 people","20 people","Lager Party"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vPicker.layer.cornerRadius = CGFloat(Corner_radious2)
        var date = Date()
        date.addTimeInterval(15)
        
        dpvDate.minimumDate = date
        dpvDate.minuteInterval = 15
        self.initUI(type: self.pickerType)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: MyFunc
    
    func initUI(type:Int) {
        switch type {
        case 1:
            dpvDate.datePickerMode = .date
            pvPicker.isHidden = true
            lblTitle.text = "Choose Date"
        case 2:
            dpvDate.datePickerMode = .time
            dpvDate.minuteInterval = 15
            pvPicker.isHidden = true
            lblTitle.text = "Choose Time"
        case 3:
            pvPicker.isHidden = false
            dpvDate.isHidden = true
            lblTitle.text = "Nmuber of person"

        default:
            break
        }
        pvPicker.reloadAllComponents()
    }
    
    //MARK: PickerViewDataSource
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerType == 3 {
            return 1
        }else {
            return 0
        }
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerType == 3 {
            return personNum.count
        }else {
            return 0
        }

    }

    
    //MARK: PickerViewDelegate
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerType == 3 {
            return personNum[row]
        }else {
            return nil
        }
    }

    @IBAction func onBtnDone(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onBtnCancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

}
