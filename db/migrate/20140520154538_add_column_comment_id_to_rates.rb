class AddColumnCommentIdToRates < ActiveRecord::Migration
  def change
    add_column :rates, :comment_id, :integer
  end
end
