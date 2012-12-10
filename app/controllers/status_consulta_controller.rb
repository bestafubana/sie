class StatusConsultaController < ApplicationController
  # GET /status_consulta
  # GET /status_consulta.json
  def index
    @status_consulta = StatusConsultum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @status_consulta }
    end
  end

  # GET /status_consulta/1
  # GET /status_consulta/1.json
  def show
    @status_consultum = StatusConsultum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @status_consultum }
    end
  end

  # GET /status_consulta/new
  # GET /status_consulta/new.json
  def new
    @status_consultum = StatusConsultum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @status_consultum }
    end
  end

  # GET /status_consulta/1/edit
  def edit
    @status_consultum = StatusConsultum.find(params[:id])
  end

  # POST /status_consulta
  # POST /status_consulta.json
  def create
    @status_consultum = StatusConsultum.new(params[:status_consultum])

    respond_to do |format|
      if @status_consultum.save
        format.html { redirect_to @status_consultum, :notice => 'Status consultum was successfully created.' }
        format.json { render :json => @status_consultum, :status => :created, :location => @status_consultum }
      else
        format.html { render :action => "new" }
        format.json { render :json => @status_consultum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /status_consulta/1
  # PUT /status_consulta/1.json
  def update
    @status_consultum = StatusConsultum.find(params[:id])

    respond_to do |format|
      if @status_consultum.update_attributes(params[:status_consultum])
        format.html { redirect_to @status_consultum, :notice => 'Status consultum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @status_consultum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /status_consulta/1
  # DELETE /status_consulta/1.json
  def destroy
    @status_consultum = StatusConsultum.find(params[:id])
    @status_consultum.destroy

    respond_to do |format|
      format.html { redirect_to status_consulta_url }
      format.json { head :no_content }
    end
  end
end
