require_relative('../db/sql_runner')

class PetStore

  attr_reader :id, :name, :address, :stock_type

  def initialize( options )
    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']
    @address = options['address']
    @stock_type = options['stock_type']
  end

  def save()
    sql ="INSERT INTO pet_stores (name, address, stock_type) VALUES ('#{@name}', '#{@address}', '#{@stock_type}') RETURNING *"
    pet_store = SqlRunner.run( sql ).first
    @id = pet_store['id']
  end

  def all_pets()
    sql = "SELECT * FROM pets WHERE pet_store_id = #{@id}"
    all_pets = SqlRunner.run( sql )
    result = all_pets.map { |new_pet| Pet.new(new_pet) }
    return result
  end

  def self.find_store(store_id)
    sql = "SELECT * FROM pet_stores WHERE id = #{store_id}"
    store = SqlRunner.run( sql ).first
    result = PetStore.new(store)
  end

  # def self.delete_store(store_id)
  #   sql = "DELETE FROM pet_stores WHERE id = #{store_id}"
  #   store = SqlRunner.run( sql ).first
  #   binding.pry
  # end

#   def update_pet_store(new_details)
#     sql = "UPDATE pet_stores SET 
#         name = '#{@name}',
#         address = '#{@address}',
#         stock_type = '#{@stock_type}'
#         WHERE id = #{@id};"
#     update_pet_store = SqlRunner.run( sql )
#     result = PetStore.new(update_pet_store)
# binding.pry

#   end




end