class AddRoot < ActiveRecord::Migration
  def self.up
    
    usuario = Usuario.new
    usuario.login = "root"
    usuario.passwd = "raquel"
    usuario.save
   end

  def self.down
    Usuario.delete_all
  end
end