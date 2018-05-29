require 'rails_helper'

RSpec.feature "Visitor navigates to home page and adds to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can add to cart" do
    # ACT
    visit root_path

    save_screenshot
    expect(page).to have_content 'My Cart (0)'
    first('.product').click_link('Add')
    #click_link('Add', match: :first)
    # DEBUG
    save_screenshot
    # VERIFY
    expect(page).to have_content 'My Cart (1)'
  end
end
