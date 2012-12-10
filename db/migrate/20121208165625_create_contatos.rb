class CreateContatos < ActiveRecord::Migration
  def change
    create_table :contatos do |t|
      t.int :id
      t.string :nome
      t.string :email
      t.string :empresa
      t.string :departamento
      t.string :telefone

      t.timestamps
    end
  end
end
