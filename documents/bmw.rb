class Bmw < Car
  include Mongoid::Document

  def fast?
    true
  end
end
