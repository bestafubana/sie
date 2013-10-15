#encoding: utf-8

class DemandasController < ApplicationController
  # GET /demandas
  # GET /demandas.json
  def index
    @demandas = Demanda.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @demandas }
    end
  end
  
  def list
    
    mes = nil
    ano = nil
    
    if params[:mes] != nil and !params[:mes].empty?
      mes = params[:mes]
    else
      mes = Time.now.month
    end
    
    if params[:ano] != nil and !params[:ano].empty?
      ano = params[:ano]
    else
      ano = Time.now.year
    end
    
    @demandas = Demanda.where("tipo_demanda = :td AND MONTH(data) = :m AND YEAR(data) = :a",
                              :td => params[:tipo_demanda], :m => mes, :a => ano)

    respond_to do |format|
      if params[:tipo_demanda] == '1'
        format.html { render "demandas/consultas" }
        format.json { render :json => @demandas }
      elsif params[:tipo_demanda] == '2'
        format.html { render "demandas/levantamentos" }
        format.json { render :json => @demandas }
      else
        format.html { render "demandas/flagrantes" }
        format.json { render :json => @demandas }
      end
    end    
  end

  # GET /demandas/1
  # GET /demandas/1.json 
  def show
    @demanda = Demanda.find(params[:id])

    respond_to do |format|
        format.html { render "demandas/show_consulta" }
        format.json { render :json => @demandas }
    end
  end
  
  def show_levantamento
    @demanda = Demanda.find(params[:id])

    respond_to do |format|
        format.html { render "demandas/show" }
        format.json { render :json => @demandas } 
    end
  end
  
  def show_flagrante
    @demanda = Demanda.find(params[:id])

    respond_to do |format|
        format.html { render "demandas/show_flagrante" }
        format.json { render :json => @demandas } 
    end
  end

  # GET /demandas/new
  # GET /demandas/new.json
  def new
    @demanda = Demanda.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @demanda }
    end
  end
  
  def relatorio_consultado
    @demanda = Demanda.find(params[:id])
    
    respond_to do |format|
      format.html { render "demandas/#{params[:id]}" }
      format.pdf do
        pdf = RelatorioConsultado.new(@demanda, view_context, request)
        send_data pdf.render, :filename =>
            "relatorio_consultado_#{Time.now.strftime("%d-%m-%Y %H:%M:%S")}.pdf",
                  :type => "application/pdf", :layout => "application"
      end
    end   
  end
  
  def relatorio_consultas
    @demandas = Demanda.select("data, uf, COUNT(uf) as count").where("tipo_demanda = :td AND MONTH(data) = :m AND YEAR(data) = :a",
                             {:td => params[:tipo_demanda], :m => params[:mes], :a => params[:ano]}).group("uf").order("uf ASC")
    respond_to do |format|
      format.html { render "demandas/demandas_teste" }
      format.pdf do
        pdf = RelatorioConsultas.new(@demandas, params[:mes], params[:ano], view_context, "Consultas")
        send_data pdf.render, :filename =>
            "relatorio_#{Time.now.strftime("%d-%m-%Y %H:%M:%S")}.pdf",
                  :type => "application/pdf", :layout => "application"
      end
    end   
  end
  
  def relatorio_flagrantes
    @demandas = Demanda.select("data, uf, COUNT(uf) as count").where("tipo_demanda = :td AND MONTH(data) = :m AND YEAR(data) = :a",
                             {:td => params[:tipo_demanda], :m => params[:mes], :a => params[:ano]}).group("uf").order("uf ASC")
    respond_to do |format|
      format.html { render "demandas/demandas_teste" }
      format.pdf do
        pdf = RelatorioConsultas.new(@demandas, params[:mes], params[:ano], view_context, "Flagrantes")
        send_data pdf.render, :filename =>
            "relatorio_#{Time.now.strftime("%d-%m-%Y %H:%M:%S")}.pdf",
                  :type => "application/pdf", :layout => "application"
      end
    end   
  end
  
  def relatorio_flagrante
    @demanda = Demanda.find(params[:id])
    
    respond_to do |format|
      format.html { render "demandas/#{params[:id]}" }
      format.pdf do
        pdf = RelatorioFlagrante.new(@demanda, view_context, request)
        send_data pdf.render, :filename =>
            "relatorio_#{Time.now.strftime("%d-%m-%Y %H:%M:%S")}.pdf",
                  :type => "application/pdf", :layout => "application"
      end
    end   
  end
  
  def relatorio_levantamentos
    @demandas = Demanda.select("data, uf, COUNT(uf) as count").where("tipo_demanda = :td AND MONTH(data) = :m AND YEAR(data) = :a",
                             {:td => params[:tipo_demanda], :m => params[:mes], :a => params[:ano]}).group("uf").order("uf ASC")
    respond_to do |format|
      format.html { render "demandas/demandas_teste" }
      format.pdf do
        pdf = RelatorioConsultas.new(@demandas, params[:mes], params[:ano], view_context, "Levantamentos")
        send_data pdf.render, :filename =>
            "relatorio_#{Time.now.strftime("%d-%m-%Y %H:%M:%S")}.pdf",
                  :type => "application/pdf", :layout => "application"
      end
    end   
  end
  
  def relatorio_levantamento
    @demanda = Demanda.find(params[:id])

    respond_to do |format|
      format.html { render "demandas/#{params[:id]}" }
      format.pdf do
        pdf = RelatorioLevantamento.new(@demanda, view_context, request)
        send_data pdf.render, :filename =>
            "relatorio_#{Time.now.strftime("%d-%m-%Y %H:%M:%S")}.pdf",
                  :type => "application/pdf", :layout => "application"
      end
    end   
  end

  def new_consulta
    @demanda = Demanda.new

    respond_to do |format|
      format.html { render "demandas/new_consulta" }
      format.json { render :json => @demandas }
    end
  end
  
  def new_levantamento
    @demanda = Demanda.new

    respond_to do |format|
      format.html { render "demandas/new_levantamento" }
      format.json { render :json => @demandas }
    end
  end
  
  def new_flagrante
    @demanda = Demanda.new

    respond_to do |format|
      format.html { render "demandas/new_flagrante" }
      format.json { render :json => @demandas }
    end
  end

  # GET /demandas/1/edit
  def edit
    @demanda = Demanda.find(params[:id])
  end
  
  # GET /demandas/1/edit_flagrante
  def edit_flagrante
    @demanda = Demanda.find(params[:id])
  end
  
  # GET /demandas/1/edit_consulta
  def edit_consulta
    @demanda = Demanda.find(params[:id])
  end
  
  # GET /demandas/1/edit_levantamento
  def edit_levantamento
    @demanda = Demanda.find(params[:id])
  end

  # POST /demandas
  # POST /demandas.json
  def create
    @demanda = Demanda.new(params[:demanda])

    respond_to do |format|
      if @demanda.save
        if @demanda.tipo_demanda == '1' || @demanda.tipo_demanda == 1
          format.html { render "/demandas/show_consulta", :notice => 'Consulta criada com sucesso.'}
          format.json { render :json => @demandas, :status => :created, :location => @demanda  }
        elsif @demanda.tipo_demanda == '2' || @demanda.tipo_demanda == 2
          format.html { render "/demandas/show", :notice => 'Levantamento criado com sucesso.' }
          format.json { render :json => @demandas, :status => :created, :location => @demanda  }
        else
          format.html { render "/demandas/show_flagrante", :notice => 'Flagrante criada com sucesso.' }
          format.json { render :json => @demandas, :status => :created, :location => @demanda  }
        end
      else
        format.html { render :action => "new" }
        format.json { render :json => @demanda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /demandas/1
  # PUT /demandas/1.json
  def update
    @demanda = Demanda.find(params[:id])

    respond_to do |format|
      if @demanda.update_attributes(params[:demanda])
        if @demanda.tipo_demanda == '1' || @demanda.tipo_demanda == 1
          format.html { redirect_to "/consultas/list/1", :notice => 'Consulta atualizada com sucesso.'}
          format.json { head :no_content }
        elsif @demanda.tipo_demanda == '2' || @demanda.tipo_demanda == 2
          format.html { redirect_to "/consultas/list/2", :notice => 'Levantamento atualizado com sucesso.' }
          format.json { head :no_content }
        else
          format.html { redirect_to "/consultas/list/3", :notice => 'Flagrante atualizado com sucesso.' }
          format.json { head :no_content }
        end
      else
        format.html { render :action => "edit" }
        format.json { render :json => @demanda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /demandas/1
  # DELETE /demandas/1.json
  def destroy
    @demanda = Demanda.find(params[:id])
    @demanda.destroy

    respond_to do |format|
      if params[:tipo_demanda] == '1'
        format.html { redirect_to "/consultas/list/1" }
        format.json { render :json => @demandas }
      elsif params[:tipo_demanda] == '2'
        format.html { redirect_to "/consultas/list/2" }
        format.json { render :json => @demandas }
      else
        format.html { redirect_to "/consultas/list/3" }
        format.json { render :json => @demandas }
      end
    end
  end
  
  def destroy_consulta
    @demanda = Demanda.find(params[:id])
    @demanda.destroy

    respond_to do |format|
        format.html { redirect_to "/consultas/list/1" }
        format.json { render :json => @demandas }
    end
  end
  
  def destroy_levantamento
    @demanda = Demanda.find(params[:id])
    @demanda.destroy

    respond_to do |format|
        format.html { redirect_to "/consultas/list/2" }
        format.json { render :json => @demandas }
    end
  end
  
  def destroy_flagrante
    @demanda = Demanda.find(params[:id])
    @demanda.destroy

    respond_to do |format|
        format.html { redirect_to "/consultas/list/3" }
        format.json { render :json => @demandas }
    end
  end
  
end
