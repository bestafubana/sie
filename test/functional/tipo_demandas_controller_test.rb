require 'test_helper'

class TipoDemandasControllerTest < ActionController::TestCase
  setup do
    @tipo_demanda = tipo_demandas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_demandas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_demanda" do
    assert_difference('TipoDemanda.count') do
      post :create, :tipo_demanda => { :id => @tipo_demanda.id, :tipo => @tipo_demanda.tipo }
    end

    assert_redirected_to tipo_demanda_path(assigns(:tipo_demanda))
  end

  test "should show tipo_demanda" do
    get :show, :id => @tipo_demanda
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tipo_demanda
    assert_response :success
  end

  test "should update tipo_demanda" do
    put :update, :id => @tipo_demanda, :tipo_demanda => { :id => @tipo_demanda.id, :tipo => @tipo_demanda.tipo }
    assert_redirected_to tipo_demanda_path(assigns(:tipo_demanda))
  end

  test "should destroy tipo_demanda" do
    assert_difference('TipoDemanda.count', -1) do
      delete :destroy, :id => @tipo_demanda
    end

    assert_redirected_to tipo_demandas_path
  end
end
