class Person
  include Mongoid::Document

  field :name, type: String

  # store_in :pet_owners  # NOTE: Change the collection name
end
