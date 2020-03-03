function subscribe(
    api,
    data_types,
    tickers,
    out = Channel(Inf);
    should_run = Ref(true)
)
    HTTP.WebSockets.open(api.url) do io
         @info String(readavailable(io))
         params = Dict(:action => "auth", :params => api.key)
         write(io, JSON.json(params))
         @info String(readavailable(io))
         params2 = Dict(:action => "subscribe", :params => join([join(d .* "." .* tickers, ",") for d in data_types], ","))
         write(io, JSON.json(params2))
         @async while should_run[]
             push!(out, String(readavailable(io)))
         end
    end
    out
end
