require 'shot'

describe Shot do
  context "by default" do
    subject { Shot.new }

    it "is not a break" do
      expect(subject.break?).to be_falsey
    end

    it "potted no reds" do
      expect(subject.reds).to eq(0)
    end

    it "potted no yellows" do
      expect(subject.yellows).to eq(0)
    end

    it "is not a foul" do
      expect(subject.foul?).to be_falsey
    end
  end

  context "when reds potted" do
    subject { Shot.new(1) }

    it "has reds potted" do
      expect(subject.reds).to eq(1)
    end
  end

  context "when yellows potted" do
    subject { Shot.new(0, 1) }

    it "has reds potted" do
      expect(subject.yellows).to eq(1)
    end
  end

  context "when a break" do
    subject { Shot.new(0, 0, true) }

    it "is a break" do
      expect(subject.break?).to be_truthy
    end
  end

  context "when a foul" do
    subject { Shot.new(0, 0, false, true) }

    it "is a foul" do
      expect(subject.foul?).to be_truthy
    end
  end

  context "#dry?" do
    it "is true if no balls are potted" do
      expect(Shot.new.dry?).to be_truthy
      expect(Shot.new(0).dry?).to be_truthy
      expect(Shot.new(1).dry?).to be_falsey
      expect(Shot.new(0, 0).dry?).to be_truthy
      expect(Shot.new(0, 1).dry?).to be_falsey
    end
  end
end
