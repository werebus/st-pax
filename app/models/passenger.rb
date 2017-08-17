class Passenger < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  scope :permanent, -> { where(permanent: true) }
  scope :temporary, -> { where(permanent: false) }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  has_one :doctors_note, dependent: :destroy
  accepts_nested_attributes_for :doctors_note

  # TODO: Make configurable by user
  MOBILITY_DEVICES = ['Boot', 'Crutches', 'Cane', 'Walker',
                      'Service Dog'].freeze

  def expiration_display
    if permanent?
      'None'
    elsif doctors_note.present? && doctors_note.expiration_date.present?
      doctors_note.expiration_date.strftime '%m/%d/%Y'
    else
      'No Note'
    end
  end

  def self.deactivate_expired_doc_note
    expired = active.joins(:doctors_note)
                    .where('doctors_notes.expiration_date < ?', grace_period)
    expired.each do |passenger|
      passenger.update_attributes active: false
    end
  end

end
