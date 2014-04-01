class Programmer
  include Mongoid::Document

  field :name, type: String

  embeds_many :languages

  has_many :companies

  # store_in :pet_owners  # NOTE: Change the collection name
end
