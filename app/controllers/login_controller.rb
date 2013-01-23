class LoginController < ApplicationController
  def index
	# render :action => 'login'
	@usuario = Usuario.new 
  end

  def authenticate
    @usuario = Usuario.new(params[:usuario])
    session[:usuario] = @usuario.authenticate
    redirect_to root_path
  end

  def registration
    @usuario = Usuario.new
  end

  def register
    @usuario = Usuario.new(params[:usuario])

    if @usuario.valid?
      @usuario.save
      flash[:message] = I18n.t('home.registration.success', :login => @usuario.login)
      redirect_to root_path
    else
      flash[:errors] = @usuario.errors.full_messages
      render :logout
    end
  end

  def logout
    session[:usuario] = nil
    redirect_to root_path
  end


  end
