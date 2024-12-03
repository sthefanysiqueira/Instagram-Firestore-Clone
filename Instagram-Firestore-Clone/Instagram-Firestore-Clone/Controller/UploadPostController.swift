import UIKit

class UploadPostController: UIViewController {
    
    // MARK: - Properties
    
    // Configura a imagem que será exibida na tela (pré-visualização do post)
    private let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    
    // Campo de texto para o usuário inserir a legenda do post
    private lazy var captionTextView: InputTextView = {
        let tv = InputTextView()
        tv.placeholderText = "Enter caption.." // Texto a ser exibido quando o campo de texto está vazio
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.delegate = self // Define o controller como delegate para gerenciar eventos do texto
        return tv
    }()
    
    // Label para exibir a contagem de caracteres digitados no campo de legenda
    private let characterCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "0/100"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI() // Configura a interface da tela
    }
    
    // MARK: - Actions
    
    // Fecha a tela ao tocar no botão "Cancel"
    @objc func didTapCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    // Imprime uma mensagem ao tocar no botão "Share" (placeholder para futura funcionalidade)
    @objc func didTapDone() {
        print("DEBUG: Share post here..")
    }
    
    // MARK: - Helpers
    
    // Garante que o texto no campo de legenda não ultrapasse 100 caracteres
    func checkMaxLength(_ textView: UITextView) {
        if (textView.text.count) > 100 {
            textView.deleteBackward() // Remove o último caractere digitado se exceder o limite
        }
    }
    
    // Configura os elementos visuais da interface
    func configureUI() {
        view.backgroundColor = .white
        
        // Configura o título e os botões de navegação
        navigationItem.title = "Upload Post"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                           target: self,
                                                           action: #selector(didTapCancel))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .done,
                                                            target: self, action: #selector(didTapDone))
        
        // Adiciona a imagem de pré-visualização ao layout
        view.addSubview(photoImageView)
        photoImageView.setDimensions(height: 180, width: 180)
        photoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 8)
        photoImageView.centerX(inView: view)
        photoImageView.layer.cornerRadius = 10
        
        // Adiciona o campo de texto para legenda ao layout
        view.addSubview(captionTextView)
        captionTextView.anchor(top: photoImageView.bottomAnchor, left: view.leftAnchor,
                               right: view.rightAnchor, paddingTop: 16, paddingLeft: 12,
                               paddingRight: 12, height: 64)
        
        // Adiciona o contador de caracteres ao layout
        view.addSubview(characterCountLabel)
        characterCountLabel.anchor(bottom: captionTextView.bottomAnchor, right: view.rightAnchor,
                                   paddingBottom: -8, paddingRight: 12)
    }
}

// MARK: - UITextFieldDelegate

// Extensão para gerenciar eventos relacionados ao campo de texto (legenda)
// Verifica o limite de caracteres, Conta os caracteres digitados e Atualiza a label com a contagem
extension UploadPostController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        checkMaxLength(textView)
        let count = textView.text.count
        characterCountLabel.text = "\(count)/100"
    }
}
