function get_condition_mapping(api, tick_type)
    data = polygon_get(api, "v1/meta/conditions/$tick_type")
end

function get_ticker_details(api, ticker)
    data = polygon_get(api, "v1/meta/symbols/$ticker/company")
end
