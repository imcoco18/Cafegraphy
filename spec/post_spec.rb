require 'rails_helper'

RSpec.describe Post, type: :model do
	describe 'バリデーションのテスト' do

		context 'titleカラム' do
			it "タイトルがない場合、無効である" do
				post.title = ''
				expect(post.valid?).to eq false;
			end
		end
		context 'shop_nameカラム' do
			it "店名がない場合、無効である" do
				post.shop_name = ''
				expect(post.valid?).to eq false;
			end
		end
	end
end