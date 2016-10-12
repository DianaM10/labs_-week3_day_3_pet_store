require_relative('../db/sql_runner')

class PetStore

  attr_reader :id, :name, :adress, :stock_type,

  def initialize( options )
    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']
    @address = options['address']
    @stock_type = options['stock_type']
  end

  def save()
    sql ="INSERT INTO pet_store (name, address, stock_type) VALUES ('#{@name}', '#{@address}', '#{@stock_type}'') RETURNING *"
    pet_store = SqlRunner.run( sql ).first
    @id = pet_store['id']
  end

end