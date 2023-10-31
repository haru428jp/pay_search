require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @tag = FactoryBot.create(:tag)
    @spot = FactoryBot.create(:spot, user_id: @user.id, tag_ids: [@tag.id])
    @comment = FactoryBot.build(:comment, user_id: @user.id, spot_id: @spot.id)
  end

  describe 'コメント登録' do
    context 'コメント登録できる場合' do
      it 'commentが存在すれば登録できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント登録できない場合' do
      it 'commentが空では登録できない' do
        @comment.comment = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("コメントを入力してください")
      end
    end
  end
end
