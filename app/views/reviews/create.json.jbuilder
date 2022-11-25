if @review.persisted?
  # send the html of the review saved
  json.item render(partial: "restaurants/review", formats: :html, locals: { review: @review})
  # the new form
  json.form render(partial: "form", formats: :html, locals: { restaurant: @restaurant, review: Review.new})
else
  json.form render(partial: "form", formats: :html, locals: { restaurant: @restaurant, review: @review})
end
