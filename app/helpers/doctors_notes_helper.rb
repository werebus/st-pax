# frozen_string_literal: true

module DoctorsNotesHelper
  def expiration_check(passenger)
    return 'inactive' unless passenger.active?
    return if passenger.permanent?
    note = passenger.doctors_note
    if note.present?
      if note.will_expire_within_warning_period?
        'will_expire_soon'
      elsif note.expired_within_grace_period?
        'expired_within_grace_period'
      elsif note.expired?
        'inactive'
      end
    else
      'no_note'
    end
  end
end
