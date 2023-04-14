class Cat < ApplicationRecord
    CAT_COLORS = ["orange", "white", "black", "gray"]

    validates :name, presence: true 
    validates :color, presence: true, inclusion: {in: CAT_COLORS}
    validates :sex, presence: true, inclusion: {in: ["M", "F"]}
    validate :birth_date_cannot_be_in_the_future
    validates :birth_date, presence: true 

    def birth_date_cannot_be_in_the_future

        if birth_date > Date.today
          errors.add(:birth_date, "can't be in the future")
        end
    end

    def age
      date1 = Date.today
      date2 = birth_date
      "#{name} is #{date1.year - date2.year} year's old"
    end

end

# kitt = Cat.new(name: 'kitt', color: 'orange', birth_date: '2020/01/20', sex: 'F')