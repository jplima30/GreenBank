import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties
    private let customView = LoginView()
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    // MARK: - Setup Actions
    private func setupActions() {
        // Aqui conectaremos os targets dos botões futuramente
        print("LoginViewController carregada com sucesso!")
    }
    
    // MARK: - UI Configuration
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
