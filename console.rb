require_relative('./models/pet_store')
require_relative('./models/pet')

require('pry-byebug')


pet_store1 = PetStore.new( { 'name' => "Edinburgh", 'address' => "Princes Street", 'stock_type' => "Equine"} )
pet_store1.save()

pet1 = Pet.new( { 'name' => "Apple Jack", 'type' => "Equine", 'pet_store_id' => pet_store1.id} )
pet1.save()

pet2 = Pet.new( { 'name' => "Rainbow Dash", 'type' => "Equine", 'pet_store_id' => pet_store1.id} )
pet2.save()

pet_store1.all_pets()
pet2.show_store()

PetStore.find_store(1)

# pet_store1.update_pet_store( { 'name' => "Edinburgh", 'address' => "Lothian Road", 'stock_type' => "Equine"} )
Pet.find_pet(2)

Pet.delete_pet(1)

# PetStore.delete_store(1)
Pet.update_pet( { 'name' => "Luna", 'type' => "Equine", 'pet_store_id' => pet_store1.id}, 2)

binding.pry
nil
