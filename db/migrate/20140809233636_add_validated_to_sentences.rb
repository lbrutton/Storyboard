class AddValidatedToSentences < ActiveRecord::Migration
  def change
  	add_column :sentences, :validated, :boolean
end
