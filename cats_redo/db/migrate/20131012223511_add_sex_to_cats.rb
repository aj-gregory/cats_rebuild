class AddSexToCats < ActiveRecord::Migration
  def change
	 add_column :cats, :sex, :string
  end
end
