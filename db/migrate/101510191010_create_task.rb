require_relative '../../config/application'

# this is where you should use an ActiveRecord migration to 

class CreateTask < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :tasks do |t|
      t.string :action
      t.string :status
      t.timestamps null: false
  	end
  end
end
