class GuestbookEntry < ActiveRecord::Base
  validates :body, presence: true, length: { maximum: 255 }, exclusion: { in: %w(silly), message: 'contains a bad word' } 
end
