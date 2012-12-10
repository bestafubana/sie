require 'test_helper'

class StatusConsultaControllerTest < ActionController::TestCase
  setup do
    @status_consultum = status_consulta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:status_consulta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status_consultum" do
    assert_difference('StatusConsultum.count') do
      post :create, :status_consultum => { :id => @status_consultum.id, :nome => @status_consultum.nome }
    end

    assert_redirected_to status_consultum_path(assigns(:status_consultum))
  end

  test "should show status_consultum" do
    get :show, :id => @status_consultum
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @status_consultum
    assert_response :success
  end

  test "should update status_consultum" do
    put :update, :id => @status_consultum, :status_consultum => { :id => @status_consultum.id, :nome => @status_consultum.nome }
    assert_redirected_to status_consultum_path(assigns(:status_consultum))
  end

  test "should destroy status_consultum" do
    assert_difference('StatusConsultum.count', -1) do
      delete :destroy, :id => @status_consultum
    end

    assert_redirected_to status_consulta_path
  end
end
