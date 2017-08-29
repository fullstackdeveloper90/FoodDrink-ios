
import UIKit

class MyInfoVC: UIViewController ,UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var scvMyInfo: UIScrollView!
    @IBOutlet weak var btnTrash: UIButton!
    
    @IBOutlet weak var imgVProfile: UIImageView!
    
    
    @IBOutlet weak var vTfName: UIView!
    @IBOutlet weak var vTfEmail: UIView!
    
    @IBOutlet weak var btnBirth: UIButton!
    
    @IBOutlet weak var btnApply: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    
    var button = UIButton()
    var  isEdit = false

    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgVProfile.layer.borderWidth = 1
        imgVProfile.layer.borderColor = UIColor.lightGray.cgColor
        vTfName.layer.borderWidth = 1
        vTfName.layer.borderColor = UIColor.lightGray.cgColor
        vTfName.layer.cornerRadius = CGFloat(Corner_radious2)
        vTfEmail.layer.borderWidth = 1
        vTfEmail.layer.borderColor = UIColor.lightGray.cgColor
        vTfEmail.layer.cornerRadius = CGFloat(Corner_radious2)
        btnBirth.layer.borderWidth = 1
        btnBirth.layer.borderColor = UIColor.lightGray.cgColor
        btnBirth.layer.cornerRadius = CGFloat(Corner_radious2)
        
        btnApply.layer.cornerRadius = CGFloat(Corner_radious2)
        btnCancel.layer.cornerRadius = CGFloat(Corner_radious2)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        button = UIButton (type: .system)
        button.setImage(UIImage(named: "pencil"), for: .normal)
        button.sizeToFit()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem (customView: button)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        
        button.addTarget(self, action: #selector(self.changeBarButtonImage), for: .touchUpInside)
        self.enableEdit()
        
        self.scvMyInfo.translatesAutoresizingMaskIntoConstraints = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapProfileImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        self.imgVProfile.image = selectedImage
        dismiss(animated: true, completion: nil)
    }

    //MARK: My Func
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            scvMyInfo.contentInset = UIEdgeInsets(top:0.0, left:0.0, bottom:keyboardSize.height, right:0.0)
            
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        scvMyInfo.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func changeBarButtonImage(){
        if !isEdit {
            button.setImage(UIImage(named: "checkmark"), for: .normal)
            isEdit = !isEdit
            enableEdit ()
        }else{
            button.setImage(UIImage(named: "pencil"), for: .normal)
            isEdit = !isEdit
            enableEdit ()
        }
    }
    func enableEdit() {
        if isEdit {
            self.btnTrash.isHidden = false
            self.view.isUserInteractionEnabled = true
        }else{
            self.btnTrash.isHidden = true
            self.view.isUserInteractionEnabled = false
        }

    }
    
    //MARK: IBActions
    
    @IBAction func tapTrashBtn(_ sender: Any) {
        self.imgVProfile.image = #imageLiteral(resourceName: "profile")
    }
    @IBAction func onBirthBtn(_ sender: Any) {
        performSegue(withIdentifier: "datepicker", sender: nil)
    }
    @IBAction func onApplyBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }
    @IBAction func onCancelBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)

    }
    @IBAction func onMaleBtn(_ sender: Any) {
        btnMale.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        btnFemale.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        
    }
    @IBAction func onFemaleBtn(_ sender: Any) {
        btnMale.setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        btnFemale.setImage(UIImage(named:"checkboxp"), for: UIControlState.normal)
        
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "datepicker") {
            let searchVC = segue.destination as? DatePickerVC
            searchVC?.pickerType = 1
        }
    }


}
