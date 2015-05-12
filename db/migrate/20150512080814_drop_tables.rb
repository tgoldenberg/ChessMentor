class DropTables < ActiveRecord::Migration
  def up
   drop_table :mentors
 end

 def down
   raise ActiveRecord::IrreversibleMigration
 end
end
