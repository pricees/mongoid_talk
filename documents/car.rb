class Car
  include Mongoid::Document

  field :wheels, type: Integer, default: 4

  def fast?
    false
  end
end

