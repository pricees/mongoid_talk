class Company
  include Mongoid::Document

  field :name, type: String

  belongs_to :programmer
end
