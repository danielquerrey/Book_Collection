class AddNewAttrToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :price, :decimal
  end
end
