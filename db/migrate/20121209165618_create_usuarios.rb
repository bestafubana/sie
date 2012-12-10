class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.int :id
      t.string :login
      t.string :passwd

      t.timestamps
    end
  end
end
