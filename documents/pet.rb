class Pet
  include Mongoid::Document

  field :name, type: String
  field :species, type: String, default: "dog"
end
