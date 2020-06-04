class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps

      # tag_name で検索するため index を貼り 一意制約を設定
      t.index :name, unique: true
    end
  end
end
