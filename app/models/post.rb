class Post < ApplicationRecord
    belongs_to :user
    validates :user_id, {presence: true}
    mount_uploader :image, ImageUploader
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    before_save :check_post_count

  private

  def check_post_count
    if Post.where(user_id: self.user_id).count >= 3
      # 3回目の投稿の場合にアクションを実行
      # ここに実行したいアクションを記述
      # 例: self.do_something
    end
  end
end
