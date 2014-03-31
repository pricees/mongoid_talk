require_relative "../spec_helper"

require __FILE__.gsub(/.spec/, '')

describe Rapper do
  let(:odb) do
    Rapper.create do |rapper|
      rapper.name = "Russel Jones"
    end
  end

  context "has platinum records" do
    before { subject[:plat_recs] = 0 }

    it "increases platinum records" do
      expect { subject.inc(:plat_recs, 5) }.
        to change{ subject.read_attribute(:plat_recs) }.
        from(0).to(5)
    end
  end

  context "has aliases" do
    let(:aliases) do
      ["O.D.B.", "Ason Unique", "Osirus", "The Specialist", 
       "Dirt McGirt", "Big Baby Jesus"]
    end

    before do
      odb.write_attributes(aliases: aliases)
    end

    it "pushes new alias" do
      odb.push :aliases, "The Goat"

      expect(odb.aliases).to include("The Goat")
    end

    it "pops a few aliases" do
      expect { odb.aliases.pop(3) }.
        to change{ odb.aliases.count }.
        by(-3)
    end
  end
end

