class Post < ApplicationRecord
  belongs_to :user
  validates :body,presence:true,length:{maximum:200}
  has_many :post_comments, dependent: :destroy
  has_one_attached :image
end
