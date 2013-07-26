class ChangeContatos < ActiveRecord::Migration
  def change
    change_table :contatos do |t|
      t.string :tipo_contato
    end
  end
  
end
