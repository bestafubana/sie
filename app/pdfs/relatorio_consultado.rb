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
    
    text "Recife, #{Time.now.strftime("%d de %B de %Y")}", :align => :right
    
    move_down 30
    
    text "Consulta nº #{demanda.id}/#{Time.now.year}", :align => :left, :size => 11
    
    move_down 30
    
    text "Abaixo segue pesquisa realizada.", :size => 11
    
    move_down 20
    font "Courier", :style => :bold
    
    text "Documento Consultado", :size => 12
    
    x_position = cursor
    caminho_foto = demanda.foto.to_s.split("\/").last
    image "#{Rails.root}/public/uploads/demanda/foto/#{demanda.id}/#{caminho_foto}", :at => [0,x_position],
      :width => 320,:height => 450
      
    move_down 470
    
    ################ RODAPÉ #############
    font "Courier", :style => :normal, :color => "0A3697"
    
    text "SIE SERVIÇOS DE INFORMAÇÃO EMPRESARIAL LTDA-ME", :color => "0A3697", :align => :right, :size => 10
    text "Rua Prof. José Cândido Pessoa, 157 - Bairro Novo - Olinda-PE - CEP. 53.030-020", :color => "0A3697", :align => :right, :size => 10
    text "Tel. (81) 3439.6911 / 8605.2191 - E-mail: sie@sieservicos.com.br", :color => "0A3697", :align => :right, :size => 10
    ################ FIM RODAPÉ #############
    
    ##################################### PAGINA 2 ##########################################
    start_new_page
    
     x_position = cursor
    image "#{Rails.root}/app/assets/images/logo.png", :at => [0,x_position],
      :width => 100,:height => 45
      
    move_down 90
    
    ################ BLOCO DE INFORMAÇOES #############
    font "Courier", :style => :bold
    
    text "INFORMAÇÕES", :size => 12
    
    move_down 10
    
    font "Courier", :style => :normal
    text "Nome: #{demanda.nome_consultado}", :size => 11
    text "CPF: #{demanda.cpf_consultado}   Data Nasc.: #{demanda.data_nasc_consultado.strftime("%d/%m/%Y")}", :size => 11
    text "Mãe: #{demanda.nome_mae_consultado}", :size => 11
    text "Título de Eleitor: #{demanda.titulo_eleitor_consultado}", :size => 11
    text "Sexo: #{demanda.sexo_consultado}   Ano de Óbito: #{demanda.data_obito_consultado.year}", :size => 11
    text "Unidade Administrativa: #{demanda.unidade_adm_consultado}   Situação Cadastral: #{demanda.situacao_cadastral_consultado}", :size => 11
    text "Endereço: #{demanda.endereco_consultado}", :size => 11
    
    ############## FIM DO BLOCO DE INFORMAÇOES ###########
    
    move_down 30
    
    ################ BLOCO DE OBSERVACOES #############
    
    font "Courier", :style => :bold
    
    text "OBSERVAÇÕES", :size => 12
    
    move_down 10
    
    font "Courier", :style => :normal
    text "#{demanda.observacoes_consultado}", :size => 11
    
    ################  FIM DO BLOCO DE OBSERVAÇOES #############
    
    move_down 40
    
    
    ################ ASSINATURA #############
    font "Courier", :style => :bold_italic
    
    text "Atenciosamente,"
    text "Sie Consultoria e Informção"
    text "81 3439-6911"
    ################  FIM ASSINATURA #############
    
    
    
  end

end