require_relative "../spec_helper"

require_relative "../../documents/car.rb"

describe Car do

  it "is fast" do
    expect(subject).to_not be_fast
  end

  it "has 4 wheels" do
    expect(subject.wheels).to eq(4)
  end
end
