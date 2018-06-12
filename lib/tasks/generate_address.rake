namespace :level_revel do
  task :generate_address do
    addresses = 50.times.map do
      rnd = Random.new
      lat = rnd.rand(55.71818862974556..55.787311843139854)
      long = rnd.rand(37.501711344922434..37.73774573823298)

      res = JSON.parse HTTP.get("https://geocode-maps.yandex.ru/1.x/?geocode=#{long},#{lat}&kind=house&format=json").body

      first_member=res["response"]["GeoObjectCollection"]["featureMember"].first["GeoObject"];
      coord = first_member["Point"]["pos"].split
      {
        longitude: coord.first.to_f,
        latitude: coord.last.to_f,
        address: first_member["metaDataProperty"]["GeocoderMetaData"]["text"]
      }
    end

    open("db/seed_addresses.json", "wb") do |file|
      file.write(addresses.to_json)
    end
  end
end
