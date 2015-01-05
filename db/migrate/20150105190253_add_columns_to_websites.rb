class AddColumnsToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :name, :string
    add_column :websites, :description, :string
    add_column :websites, :token, :string
    add_column :websites, :verified, :boolean
  end
end
