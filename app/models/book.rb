class Book < ApplicationRecord
  has_one_attached :image
  
  # UserモデルとBookモデルが、１：Ｎになるようにアソシエーションを記述。
  belongs_to :user
end
