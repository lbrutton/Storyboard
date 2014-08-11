class SetDefault < ActiveRecord::Migration
  def change
  	change_column :sentence, :validated, :boolean, default: false
  end
end
