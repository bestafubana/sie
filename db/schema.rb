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

ActiveRecord::Schema.define(:version => 20130725205000) do

  create_table "contatos", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "empresa"
    t.string   "departamento"
    t.string   "telefone"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "tipo_contato"
  end

  create_table "demandas", :force => true do |t|
    t.datetime "data"
    t.string   "uf"
    t.string   "solicitante"
    t.string   "departamento"
    t.integer  "carga_horaria"
    t.string   "caminho_foto"
    t.string   "caminho_pdf"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.datetime "resposta"
    t.string   "nome_consultado"
    t.string   "cpf_consultado"
    t.datetime "data_nasc_consultado"
    t.string   "nome_mae_consultado"
    t.string   "titulo_eleitor_consultado"
    t.string   "sexo_consultado"
    t.datetime "data_obito_consultado"
    t.string   "unidade_adm_consultado"
    t.string   "situacao_cadastral_consultado"
    t.string   "endereco_consultado"
    t.string   "observacoes_consultado"
    t.integer  "tipo_demanda"
    t.string   "avatar"
    t.string   "foto"
  end

  create_table "status_consulta", :force => true do |t|
    t.string   "nome"
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
