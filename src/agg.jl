function get_previous_close(ticker; adjusted=true)
    data = polygon_get("v2/aggs/ticker/$ticker/prev", Dict{String, Any}("unadjusted" => !adjusted))
    return data["results"]
end

function get_historical_range(ticker, from, to, multiplier = 1, timespan = "day"; adjusted=true)
    data = polygon_get(
        "v2/aggs/ticker/$ticker/range/$multiplier/$timespan/$from/$to",
        Dict{String, Any}("unadjusted" => !adjusted)
    )
    return data["results"]
end

function get_grouped_daily(locale, market, date; adjusted=true)
    data = polygon_get(
        "v2/aggs/grouped/locale/$locale/market/$market/$date",
        Dict{String, Any}("unadjusted" => !adjusted)
    )
    return data["results"]
end
