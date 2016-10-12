require_relative('../db/sql_runner')

class Pet

  attr_reader :id, :name, :type, :pet_store_id

  def initialize( options )
    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']
    @type = options['type']
    @pet_store_id = options['pet_store_id'].to_i
  end


end