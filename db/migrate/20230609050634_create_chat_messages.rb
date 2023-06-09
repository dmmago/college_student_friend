class CreateChatMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.references :customer, null: false, foregin_key: true
      t.text :content

      t.timestamps
    end
  end
end
