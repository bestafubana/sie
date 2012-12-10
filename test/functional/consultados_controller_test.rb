require 'test_helper'

class ConsultadosControllerTest < ActionController::TestCase
  setup do
    @consultado = consultados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consultados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consultado" do
    assert_difference('Consultado.count') do
      post :create, :consultado => { :caminho_foto => @consultado.caminho_foto, :cpf => @consultado.cpf, :data_nasc => @consultado.data_nasc, :data_obito => @consultado.data_obito, :endereco => @consultado.endereco, :id => @consultado.id, :nome => @consultado.nome, :nome_mae => @consultado.nome_mae, :observacoes => @consultado.observacoes, :sexo => @consultado.sexo, :situacao_cadastral => @consultado.situacao_cadastral, :titulo_eleitor => @consultado.titulo_eleitor, :unidade_adm => @consultado.unidade_adm }
    end

    assert_redirected_to consultado_path(assigns(:consultado))
  end

  test "should show consultado" do
    get :show, :id => @consultado
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @consultado
    assert_response :success
  end

  test "should update consultado" do
    put :update, :id => @consultado, :consultado => { :caminho_foto => @consultado.caminho_foto, :cpf => @consultado.cpf, :data_nasc => @consultado.data_nasc, :data_obito => @consultado.data_obito, :endereco => @consultado.endereco, :id => @consultado.id, :nome => @consultado.nome, :nome_mae => @consultado.nome_mae, :observacoes => @consultado.observacoes, :sexo => @consultado.sexo, :situacao_cadastral => @consultado.situacao_cadastral, :titulo_eleitor => @consultado.titulo_eleitor, :unidade_adm => @consultado.unidade_adm }
    assert_redirected_to consultado_path(assigns(:consultado))
  end

  test "should destroy consultado" do
    assert_difference('Consultado.count', -1) do
      delete :destroy, :id => @consultado
    end

    assert_redirected_to consultados_path
  end
end
