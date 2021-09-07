class Schedule < ApplicationRecord
    validates :title, presence: true
    validates :start_day, presence: true
    validates :end_day, presence: true
    validate :valid_eligiblity_range?

    def valid_eligiblity_range?
        if end_day.nil? || start_day.nil?
            errors.add(:end_day, "は今日以降の日付で選択してください")
        elsif !end_day.after?(start_day)
            errors.add(:end_day, "は今日以降の日付で選択してください")
        end
    end
end
