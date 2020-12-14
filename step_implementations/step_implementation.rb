# frozen_string_literal: true

require 'test/unit'
include Test::Unit::Assertions

@vowels = nil

step 'Vowels in English language are <vowels>.' do |vowels|
  @vowels = vowels.scan(/./)
end

step 'The word <word> has <count> vowels.' do |word, expected_count|
  assert_equal(expected_count.to_i, count_vowels(word))
end

step 'Almost all words have vowels <table>' do |words_table|
  words_table.rows.each do |row|
    word = row['Word']
    expected_count = row['Vowel Count'].to_i
    actual_count = count_vowels(word)
    assert_equal(expected_count, actual_count)
  end
end

def count_vowels(string)
  string.count(@vowels.to_s)
end

step 'Googleで「トレタ」と検索する' do
  Gauge.write_message 'Googleへ遷移'
  visit('https://www.google.com/?hl=ja')
  find('input[name="q"]').set('トレタ')
  find('input[name="btnK"]').click()
  Gauge.capture
  expect(page).to have_content('株式会社トレタ（Toreta,Inc.）')
end

step 'Googleで「<keyword>」と検索する' do |keyword|
  Gauge.write_message 'Googleへ遷移'
  visit('https://www.google.com/?hl=ja')
  find('input[name="q"]').set(keyword)
  find('input[name="btnK"]').click()
end

step '検索結果に<result>が含まれていることを確認する' do |result|
  Gauge.capture
  expect(page).to have_content(result)
end
