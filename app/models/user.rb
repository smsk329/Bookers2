class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        # UserモデルとBookモデルが、１：Ｎになるようにアソシエーションを記述。
         has_many :books, dependent: :destroy

        # ActiveStorageを使ってプロフィール画像をアップロードできるようにする。
         has_one_attached :profile_image

    validates :name, uniqueness: true, length: { minimum: 2, maximum: 20 }
    validates :introduction, length:{ maximum: 50 }

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize: "#{width}x#{height}").processed
  end

end