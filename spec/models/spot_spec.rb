require 'rails_helper'

RSpec.describe Spot, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @tag = FactoryBot.create(:tag)
    @spot = FactoryBot.build(:spot, user_id: @user.id, tag_ids: [@tag.id])
    sleep 0.1
  end

  describe '新規登録' do
    context '新規登録できる場合' do
      it 'name,address,latitude,longitude,tag_ids,user_idが存在すれば登録できる' do
        expect(@spot).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nameが空では登録できない' do
        @spot.name = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Name can't be blank")
      end
      it 'addressが空では登録できない' do
        @spot.address = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Address can't be blank")
      end
      it 'tag_idsが空では登録できない' do
        @spot.tag_ids = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Tag ids can't be blank")
      end
      it 'latitudeが空では登録できない' do
        @spot.latitude = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Address に正しい住所を入力してください。")
      end
      it 'longitudeが空では登録できない' do
        @spot.longitude = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Address に正しい住所を入力してください。")
      end
    end
  end
end
