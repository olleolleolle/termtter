# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe Termtter::Client, 'when the plugin truncate is loaded' do
  it 'should add command truncate' do
    Termtter::Client.should_receive(:register_hook).once
    Termtter::Client.plug 'truncate'
  end

  it 'should define truncate method' do
    Termtter::Client.plug 'truncate'

    truncate('1111').should == '1111'

    truncate(
      '11111111110000000000111111111100000000001111111111' +
      '11111111110000000000111111111100000000001111111111' +
      '1111111111000000000011111111110000000000'
      ).should == '11111111110000000000111111111100000000001111111111' +
      '11111111110000000000111111111100000000001111111111' +
      '1111111111000000000011111111110000000000';

    truncate(
      '11111111110000000000111111111100000000001111111111' +
      '11111111110000000000111111111100000000001111111111' +
      '11111111110000000000111111111100000000001'
      ).should == '11111111110000000000111111111100000000001111111111' +
      '11111111110000000000111111111100000000001111111111' +
      '1111111111000000000011111111110000000...'

    truncate('あああああ').should == 'あああああ'

    truncate(
      'ああああああああああいいいいいいいいいいああああああああああいいいいいいいいいいああああああああああ' +
      'ああああああああああいいいいいいいいいいああああああああああいいいいいいいいいいああああああああああ' +
      'ああああああああああいいいいいいいいいいああああああああああいいいいいいいいいい'
      ).should ==
      'ああああああああああいいいいいいいいいいああああああああああいいいいいいいいいいああああああああああ' +
      'ああああああああああいいいいいいいいいいああああああああああいいいいいいいいいいああああああああああ' +
      'ああああああああああいいいいいいいいいいああああああああああいいいいいいいいいい'

    truncate(
      'ああああああああああいいいいいいいいいいああああああああああいいいいいいいいいいああああああああああ' +
      'ああああああああああいいいいいいいいいいああああああああああいいいいいいいいいいああああああああああ' +
      'ああああああああああいいいいいいいいいいああああああああああいいいいいいいいいいあ'
      ).should ==
      'ああああああああああいいいいいいいいいいああああああああああいいいいいいいいいいああああああああああ' +
      'ああああああああああいいいいいいいいいいああああああああああいいいいいいいいいいああああああああああ' +
      'ああああああああああいいいいいいいいいいああああああああああいいいいいいい...'
  end
end