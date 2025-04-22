# Sea Cargo 

An important thing to mention is that costs are computed differently in the paper and in the implementation. While the paper assumes that complete transporation cost per container except hiring/off-hiring is computed in $c^R$ or $c^E$, this implementation assumes that the storage cost at cut-off should be counted separately. This cost has a form duration * amount * storage cost.
