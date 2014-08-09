class AddValidatedToSentences < ActiveRecord::Migration
  def change
  	add_column :sentences, :validated, :boolean, default: false
  end
end
