function get_last_trade(api, ticker)
    data = polygon_get(api, "v1/last/stocks/$ticker")
    return data["last"]
end

function get_last_quote(api, ticker)
    data = polygon_get(api, "v1/last_quote/stocks/$ticker")
    return data["last"]
end

get_last(api, ticker) = get_last_trade(api, ticker)
