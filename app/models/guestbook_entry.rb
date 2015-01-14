class GuestbookEntry < ActiveRecord::Base
  validates :body, presence: true, length: { maximum: 255 }
  validate :body_without_silliness


  private

  def body_without_silliness
    ['silly', 'silli'].each do |bad_word|
      if body.include?(bad_word)
        errors.add :body, 'contains a bad word'
        return true
      end
    end
  end

end
