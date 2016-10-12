require_relative('../db/sql_runner')

class Pet

  attr_reader :id, :name, :type, :pet_store_id

  def initialize( options )
    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']
    @type = options['type']
    @pet_store_id = options['pet_store_id'].to_i
  end

  def save()
    sql = "INSERT INTO pets (name, type, pet_store_id) VALUES ('#{@name}', '#{@type}', #{@pet_store_id}) RETURNING *"
    pet = SqlRunner.run( sql ).first
    @id = pet['id']
  end

  def show_store
    sql = "SELECT * FROM pet_stores WHERE id = #{@pet_store_id}"
    show_store = SqlRunner.run( sql )
    result = show_store.map { |shop| PetStore.new(shop) }
    return result
  end

  def self.find_pet(pet_id)
    sql = "SELECT * FROM pets WHERE id = #{pet_id}"
    pet = SqlRunner.run( sql ).first
    result = Pet.new(pet)
  end

  def self.delete_pet(pet_id)
    sql = "DELETE FROM pets WHERE id = #{pet_id}"
    pet = SqlRunner.run( sql )
  end

    def self.update_pet(new_details, pet_id)
      sql = "UPDATE pets SET 
          name = '#{@name}',
          type = '#{@type}',
          pet_store_id = '#{@pet_store_id}',
          WHERE id = #{pet_id};"
      update_pet = SqlRunner.run( sql )
      binding.pry
      result = Pet.new(update_pet)
      binding.pry
    end


end