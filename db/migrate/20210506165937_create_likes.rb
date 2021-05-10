class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|

      t.timestamps
    end
    add_reference :likes, :user, foreing_key: true
    add_reference :likes, :gossip, foreing_key: true
    add_reference :likes, :comment, foreing_key: true
  end
end
