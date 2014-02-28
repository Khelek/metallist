module ApplicationHelper
  def pages_with_slug
    Page.where("pages.slug IS NOT NULL ")
  end
  
  def pages_top_navbar
    Page.where(place_in_top_navbar: true)
  end

  def pages_side_navtabs
    Page.where(place_in_side_navtabs: true)    
  end

  def page_by_slug(slug)
    Page.where(slug: slug).first
  end

end
