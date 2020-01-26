function get_tickers(;sort=nothing, type = nothing, market = nothing, search = nothing, active = nothing)
    params = Dict()
    if !isnothing(sort)
        merge!(params, Dict("sort" => sort))
    end
    if !isnothing(sort)
        merge!(params, Dict("type" => type))
    end
    if !isnothing(sort)
        merge!(params, Dict("market" => market))
    end
    if !isnothing(sort)
        merge!(params, Dict("search" => search))
    end
    if !isnothing(sort)
        merge!(params, Dict("active" => active))
    end
    tickers = []
    data = polygon_get("v2/reference/tickers", params)
    append!(tickers, data["tickers"])
    while length(tickers) < data["count"]
        page = data["page"] + 1
        data = polygon_get("v2/reference/tickers", merge!(params, Dict("page" => page)))
        append!(tickers, data["tickers"])
    end
    return tickers
end

function get_ticker_types()
    data = polygon_get("v2/reference/types")
    return data["results"]
end

function get_markets()
    data = polygon_get("v2/reference/markets")
    return data["results"]
end

function get_locales()
    data = polygon_get("v2/reference/locales")
    return data["results"]
end

function get_splits(ticker)
    data = polygon_get("v2/reference/splits/$ticker")
    return data["results"]
end

function get_dividends(ticker)
    data = polygon_get("v2/reference/dividends/$ticker")
    return data["results"]
end
