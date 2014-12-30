require 'player'

describe Player do
  context "#new" do
    it "fails if no name is provided" do
      expect{ Player.new }.to raise_error(ArgumentError)
    end

    it "allows creation with a name" do
      Player.new("Marty")
    end
  end

  context "#name" do
    subject { Player.new("Marty") }

    it "returns name supplied on creation" do
      expect(subject.name).to eq("Marty")
    end
  end
end
