require_relative "../spec_helper"

require_relative "../../documents/car.rb"
require_relative "../../documents/bmw.rb"

describe Bmw do

  before do
    subject.attributes = { wheels: 5 }
  end

  it "is a car" do
    expect(subject.is_a?Car).to be_true
  end

  it "is fast" do
    expect(subject).to be_fast
  end

  it "has 5 wheels" do
    expect(subject.wheels).to eq(5)
  end
end
