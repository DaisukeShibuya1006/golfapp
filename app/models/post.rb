class Post < ApplicationRecord
  # contentカラムに対して、文字数を制限するためのバリデーションを追加してください
  validates :content, {presence: true, length: {maximum: 140}}
  validates:user_id,{presence:true}

  def user
    return User.find_by(id: self.user_id)
  end
  paginates_per 10

  mount_uploader :image, ImageUploader
end
