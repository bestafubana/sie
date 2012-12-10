class TipoDemandasController < ApplicationController
  # GET /tipo_demandas
  # GET /tipo_demandas.json
  def index
    @tipo_demandas = TipoDemanda.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tipo_demandas }
    end
  end

  # GET /tipo_demandas/1
  # GET /tipo_demandas/1.json
  def show
    @tipo_demanda = TipoDemanda.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tipo_demanda }
    end
  end

  # GET /tipo_demandas/new
  # GET /tipo_demandas/new.json
  def new
    @tipo_demanda = TipoDemanda.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @tipo_demanda }
    end
  end

  # GET /tipo_demandas/1/edit
  def edit
    @tipo_demanda = TipoDemanda.find(params[:id])
  end

  # POST /tipo_demandas
  # POST /tipo_demandas.json
  def create
    @tipo_demanda = TipoDemanda.new(params[:tipo_demanda])

    respond_to do |format|
      if @tipo_demanda.save
        format.html { redirect_to @tipo_demanda, :notice => 'Tipo demanda was successfully created.' }
        format.json { render :json => @tipo_demanda, :status => :created, :location => @tipo_demanda }
      else
        format.html { render :action => "new" }
        format.json { render :json => @tipo_demanda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_demandas/1
  # PUT /tipo_demandas/1.json
  def update
    @tipo_demanda = TipoDemanda.find(params[:id])

    respond_to do |format|
      if @tipo_demanda.update_attributes(params[:tipo_demanda])
        format.html { redirect_to @tipo_demanda, :notice => 'Tipo demanda was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @tipo_demanda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_demandas/1
  # DELETE /tipo_demandas/1.json
  def destroy
    @tipo_demanda = TipoDemanda.find(params[:id])
    @tipo_demanda.destroy

    respond_to do |format|
      format.html { redirect_to tipo_demandas_url }
      format.json { head :no_content }
    end
  end
end
