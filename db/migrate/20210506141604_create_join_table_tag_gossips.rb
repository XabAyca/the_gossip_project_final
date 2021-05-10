class CreateJoinTableTagGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_tag_gossips do |t|

      t.timestamps
    end
    add_reference :join_table_tag_gossips, :tag, foreign_key: true
    add_reference :join_table_tag_gossips, :gossip, foreign_key: true
  end
end
