class Article < ApplicationRecord
    has_one_attached :image
    
    belongs_to :user
    
    has_many :comments, dependent: :destroy
    
    validates :title, presence: true, length: { minimum: 5 }
    validates :text, presence: true, length: { minimum: 10 }
    validates :image, presence: true
end
