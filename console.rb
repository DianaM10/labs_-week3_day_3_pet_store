require_relative('./models/pet_store')
require_relative('./models/pet')

require('pry-byebug')


pet_store1 = PetStore.new( { 'name' => "Edinburgh", 'address' => "Princes Street", 'stock_type' => "Equine"})
pet_store1.save()

pet1 = Pet.new( { 'name' => "Apple Jack", 'type' => "Equine", 'pet_store_id' => pet_store1.id})
pet1.save()

binding.pry
nil
