class ChangeColumnTypeOfProperty < ActiveRecord::Migration
  def change
    remove_column :events, :property
    add_column :events, :meta, :text
  end
end
