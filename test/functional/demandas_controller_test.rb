require 'test_helper'

class DemandasControllerTest < ActionController::TestCase
  setup do
    @demanda = demandas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:demandas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create demanda" do
    assert_difference('Demanda.count') do
      post :create, :demanda => { :caminho_foto => @demanda.caminho_foto, :caminho_pdf => @demanda.caminho_pdf, :carga_horaria => @demanda.carga_horaria, :data => @demanda.data, :departamento => @demanda.departamento, :id => @demanda.id, :resposta => @demanda.resposta, :solicitante => @demanda.solicitante, :uf => @demanda.uf }
    end

    assert_redirected_to demanda_path(assigns(:demanda))
  end

  test "should show demanda" do
    get :show, :id => @demanda
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @demanda
    assert_response :success
  end

  test "should update demanda" do
    put :update, :id => @demanda, :demanda => { :caminho_foto => @demanda.caminho_foto, :caminho_pdf => @demanda.caminho_pdf, :carga_horaria => @demanda.carga_horaria, :data => @demanda.data, :departamento => @demanda.departamento, :id => @demanda.id, :resposta => @demanda.resposta, :solicitante => @demanda.solicitante, :uf => @demanda.uf }
    assert_redirected_to demanda_path(assigns(:demanda))
  end

  test "should destroy demanda" do
    assert_difference('Demanda.count', -1) do
      delete :destroy, :id => @demanda
    end

    assert_redirected_to demandas_path
  end
end
