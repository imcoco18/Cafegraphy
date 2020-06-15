class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
	  #relationshipsテーブルは中間テーブルなので　t.referenceで作る必要がある。
	  #外部キーとしての設定をするためにオプションforeign_key: true
      t.references :user, foreign_key: true
	  #注意したいのがfollow_idの参照先のテーブルはusersテーブルにしてあげたいので、{to_table: :users}としてあげてます。
	  #foreign_key: trueにすると存在しないfollowsテーブルを参照してしまうから
      t.references :follow, foreign_key: { to_table: :users }

      t.timestamps

      #user_id と follow_id のペアで重複するものが保存されないようにするデータベースの設定
      t.index [:user_id, :follow_id], unique: true
      t.index :user_id
      t.index :follow_id
    end
  end
end
