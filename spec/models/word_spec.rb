require 'rails_helper'

RSpec.describe Word, type: :model do
  before do
    @word = FactoryBot.build(:word)
  end

  describe 'メッセージ投稿' do
    context 'メッセージが投稿できる場合' do
      it 'contentとimageが存在していれば保存できる' do
        expect(@word).to be_valid
      end
      it 'contentが空でも保存できる' do
        @word.content = ''
        expect(@word).to be_valid
      end
      it 'imageが空でも保存できる' do
        @word.image = nil
        expect(@word).to be_valid
      end
    end
    
    context 'メッセージが投稿できない場合' do
      it 'contentとimageが空では保存できない' do
        @word.content = ''
        @word.image = nil
        @word.valid?
        expect(@word.errors.full_messages).to include("Content can't be blank")
      end
      it 'roomが紐付いていないと保存できない' do
        @word.room = nil
        @word.valid?
        expect(@word.errors.full_messages).to include('Room must exist')
      end
      it 'userが紐付いていないと保存できない' do
        @word.user = nil
        @word.valid?
        expect(@word.errors.full_messages).to include('User must exist')
      end
    end
  end
end
