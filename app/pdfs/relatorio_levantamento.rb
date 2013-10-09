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
    
    text getMesTexto(), :align => :right
    
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
    text "Relatório do Caso: #{demanda.nome_consultado}", :size => 11
    
  end
  
  def rodape
    font "Courier", :style => :normal, :color => "0A3697"
    
    text_box "SIE  - SERVIÇOS DE INFORMAÇÃO EMPRESARIAL LTDA-ME", :at => [0,40], :size => 10, :color => "0A3697"
    text_box "Rua Prof. José Cândido Pessoa, 157 - Bairro Novo - Olinda-PE - CEP. 53.030-020", :at => [0,30], :size => 10, :color => "0A3697"
    text_box "Tel. (81) 3439.6911 / 8605.2191 - E-mail: sie@sieservicos.com.br", :at => [0,20], :size => 10, :color => "0A3697"
    text_box "http://www.sieservicos.com.br", :at => [0,10], :size => 10, :color => "0A3697"
  end
  
  def assinatura
    font "Courier", :style => :bold_italic
    
    text "Atenciosamente,"
    text "Sie - Serviços de Informação Empresarial"
    text "81 3439-6911"
  end

  def getMesTexto()
    dia = Time.now.day
    mes = Time.now.month
    ano = Time.now.year
    
    if(mes == 1)
      mes =  "Janeiro"
    elsif(mes == 2)
      mes =  "Fevereiro"
    elsif(mes == 3)
      mes =  "Março"
    elsif(mes == 4)
      mes =  "Abril"
    elsif(mes == 5)
      mes =  "Maio"
    elsif(mes == 6)
      mes =  "Junho"
    elsif(mes == 7)
      mes =  "Junho"
    elsif(mes == 8)
      mes =  "Agosto"
    elsif(mes == 9)
      mes =  "Setembro"
    elsif(mes == 10)
      mes =  "Outubro"
    elsif(mes == 11)
      mes =  "Novembro"
    else
      mes =  "Dezembro"
    end
    
    return "Recife, #{dia} de #{mes} de #{ano}"
  end

end