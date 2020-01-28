function get_tickers(;sort=nothing, type = nothing, market = nothing, search = nothing, active = nothing)
    params = Dict()
    if !isnothing(sort)
        merge!(params, Dict("sort" => sort))
    end
    if !isnothing(type)
        merge!(params, Dict("type" => type))
    end
    if !isnothing(market)
        merge!(params, Dict("market" => market))
    end
    if !isnothing(search)
        merge!(params, Dict("search" => search))
    end
    if !isnothing(active)
        merge!(params, Dict("active" => active))
    end
    tickers = Channel(Inf)
    data = polygon_get("v2/reference/tickers", params)
    push!(tickers, data["tickers"])
    num_calls = Int(round((data["count"]-50)/50, RoundUp))
    @showprogress for i in 1:num_calls
        page = data["page"] + 1
        data = polygon_get("v2/reference/tickers", merge!(params, Dict("page" => page)))
        push!(tickers, data["tickers"])
    end
    close(tickers)
    return [ticker for ticker in tickers]
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
