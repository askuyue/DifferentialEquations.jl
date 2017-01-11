function default_algorithm{uType,tType,lType,isinplace,F,H}(prob::AbstractConstantLagDDEProblem{uType,tType,lType,isinplace,F,H};kwargs...)
  o = Dict{Symbol,Any}(kwargs)
  extra_kwargs = Any[]; alg=MethodOfSteps(Tsit5()) # Standard default
  uEltype = eltype(prob.u0)

  :alg_hints ∈ keys(o) ? alg_hints = o[:alg_hints] : alg_hints = Symbol[:nonstiff]

  # If adaptivity is not set and the tType is not a float, turn off adaptivity
  # Bad interaction with ForwardDiff
  #!(tType <: AbstractFloat) && (:adaptive ∉ keys(o)) && push!(extra_kwargs,:adaptive=>false)

  alg,extra_kwargs
end
