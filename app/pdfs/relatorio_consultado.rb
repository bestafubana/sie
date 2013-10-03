# encoding: utf-8
class RelatorioConsultado < Prawn::Document

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
    
    text "Consulta nº #{demanda.id}/#{Time.now.year}", :align => :left, :size => 11
    
    if !demanda.data.nil?
      text "Data: #{demanda.data.strftime("%d/%m/%Y")}", :size => 11
    end
    
    move_down 30
    
    text "Abaixo segue pesquisa realizada.", :size => 11
    
    move_down 20

    begin
      
      x_position = cursor
      caminho_foto = demanda.foto.to_s.split("\/").last
      image "#{Rails.root}/public/uploads/demanda/foto/#{demanda.id}/#{caminho_foto}", :at => [0,x_position],
        :width => 320,:height => 450
        
      move_down 470
      
      rodape()
      
      start_new_page
      
       x_position = cursor
       image "#{Rails.root}/app/assets/images/logo.png", :at => [0,x_position],
        :width => 100,:height => 45
        
      move_down 90
      
      informacoes(demanda)
      
      move_down 30
      
      observacoes(demanda)
      
      move_down 40
      
      assinatura()
      
      rodape()
    rescue
      informacoes(demanda)
      
      move_down 30
      
      observacoes(demanda)
      
      move_down 40
      
      assinatura()
      
      move_down 250
      
      rodape()
    end
  end
  
  def informacoes(demanda)
    font "Courier", :style => :bold
    
    text "INFORMAÇÕES", :size => 12
    
    move_down 10
    
    font "Courier", :style => :normal
    
    text "Nome: #{demanda.nome_consultado}", :size => 11
    text "CPF: #{demanda.cpf_consultado}   Data Nasc.: #{demanda.data_nasc_consultado.strftime("%d/%m/%Y")}", :size => 11
    text "RG: #{demanda.titulo_eleitor_consultado}", :size => 11
    text "Mãe: #{demanda.nome_mae_consultado}", :size => 11
    
    if !demanda.data_obito_consultado.nil?
      text "Sexo: #{demanda.sexo_consultado}   Ano de Óbito: #{demanda.data_obito_consultado.year}", :size => 11
    else
      text "Sexo: #{demanda.sexo_consultado}", :size => 11
    end 
    
    text "Unidade Administrativa: #{demanda.unidade_adm_consultado}   Situação Cadastral: #{demanda.situacao_cadastral_consultado}", :size => 11
    text "Endereço: #{demanda.endereco_consultado}", :size => 11
    text "UF: #{demanda.uf}", :size => 11
    text "Solicitante: #{demanda.solicitante}", :size => 11
    text "Empresa: #{demanda.caminho_foto}", :size => 11   
    text "Departamento: #{demanda.departamento}", :size => 11
    
    if !demanda.resposta.nil?
      text "Resposta: #{demanda.resposta.strftime("%d/%m/%Y")}", :size => 11
    end
    
  end
  
  def rodape
    font "Courier", :style => :normal, :color => "0A3697"
    
    text_box "SIE  - SISTEMA DE INFORMAÇÃO EMPRESARIAL LTDA-ME", :at => [0,40], :size => 10, :color => "0A3697"
    text_box "Rua Prof. José Cândido Pessoa, 157 - Bairro Novo - Olinda-PE - CEP. 53.030-020", :at => [0,30], :size => 10, :color => "0A3697"
    text_box "Tel. (81) 3439.6911 / 8605.2191 - E-mail: sie@sieservicos.com.br", :at => [0,20], :size => 10, :color => "0A3697"
    text_box "http://www.sieservicos.com.br", :at => [0,10], :size => 10, :color => "0A3697"
  end
  
  def observacoes(demanda)
    font "Courier", :style => :bold
    
    text "OBSERVAÇÕES", :size => 12
    
    move_down 10
    
    font "Courier", :style => :normal
    text "#{demanda.observacoes_consultado}", :size => 11
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