require_relative "../spec_helper"

require __FILE__.gsub(/.spec/, '')

describe Person do

  subject { Person.create name: "Joe", age: 65 }

  it "has a name" do
    expect(subject.name).to_not be_nil
  end
end
