using InteractiveUtils

struct Parameter
  p::Float64
  b::Float64
  r::Float64
end

function lorenz(a, p)
  return [
    p.p * (a[2] - a[1]),
    a[1]*(p.r - a[3]) - a[2],
    a[1]*a[2] - p.b * a[3]
  ]
end

function main()
  x0 = [1.0, 0, 0]
  p0 = Parameter(10, 28, 8/3)
  dt = 0.001
  for t in 0:1000
    x0 += dt * lorenz(x0, p0)
    println(x0)
  end
end

code_llvm(main, ())
