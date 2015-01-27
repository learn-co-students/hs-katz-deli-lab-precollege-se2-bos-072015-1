require "spec_helper"

describe 'Deli' do

  let(:katz) { Deli.new("Katz") }

  it 'is able to instantiate a new deli' do
    expect(katz).to be_a Deli
  end

  it 'should have a name' do
    katz.name = "Katz"
    expect(katz.name).to eq("Katz")
  end

  it 'should be initialized with an empty line' do
    expect(katz.line).to eq([])
  end

  describe "#line_status" do
    context "there is nobody in line" do
      it "should say the line is empty" do
        # This line checks the current standard output (your terminal screen)
        # to make sure the correct output has been puts'ed.
        expect($stdout).to receive(:puts).with("The line is currently empty.")
        katz.line_status
      end
    end

    context "there are people in line" do
      it "should display the current line" do
        katz.line=["Danny", "Steph", "Victoria"]
        expect($stdout).to receive(:puts).with("The line is currently: 1. Danny 2. Steph 3. Victoria")
        katz.line_status
      end
    end
  end

  describe "#take_a_number" do
    context "there is nobody in line" do
      it "should add a person to the line" do
        expect($stdout).to receive(:puts).with("Welcome, Ada. You are number 1 in line.")
        katz.take_a_number("Ada")
        expect(katz.line).to eq(["Ada"])
      end
    end

    context "there are already people in line" do
      it "should add a person to the end of the line" do
        katz.line=["Danny", "Steph", "Victoria"]
        expect($stdout).to receive(:puts).with("Welcome, Grace. You are number 4 in line.")
        katz.take_a_number("Grace")
        expect(katz.line).to eq(["Danny", "Steph", "Victoria", "Grace"])
      end
    end

    context "adding multiple people in a row" do
      it "should correctly build the line" do
        katz.take_a_number("Danny")
        katz.take_a_number("Steph")
        katz.take_a_number("Victoria")
        expect(katz_deli).to eq(["Danny", "Steph", "Victoria"])
      end
    end
  end

  describe "#now_serving" do
    context "there are no people in line" do
      it "should say that the line is empty" do
        expect($stdout).to receive(:puts).with("There is nobody waiting to be served!")
        katz.now_serving
      end
    end

    context "there are people in line" do
      it "should serve the first person in line and remove them from the queue" do
        katz.line=["Danny", "Steph", "Victoria"]
        expect($stdout).to receive(:puts).with("Currently serving Danny.")
        katz.now_serving
        expect(katz.line).to eq(["Steph", "Victoria"])
      end
    end
  end

end