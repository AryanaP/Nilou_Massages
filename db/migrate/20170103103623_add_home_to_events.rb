class AddHomeToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :home, :boolean
  end
end
