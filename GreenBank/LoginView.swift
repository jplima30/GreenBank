import UIKit

class LoginView: UIView {
    
    // MARK: - UI Configuration
    // Cores aproximadas extraídas da imagem para fidelidade visual
    private enum Colors {
        static let primaryGreen = UIColor(red: 0.18, green: 0.80, blue: 0.44, alpha: 1.0) // #2ECC71 approx
        static let cardBackground = UIColor(red: 0.17, green: 0.16, blue: 0.30, alpha: 0.95) // Dark Purple/Blue #2B294D approx
        static let inputBackground = UIColor(red: 0.13, green: 0.12, blue: 0.23, alpha: 0.6) // Darker for input
        static let placeholderText = UIColor(white: 1.0, alpha: 0.6)
    }

    // MARK: - Subviews
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background") // Nome baseado na pasta Assets
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Ecobank") // Nome baseado na pasta Assets
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var appTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Eco Bank Ltd."
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Botão "Registre-se" (tipo Ghost/Overlay)
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Registre-se", for: .normal)
        button.setTitleColor(Colors.primaryGreen, for: .normal)
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Container Card (Roxo)
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.cardBackground
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem vindo!"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Por favor insira suas informações para fazer login"
        label.textColor = UIColor(white: 0.9, alpha: 0.8)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let tf = createCustomTextField(placeholder: "E-mail")
        return tf
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tf = createCustomTextField(placeholder: "Senha")
        tf.isSecureTextEntry = true
        
        // Eye Icon
        let eyeButton = UIButton(type: .custom)
        eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        eyeButton.tintColor = .white
        eyeButton.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        eyeButton.contentMode = .scaleAspectFit
        tf.rightView = eyeButton
        tf.rightViewMode = .always
        
        return tf
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = Colors.primaryGreen
        button.setTitleColor(.black, for: .normal) // Texto preto no verde para contraste
        button.layer.cornerRadius = 22 // Altura 44/2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Esqueceu a senha?", for: .normal)
        button.setTitleColor(Colors.primaryGreen, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        backgroundColor = .black
        
        // Adicionar Background
        addSubview(backgroundImageView)
        
        // Adicionar Logo e Título
        addSubview(logoImageView)
        addSubview(appTitleLabel)
        
        // Adicionar Botão Registro
        addSubview(registerButton)
        
        // Adicionar Card
        addSubview(cardView)
        
        // Elementos dentro do Card
        cardView.addSubview(welcomeLabel)
        cardView.addSubview(subtitleLabel)
        cardView.addSubview(emailTextField)
        cardView.addSubview(passwordTextField)
        cardView.addSubview(loginButton)
        cardView.addSubview(forgotPasswordButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Background (preenche tudo)
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Logo
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 80),
            logoImageView.heightAnchor.constraint(equalToConstant: 80),
            
            // App Title
            appTitleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            appTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // Register Button
            registerButton.topAnchor.constraint(equalTo: appTitleLabel.bottomAnchor, constant: 30),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 160),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Card View
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40), // Margem inferior
            cardView.heightAnchor.constraint(equalToConstant: 450), // Altura fixa estimada
            
            // Welcome Label
            welcomeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 30),
            welcomeLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            
            // Subtitle
            subtitleLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            subtitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            // Email Input
            emailTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Password Input
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Login Button
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 160),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            
            // Forgot Password
            forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: cardView.centerXAnchor)
        ])
    }
    
    // Helper to create consistent TextFields
    private func createCustomTextField(placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.backgroundColor = Colors.inputBackground
        tf.layer.cornerRadius = 12
        tf.textColor = .white
        tf.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: Colors.placeholderText]
        )
        // Padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 10))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }
}
