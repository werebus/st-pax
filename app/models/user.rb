# frozen_string_literal: true

class User < ApplicationRecord
  has_many :log_entries, dependent: :restrict_with_error
  has_many :doctors_notes

  validates :name, :spire, presence: true
  validates :spire,
            format: { with: /\A\d{8}@umass.edu\z/,
                      message: 'must be 8 digits followed by @umass.edu' }

  scope :admins, -> { where admin: true }
  scope :dispatchers, -> { where.not admin: true }
  scope :active, -> { where active: true }

  def can_delete?(item)
    admin? || (item.is_a?(LogEntry) && item.user == self)
  end

  def dispatcher?
    !admin?
  end
end
