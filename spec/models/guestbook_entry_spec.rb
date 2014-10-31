require "rails_helper"

describe GuestbookEntry do
  it "is invalid when the body contains 'silly'" do
    entry = GuestbookEntry.new(body: "This site is silly!")

    expect(entry).not_to be_valid
    expect(entry.errors[:body].size).to eq(1)
    expect(entry.errors[:body]).to include("contains a bad word")
  end

  it "is invalid when the body is blank" do
    entry = GuestbookEntry.new(body: "")

    expect(entry).not_to be_valid
    expect(entry.errors[:body].size).to eq(1)
    expect(entry.errors[:body]).to include("can't be blank")
  end

  it "is invalid when the body contains more than 255 characters" do
    entry = GuestbookEntry.new(body: "x" * 256)

    expect(entry).not_to be_valid
    expect(entry.errors[:body].size).to eq(1)
    expect(entry.errors[:body]).
      to include("is too long (maximum is 255 characters)")
  end
end
