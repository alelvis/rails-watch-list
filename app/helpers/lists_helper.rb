module ListsHelper
  def to_stars(rating)
    string = ""
    int = rating.to_i
    frac = (rating - int) >= 0.5 ? 1 : 0
    int.times { string += tag.i(class: 'fa-solid fa-star') }
    frac.times { string += tag.i(class: 'fa-regular fa-star-half-stroke') }
    (5 - int - frac).times { string += tag.i(class: 'fa-regular fa-star') }
    string.html_safe
  end
end
