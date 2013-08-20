# encoding: utf-8
class RelatorioLevantamento < Prawn::Document

  def initialize(demanda, view, request)
    super()
    @demanda = demanda
    @view = view
    
    font "Courier"
    
    x_position = cursor
    image "#{Rails.root}/app/assets/images/logo.png", :at => [0,x_position],
      :width => 100,:height => 45
    
    move_down 90
    
    text "Recife, #{Time.now.strftime("%d de %B de %Y")}", :align => :right
    
    move_down 30
    
    begin
      
      #if !demanda.foto.nil?
      #  font "Courier", :style => :bold
      #
      #  text "Documento Consultado", :size => 12
      #end
      x_position = cursor
      caminho_foto = demanda.foto.to_s.split("\/").last
      image "#{Rails.root}/public/uploads/demanda/foto/#{demanda.id}/#{caminho_foto}", :at => [0,x_position],
        :width => 520,:height => 380
        
      move_down 470
      
      rodape()
      
      start_new_page
      
       x_position = cursor
       image "#{Rails.root}/app/assets/images/logo.png", :at => [0,x_position],
        :width => 100,:height => 45
        
      move_down 90
      
      informacoes(demanda)
      
      move_down 40
      
      assinatura()
    rescue
      informacoes(demanda)
      
      move_down 40
      
      assinatura()
      
      move_down 250
      
      rodape()
    end
  end
  
  def informacoes(demanda)
    font "Courier", :style => :bold
    
    text "INFORMAÇÕES DO LEVANTAMENTO", :size => 12
    
    move_down 10
    
    font "Courier", :style => :normal
    text "Data: #{demanda.data.strftime("%d/%m/%Y")}", :size => 11
    text "UF: #{demanda.uf}", :size => 11
    text "Solicitante: #{demanda.solicitante}", :size => 11
    text "Empresa: #{demanda.caminho_foto}", :size => 11
    
    if !@demanda.resposta.nil? 
      text "Resposta: #{demanda.resposta.strftime("%d/%m/%Y")}", :size => 11
    end
    
    text "Local Visitado: #{demanda.cpf_consultado}", :size => 11
    text "Endereço: #{demanda.nome_mae_consultado}", :size => 11
    text "Telefone: #{demanda.unidade_adm_consultado}", :size => 11
    text "Hora da Visita: #{demanda.situacao_cadastral_consultado}", :size => 11
    
  end
  
  def rodape
    font "Courier", :style => :normal, :color => "0A3697"
    
    text "SIE  - SISTEMA DE INFORMAÇÃO EMPRESARIAL LTDA-ME", :color => "0A3697", :align => :right, :size => 10
    text "Rua Prof. José Cândido Pessoa, 157 - Bairro Novo - Olinda-PE - CEP. 53.030-020", :color => "0A3697", :align => :right, :size => 10
    text "Tel. (81) 3439.6911 / 8605.2191 - E-mail: sie@sieservicos.com.br", :color => "0A3697", :align => :right, :size => 10
    text "http://www.sieservicos.com.br", :color => "0A3697", :align => :right, :size => 10
  end
  
  def assinatura
    font "Courier", :style => :bold_italic
    
    text "Atenciosamente,"
    text "Sie - Sistema de Informação Empresarial"
    text "81 3439-6911"
  end

end