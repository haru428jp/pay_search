require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @spot = FactoryBot.create(:spot)
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
        @comment.name = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment can't be blank")
      end
    end
  end
end
