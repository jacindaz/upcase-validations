class GuestbookEntriesController < ApplicationController
  def create
    guestbook_entry = GuestbookEntry.create(guestbook_entry_params)

    if guestbook_entry.valid?
      redirect_to root_path, notice: "Thank you for your entry."
    end
  end

  private

  def guestbook_entry_params
    params.require(:guestbook_entry).permit(:body)
  end
end
