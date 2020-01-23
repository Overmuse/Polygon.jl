function get_condition_mapping(tick_type)
    data = polygon_get("v1/meta/conditions/$tick_type")
end

function get_ticker_details(ticker)
    data = polygon_get("v1/meta/symbols/$ticker/company")
end
