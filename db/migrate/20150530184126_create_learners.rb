class CreateLearners < ActiveRecord::Migration
  def change
    create_table :learners do |t|

      t.timestamps null: false
    end
  end
end
