class BookSequenceValidator < ActiveModel::Validator
    def validate(record)
        if record.in_series && record.seq_in_series <= 0
            record.errors.add(:base, "Sequence in series is required if the book is in one.")
        end
    end
end