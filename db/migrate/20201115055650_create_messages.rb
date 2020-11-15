class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :kind
      t.string :senderID
      t.text :body
      t.string :threadID
      t.string :messageID
      t.text :attachments
      t.text :mentions
      t.string :timestamp
      t.boolean :isGroup

      t.timestamps
    end
  end
end
