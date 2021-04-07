class Book < ApplicationRecord
  
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(ways,keyword)
    if ways == "perfect_match"
      where(["title like? OR body like?", "#{keyword}", "#{keyword}"])
    elsif ways == "partial_match"
      where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
    elsif ways == "prefix_match"
      where(["title like? OR body like?", "#{keyword}%", "#{keyword}%"])
    else 
      where(["title like? OR body like?", "%#{keyword}", "%#{keyword}"])
    end
    
  end
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
