require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = FactoryBot.build(:category)
  end

  describe 'カテゴリー新規登録' do
    context '新規登録できるとき' do
      it 'nameが存在すれば登録できる' do
        expect(@category).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @category.name = ''
        @category.valid?
        expect(@category.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが一意性であること' do
        @category.save
        another_category = FactoryBot.build(:category)
        another_category.name = @category.name
        another_category.valid?
        expect(another_category.errors.full_messages).to include('Name has already been taken')
      end
    end
  end
end
