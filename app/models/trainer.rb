class Trainer < ActiveRecord::Base
	has_many :tokimons

	def incrementLevel
		if self.tokimons.length % 3 == 0
          self.level += 1;
          self.save
        end
    end

    def decrementLevel
		if self.tokimons.length % 3 == 0
          self.level -= 1;
          self.save
        end    	
    end

    def decrementLevelAfterUpdate
    	if (self.tokimons.length+1) % 3 == 0
          self.level -= 1;
          self.save
        end
    end


end
