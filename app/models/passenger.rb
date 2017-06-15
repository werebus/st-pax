class Passenger < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  scope :permanent, -> { where(permanent: true) }
  scope :temporary, -> { where(permanent: false) }

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
