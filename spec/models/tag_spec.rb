require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    @tag = FactoryBot.build(:tag)
  end

  describe 'タグ登録' do
    context 'タグ登録できる場合' do
      it 'nameが存在すれば登録できる' do
        expect(@tag).to be_valid
      end
    end

    context 'タグ登録できない場合' do
      it 'nameが空では登録できない' do
        @tag.name = ''
        @tag.valid?
        expect(@tag.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
