class AddWebsiteIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :website_id, :integer
  end
end
