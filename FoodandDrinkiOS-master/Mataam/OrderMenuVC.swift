
import UIKit
import SwipeCellKit

class OrderMenuVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tvMyOrders: UITableView!
    
    var defaultOptions = SwipeTableOptions()
    var isSwipeRightEnabled = true
    var buttonDisplayMode: ButtonDisplayMode = .titleAndImage
    var buttonStyle: ButtonStyle = .backgroundColor
    
    var rowCount = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
       
        tvMyOrders.tableFooterView = UIView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if rowCount == 0 {
            rowCount = 4
            return 1
        }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MyOrderTableViewCell"
        let cell = tvMyOrders.dequeueReusableCell(withIdentifier: cellIdentifier) as! MyOrderTableViewCell!
        
        cell?.delegate = self
        cell?.selectedBackgroundView = createSelectedBackgroundView()
        
        switch indexPath.row {
        case 0:
            cell?.imgvStatus.image = #imageLiteral(resourceName: "orangeBallon")
            cell?.lblStatus.text = "Under process"
            cell?.lblStatus.textColor = UIColor.orange
        case 1:
            cell?.imgvStatus.image = #imageLiteral(resourceName: "greenballon")
            cell?.lblStatus.text = "Completed"
            cell?.lblStatus.textColor = UIColor.green

        case 2:
            cell?.imgvStatus.image = #imageLiteral(resourceName: "blueballon")
            cell?.lblStatus.text = "Canceled"
            cell?.lblStatus.textColor = UIColor.red

        case 3:
            cell?.imgvStatus.image = #imageLiteral(resourceName: "greenballon")
            cell?.lblStatus.text = "Completed"
            cell?.lblStatus.textColor = UIColor.green

        default:
            break
        }
        
        return cell!
    }


    //MARK: - IBActions
    
    @IBAction func onMainMenu(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

    
    // MARK: - Helpers
    
    func createSelectedBackgroundView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        return view
    }
    
    func resetData() {

    }
    
    
}

extension OrderMenuVC: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        if orientation == .left {
            return[]
        } else {
            switch indexPath.row {
            case 0:
                let detail = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.performSegue(withIdentifier: "orderdetail", sender: nil)
                }
                
                configure(action: detail, with: .detail)
                
                let cancel = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.rowCount = self.rowCount - 1
                    self.tvMyOrders.reloadData()
                }
                
                configure(action: cancel, with: .cancel)
                
                return [cancel,detail]
            case 1:

                let reorder = SwipeAction(style: .default, title: nil) { action, indexPath in
                    self.performSegue(withIdentifier: "reorder", sender: nil)
                    
                }
                configure(action: reorder, with: .reorder)
                
                let detail = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.performSegue(withIdentifier: "orderdetail", sender: nil)
                }
                
                configure(action: detail, with: .detail)
                
                let rate = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.performSegue(withIdentifier: "orderrate", sender: nil)
                }
                configure(action: rate, with: .rate)
                
                
                return [rate,reorder,detail]
            case 2:
                let detail = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.performSegue(withIdentifier: "orderdetail", sender: nil)
                }
                
                configure(action: detail, with: .detail)
                
                let cancel = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.rowCount = self.rowCount - 1
                    self.tvMyOrders.reloadData()
                }
                
                configure(action: cancel, with: .cancel)
                
                return [cancel,detail]
            case 3:
                let reorder = SwipeAction(style: .default, title: nil) { action, indexPath in
                    self.performSegue(withIdentifier: "reorder", sender: nil)
                    
                }
                configure(action: reorder, with: .reorder)
                
                let detail = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.performSegue(withIdentifier: "orderdetail", sender: nil)
                }
                
                configure(action: detail, with: .detail)
                
                let rate = SwipeAction(style: .default, title: nil){ action, indexPath in
                    self.performSegue(withIdentifier: "orderrate", sender: nil)
                }
                configure(action: rate, with: .rate)
                
                
                return [rate,reorder,detail]

            default:
                return []
            }
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        var options = SwipeTableOptions()
        options.transitionStyle = defaultOptions.transitionStyle
        
        switch buttonStyle {
        case .backgroundColor:
            options.buttonSpacing = 5
        case .circular:
            options.buttonSpacing = 4
            options.backgroundColor = #colorLiteral(red: 0.9467939734, green: 0.9468161464, blue: 0.9468042254, alpha: 1)
        }
        
        return options
    }
    
    func configure(action: SwipeAction, with descriptor: ActionDescriptor) {
        action.title = descriptor.title(forDisplayMode: buttonDisplayMode)
        action.image = descriptor.image(forStyle: buttonStyle, displayMode: buttonDisplayMode)
        
        switch buttonStyle {
        case .backgroundColor:
            action.backgroundColor = descriptor.color
        case .circular:
            action.backgroundColor = .clear
            action.textColor = descriptor.color
            action.font = .systemFont(ofSize: 12)
            action.transitionDelegate = ScaleTransition.default
        }
    }
}

