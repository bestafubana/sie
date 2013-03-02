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
      format.html { render "demandas/consultas" }
      format.json { render :json => @demandas }
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
      format.html # index.html.erb
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
        format.html { redirect_to @demanda, :notice => 'Demanda was successfully created.' }
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
        format.html { redirect_to @demanda, :notice => 'Demanda was successfully updated.' }
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
      format.html { redirect_to demandas_url }
      format.json { head :no_content }
    end
  end
end
