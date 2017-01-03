class AddResumeToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :resume, :string
  end
end

