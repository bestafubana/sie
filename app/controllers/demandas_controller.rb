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
    @demandas = Demanda.where("tipo_demanda = ?", params[:tipo_demanda])

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
      format.html # show.html.erb
      format.json { render :json => @demanda }
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

  # POST /demandas
  # POST /demandas.json
  def create
    @demanda = Demanda.new(params[:demanda])

    respond_to do |format|
      if @demanda.save
        format.html { redirect_to @demanda, :notice => 'Demanda criada com sucesso.' }
        format.json { render :json => @demanda, :status => :created, :location => @demanda }
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
        format.html { redirect_to "/consultas/list/1", :notice => 'Demanda was successfully updated.' }
        format.json { head :no_content }
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
end
