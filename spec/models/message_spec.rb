require 'spec_helper'

describe Message do
  it { should belong_to(:recipient).class_name('User').with_foreign_key("to_id") }
  it { should belong_to(:sender).class_name('User').with_foreign_key("from_id") }
end
