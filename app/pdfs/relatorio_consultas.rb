# encoding: utf-8
class RelatorioConsultas < Prawn::Document

  def initialize(demandas, mes, ano, view, demanda_texto)
    super()
    @demandas = demandas
    @view = view
    
    x_position = cursor
    image "#{Rails.root}/app/assets/images/logo.png", :at => [0,x_position],
      :width => 100,:height => 45
    
    move_down 60
    
    font "Courier", :style => :bold
    
    
    #checa se nÜo està vazia a lista de demandas
    if @demandas.length > 0
      text "Relatorio de #{demanda_texto} - #{@demandas[0].data.strftime("%m/%Y")}",:size => 18 
      
      move_down 20
      
      font "Courier", :style => :normal
      dados = [["UF", "Quantidade"]]
    
      @demandas.each do |demanda|
        
        dados.push [demanda.uf, demanda.count]
      end
      
      table(dados, :header => true, :width => 400,
            :column_widths => [150, 250], :row_colors => ["F0F0F0", "FFFFCC"])
      
    else
      text "Periodo sem consultas",:size => 18, :align => :center
    end
    
    font "Courier", :style => :normal, :color => "0A3697"
    
    text_box "SIE  - SISTEMA DE INFORMACAO EMPRESARIAL LTDA-ME", :at => [0,40], :size => 10, :color => "0A3697"
    text_box "Rua Prof. Jose Candido Pessoa, 157 - Bairro Novo - Olinda-PE - CEP. 53.030-020", :at => [0,30], :size => 10, :color => "0A3697"
    text_box "Tel. (81) 3439.6911 / 8605.2191 - E-mail: sie@sieservicos.com.br", :at => [0,20], :size => 10, :color => "0A3697"
    text_box "http://www.sieservicos.com.br", :at => [0,10], :size => 10, :color => "0A3697"
    
  end

end