class ChangeIntegerLimitInTasksRating < ActiveRecord::Migration[5.0]
	def change
     change_column :tasks, :rating, :integer, limit: 8
   	end 
end