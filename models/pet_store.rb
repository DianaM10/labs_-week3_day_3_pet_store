require_relative('../db/sql_runner')

class PetStore

  attr_reader :id, :name, :adress, :stock_type,

  def initialize( options )
    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']
    @address = options['address']
    @stock_type = options['stock_type']
  end


end