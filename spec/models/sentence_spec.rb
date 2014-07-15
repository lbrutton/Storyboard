require 'spec_helper'

describe Sentence do
  it {should respond_to(:content)}
  it {should respond_to(:user_id)}
  it {should respond_to(:user)}
  it {should respond_to(:story)}
  it {should respond_to(:story_id)}
end
