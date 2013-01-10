# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121209170300) do

  create_table "consultados", :force => true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.datetime "data_nasc"
    t.string   "nome_mae"
    t.string   "titulo_eleitor"
    t.string   "sexo"
    t.datetime "data_obito"
    t.string   "unidade_adm"
    t.string   "situacao_cadastral"
    t.string   "endereco"
    t.string   "observacoes"
    t.string   "caminho_foto"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "contatos", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "empresa"
    t.string   "departamento"
    t.string   "telefone"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "demandas", :force => true do |t|
    t.datetime "data"
    t.string   "uf"
    t.string   "solicitante"
    t.string   "departamento"
    t.string   "resposta"
    t.integer  "carga_horaria"
    t.string   "caminho_foto"
    t.string   "caminho_pdf"
    t.integer  "consultado_id"
    t.integer  "contato_id"
    t.integer  "tipo_demanda_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "demandas", ["consultado_id"], :name => "index_demandas_on_consultado_id"
  add_index "demandas", ["contato_id"], :name => "index_demandas_on_contato_id"
  add_index "demandas", ["tipo_demanda_id"], :name => "index_demandas_on_tipo_demanda_id"

  create_table "status_consulta", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipo_demandas", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "login"
    t.string   "passwd"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end