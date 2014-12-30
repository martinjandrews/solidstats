require 'match'

describe Match do
  let(:player1) { Player.new("Marty Andrews") }
  let(:player2) { Player.new("Jamie Stevens") }

  context "#new" do
    it "fails if no players are provided" do
      expect{ Match.new }.to raise_error(ArgumentError)
    end

    it "allows creation with players" do
      Match.new(player1, player2)
    end
  end

  context "#players" do
    subject { Match.new(player1, player2) }

    it "returns player1 supplied on creation" do
      expect(subject.player1).to eq(player1)
    end

    it "returns player2 supplied on creation" do
      expect(subject.player2).to eq(player2)
    end
  end

  context "#title" do
    subject { Match.new(player1, player2) }

    it "provides information about players" do
      expect(subject.title).to eq("Marty Andrews vs Jamie Stevens")
    end
  end

  context "playing shots" do
    subject { Match.new(player1, player2) }

    it "starts with a dry break" do
      subject.play_shot
      expect(subject.last_shot.break?).to be_truthy
      expect(subject.last_shot.dry?).to be_truthy
    end

    it "second shot is not a break" do
      subject.play_shot
      subject.play_shot
      expect(subject.last_shot.break?).to be_falsey
    end

    it "records shots" do
      subject.play_shot
      subject.play_shot
      expect(subject.shots.count).to eq(2)
    end
  end
end
