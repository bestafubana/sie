class ContatoPdf < Prawn::Document

  def initialize(contato, mes, view)
    super()
    @contato = contato
    @view = view
    text "Teste do carai a 4 com o contato de id: #{@contato.id} \n" +
    "aloooooooooo"
  end

end