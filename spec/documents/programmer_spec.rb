require_relative "../spec_helper"

require_relative "../../documents/language.rb"
require_relative "../../documents/company.rb"
require __FILE__.gsub(/.spec/, '')

describe Programmer do

  subject { Programmer.create name: "Joe" }
  context "embeds languages" do
    let(:ruby) { Language.find_or_create_by name: "ruby" }

    before do
      subject.languages << ruby
    end

    it "includes Ruby" do
      expect(subject.languages).to include(ruby)
    end
  end

  context "references companies" do
    let(:raise_com) { Company.find_or_create_by name: "raise" }

    before do
      subject.companies << raise_com
      subject.companies.find_or_create_by name: "Acme"
    end

    it "includes Raise" do
      expect(subject.companies).to include(raise_com)
    end

    it "creates Acme" do
      acme = Company.find_by(name: "Acme", programmer_id: subject.id)
      expect(subject.companies).to include(acme) 
    end

    it "modify Acme -> Acme1" do
      Company.find_by(name: "Acme", programmer_id: subject.id).update_attributes(name: "Acme1")
      expect(subject.companies(true).map(&:name)).to include("Acme1")
    end
  end
end
