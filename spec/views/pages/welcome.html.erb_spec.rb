require "rails_helper"

describe "pages/welcome.html.erb" do
  before { assign(:guestbook_entry, GuestbookEntry.new) }

  it "displays the bodies of the guestbook entries" do
    assign(:guestbook_entries, [
      double(GuestbookEntry, body: "food", created_at: Time.now),
      double(GuestbookEntry, body: "barqs", created_at: Time.now)
    ])

    render

    expect(rendered).to have_content("food")
    expect(rendered).to have_content("barqs")
  end

  it "displays the timestamps of the guestbook entries" do
    assign(:guestbook_entries, [
      double(GuestbookEntry, body: "hi", created_at: Time.parse("Nov 12 1955")),
      double(GuestbookEntry, body: "bye", created_at: Time.parse("Oct 25 1985"))
    ])

    render

    expect(rendered).to have_content("Nov 12 1955")
    expect(rendered).to have_content("Oct 25 1985")
  end

  it "displays the error messages of an invalid form submission" do
    assign(:guestbook_entries, [])
    assign(:guestbook_entry, GuestbookEntry.new(body: "").tap(&:valid?))

    render

    expect(rendered).to have_content("Body can't be blank")
  end
end
