class Philosopher < ApplicationRecord
    has_many :quotes, dependent: :destroy

    def full_name
        "#{phil_fname} #{phil_lname}"
    end
end