class MyOrderTableViewCell: SwipeTableViewCell {
    
    @IBOutlet var imgvStatus: UIImageView!
    @IBOutlet var lblStatus: UILabel!
    @IBOutlet var imgvItem: UIImageView!
    
    var animator: Any?
    
    var indicatorView = IndicatorView(frame: .zero)
    
    var unread = false {
        didSet {
            indicatorView.transform = unread ? CGAffineTransform.identity : CGAffineTransform.init(scaleX: 0.001, y: 0.001)
        }
    }
    
    override func awakeFromNib() {
        setupIndicatorView()
    }
    
    func setupIndicatorView() {
        imgvItem.layer.borderWidth = 1
        imgvItem.layer.borderColor = UIColor.lightGray.cgColor

        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.color = tintColor
        indicatorView.backgroundColor = .clear
        contentView.addSubview(indicatorView)
        
        let size: CGFloat = 0
        indicatorView.widthAnchor.constraint(equalToConstant: size).isActive = true
        indicatorView.heightAnchor.constraint(equalTo: indicatorView.widthAnchor).isActive = true
        indicatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
    }
    
    func setUnread(_ unread: Bool, animated: Bool) {
        let closure = {
            self.unread = unread
        }
        
        if #available(iOS 10, *), animated {
            var localAnimator = self.animator as? UIViewPropertyAnimator
            localAnimator?.stopAnimation(true)
            
            localAnimator = unread ? UIViewPropertyAnimator(duration: 1.0, dampingRatio: 0.4) : UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1.0)
            localAnimator?.addAnimations(closure)
            localAnimator?.startAnimation()
            
            self.animator = localAnimator
        } else {
            closure()
        }
    }
}

class IndicatorView: UIView {
    var color = UIColor.clear {
        didSet { setNeedsDisplay() }
    }
    
    override func draw(_ rect: CGRect) {
        color.set()
        UIBezierPath(ovalIn: rect).fill()
    }
}

enum ActionDescriptor {
    case detail, reorder, rate, cancel
    
    func title(forDisplayMode displayMode: ButtonDisplayMode) -> String? {
        guard displayMode != .imageOnly else { return nil }
        
        switch self {
        case .detail: return " DETAILS"
        case .reorder: return "RE-ORDER"
        case .rate: return "   RATES"
        case .cancel: return "  CANCEL"
        }
    }
    
    func image(forStyle style: ButtonStyle, displayMode: ButtonDisplayMode) -> UIImage? {
        guard displayMode != .titleOnly else { return nil }
        
        let name: String
        switch self {
        case .detail: name = "preview"
        case .reorder: name = "clockwise"
        case .rate: name = "star"
        case .cancel: name = "cancelorder"
        }
        
        return UIImage(named: style == .backgroundColor ? name : name + "-circle")
    }
    
    var color: UIColor {
        switch self {
        case .detail: return ORANGE_C
        case .reorder: return GREEN_C
        case .rate: return YELLOW_C
        case .cancel: return RED_C
        }
    }
}

enum ButtonDisplayMode {
    case titleAndImage, titleOnly, imageOnly
}

enum ButtonStyle {
    case backgroundColor, circular
}

