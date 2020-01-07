module CommentFeaturesHelper 
  def create_comment(body, prefix, id)
    visit "/#{prefix}/#{id}"
    fill_in 'Comment', with: body 
    click_on 'Save comment' 
  end 
end 
