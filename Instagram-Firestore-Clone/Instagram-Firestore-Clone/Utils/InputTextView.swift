import UIKit

class InputTextView: UITextView {
    
    // MARK: - Properties
    
    // Define o texto placeholder
    var placeholderText: String? {
        // Atualiza o texto da `placeholderLabel` sempre que o valor de `placeholderText` mudar
        didSet { placeholderLabel.text = placeholderText }
    }
    
    // Label para exibir o texto placeholder no campo de texto
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    
    // MARK: - Lifecycle
    
    // Inicializador da classe (chamado ao criar a instância programaticamente)
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        // Adiciona a label de placeholder ao campo de texto e define sua posição
        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 6, paddingLeft: 8)
        
        // Observa mudanças no texto do campo de texto
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextDidChange),
                                               name: UITextView.textDidChangeNotification, object: nil)
    }
    
    // Inicializador obrigatório (necessário quando usado em storyboards ou nibs)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    // Função chamada sempre que o texto do campo de texto mudar
    @objc func handleTextDidChange() {
        placeholderLabel.isHidden = !text.isEmpty // Oculta o placeholder se o campo de texto não estiver vazio
    }
}
