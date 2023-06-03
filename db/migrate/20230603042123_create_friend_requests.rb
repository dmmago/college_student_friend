class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.references :to_customer, null: false, foreign_key: { to_table: :customers }
      t.references :from_customer, null: false, foreign_key: { to_table: :customers }
      t.integer :status, null: false
      t.timestamps
    end
  end
end
