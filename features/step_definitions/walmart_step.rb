require 'capybara/cucumber'
require "test/unit"

Capybara.default_driver = :selenium

Given(/^Eu estou na pagina do "([^"]*)"$/) do |url|
  visit(url)
end

Given(/^Eu preencho "([^"]*)" com "([^"]*)"$/) do |campo, valor|
  fill_in(campo, :with => valor)
end

When(/^Eu clico "([^"]*)"$/) do |botao|
  click_button(botao)
end

Then(/^Eu devo visualizar a lista de produtos$/) do  
  assert page.has_css?('.result-items')
end

Given(/^Eu estou na pagina do resultado da busca e devo visualizar a lista de produtos$/) do
  assert page.has_css?('.result-items')
end

When(/^Eu clico no primeiro item da lista$/) do
 within first(".item-0") do
   find("a", match: :first).click
 end
end

Then(/^Eu devo visualizar a página do produto com o botão "([^"]*)" e clicar em "([^"]*)" quando visualizar o lightbox$/) do |botao_adicionar, botao_continuar|
  click_button(botao_adicionar)
  within "div.mfp-content" do
    click_button("Continuar")
  end if page.has_css?('div.mfp-content')
end

When(/^Eu clico no carrinho$/) do
  within ".cart" do
    find("a", match: :first).click
  end
end

Then(/^Eu visualizo a lista de itens$/) do
  assert page.has_css?('.my-cart-box')
end
