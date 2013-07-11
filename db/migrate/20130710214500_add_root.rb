class AddRoot < ActiveRecord::Migration
  def self.up
    Usuario.create{:login => "root", :passwd => "raquel"}
   end

  def self.down
    Usuario.delete_all
  end
end