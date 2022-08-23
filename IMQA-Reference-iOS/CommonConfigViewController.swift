import UIKit

class CommonConfigViewController: UIViewController {

    @IBOutlet weak var pkField: UITextField!
    @IBOutlet weak var apiField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pkField.text = UserDefaults.standard.string(forKey: "PK")
        apiField.text = UserDefaults.standard.string(forKey: "IMQA_URL")
    }
    
    @IBAction func save(_ sender: Any) {
        UserDefaults.standard.set(pkField.text ?? "", forKey: "PK")
        UserDefaults.standard.set(apiField.text ?? "https://collector.imqa.io", forKey: "IMQA_URL")
        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            exit(0)
        }
        
    }
    
}
