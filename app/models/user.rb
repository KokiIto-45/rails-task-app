class User < ApplicationRecord

  after_create :add_default_list

  has_many :lists, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  private

  def add_default_list
    List.create(title: 'デフォルト', user_id: self.id)
  end

end
