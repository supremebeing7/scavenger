module Maps
  extend ActiveSupport::Concern

  def build_map_markers(places)
    @hash = Gmaps4rails.build_markers(places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow render_to_string(:partial => "/places/details", :locals => { :object => place})
      marker.json({name: place.name})
    end
  end
end
