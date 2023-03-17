import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var t1: UITextField!
    @IBOutlet weak var t2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let abc = segue.destination as! ViewController2
        abc.a1 = t1.text!
        abc.a2 = t2.text!
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        showAlert()
    }
    func showAlert(){
        let alert = UIAlertController(title: "Save", message: "Save", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Save", style: .default,handler: { _ in
            UserDefaults.standard.set(self.t1.text!, forKey: "username")
            UserDefaults.standard.set(self.t2.text!, forKey: "password")
            self.performSegue(withIdentifier: "cell", sender: self)
        }))
        alert.addAction(UIAlertAction.init(title: "cancel", style: .destructive,handler: nil))
        present(alert, animated: true,completion: nil)
    }
}

