class TrainRoute < ApplicationRecord
    belongs_to :user, required: false
    belongs_to :train

    def full?
        @total_user = 0
        User.all.each do |user|
            if user.train_routes.include?(self)
                @total_user += 1
            end 
        end

        if self.train.max_pax == @total_user
            return true 
        else
            return false
        end

    end

    
end
