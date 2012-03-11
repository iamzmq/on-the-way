rainy(beijing).
rainy(shanghai).
cold(beijing).
cold(tianjin).

freeze(Where) :- rainy(Where), cold(Where).
