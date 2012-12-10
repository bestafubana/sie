class ConsultadosController < ApplicationController
  # GET /consultados
  # GET /consultados.json
  def index
    @consultados = Consultado.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @consultados }
    end
  end

  # GET /consultados/1
  # GET /consultados/1.json
  def show
    @consultado = Consultado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @consultado }
    end
  end

  # GET /consultados/new
  # GET /consultados/new.json
  def new
    @consultado = Consultado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @consultado }
    end
  end

  # GET /consultados/1/edit
  def edit
    @consultado = Consultado.find(params[:id])
  end

  # POST /consultados
  # POST /consultados.json
  def create
    @consultado = Consultado.new(params[:consultado])

    respond_to do |format|
      if @consultado.save
        format.html { redirect_to @consultado, :notice => 'Consultado was successfully created.' }
        format.json { render :json => @consultado, :status => :created, :location => @consultado }
      else
        format.html { render :action => "new" }
        format.json { render :json => @consultado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consultados/1
  # PUT /consultados/1.json
  def update
    @consultado = Consultado.find(params[:id])

    respond_to do |format|
      if @consultado.update_attributes(params[:consultado])
        format.html { redirect_to @consultado, :notice => 'Consultado was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @consultado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consultados/1
  # DELETE /consultados/1.json
  def destroy
    @consultado = Consultado.find(params[:id])
    @consultado.destroy

    respond_to do |format|
      format.html { redirect_to consultados_url }
      format.json { head :no_content }
    end
  end
end
