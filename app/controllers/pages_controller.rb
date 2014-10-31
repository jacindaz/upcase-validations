class PagesController < ApplicationController
  def index
    @guestbook_entries = GuestbookEntry.all
    @guestbook_entry = GuestbookEntry.new
    render "welcome"
  end
end
