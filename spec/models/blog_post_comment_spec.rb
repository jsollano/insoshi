require File.dirname(__FILE__) + '/../spec_helper'

describe BlogPostComment do
  include CustomModelMatchers
  
  before(:each) do
    @comment = BlogPostComment.new(:body => "Hey there", :post => posts(:blog),
                                   :commenter => people(:aaron))
    
  end
  
  it "should be valid" do
    @comment.should be_valid
  end
  
  it "should require a body" do
    comment = BlogPostComment.new
    comment.should_not be_valid
    comment.errors.on(:body).should_not be_empty
  end
  
  it "should have a maximum body length" do
    @comment.should have_maximum(:body, MAX_TEXT_LENGTH)
  end
end