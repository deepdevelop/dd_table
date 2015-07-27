require 'spec_helper'

describe FPTable do
  let(:users) { create_list(:user, 10) }

  it 'has a version number' do
    expect(FPTable::VERSION).not_to be nil
  end

  it 'create a builder' do
    builder = FPTable::TableBuilder.new(User, users)

    expect(builder).to be_a(FPTable::TableBuilder)
  end
end
