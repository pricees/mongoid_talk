require_relative "../spec_helper"

require __FILE__.gsub(/.spec/, '')

describe Pet do

  it "has a default species" do
    expect(subject.species).to eq("dog")
  end

  context "new pet" do
    let(:pet) { Pet.create name: "Scruffy", species: "kitty cat" }

    it "has a name" do
      expect(pet.name).to_not be_nil
    end
  end
end

