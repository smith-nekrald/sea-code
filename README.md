# Sea Cargo 

An important thing to mention is that costs are computed differently in the paper and in the implementation. While the paper assumes that complete transporation cost per container except hiring/off-hiring is computed in $c^R$ or $c^E$, this implementation assumes that the storage cost at cut-off should be counted separately. This cost has a form duration * amount * storage cost.

The allotment pricing structure in implementation also differs from the paper. Instead of working with price at booking and price at shipment, we consider allotment price $p$ and cancellation price $p_n$. The conversion is $p_b = p_n$ and $p_s = p - p_n$.
