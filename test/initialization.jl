# test initilization functions

for T in (Float64, Float32)

    X = rand(T, 8, 12)

    # randinit

    W, H = NMF.randinit(X, 5)
    @test size(W) == (8, 5)
    @test size(H) == (5, 12)
    @test all(W .>= 0.0)
    @test all(H .>= 0.0)

    W, H = NMF.randinit(X, 5; zeroh=true)
    @test size(W) == (8, 5)
    @test size(H) == (5, 12)
    @test all(W .>= 0.0)
    @test all(H .== 0.0)

    W, H = NMF.randinit(X, 5; normalize=true)
    @test size(W) == (8, 5)
    @test size(H) == (5, 12)
    @test all(W .>= 0.0)
    @test all(H .>= 0.0)
    @test vec(sum(W, dims=1)) ≈ ones(5)

    ## nndsvd

    Random.seed!(5678)
    W, H = NMF.nndsvd(X, 5)
    @test size(W) == (8, 5)
    @test size(H) == (5, 12)
    @test all(W .>= 0.0)
    @test all(H .>= 0.0)

    Random.seed!(5678)
    W2, H2 = NMF.nndsvd(X, 5; zeroh=true)
    @test size(W) == (8, 5)
    @test size(H) == (5, 12)
    @test all(W2 .== W)
    @test all(H2 .== 0.0)

    W, H = NMF.nndsvd(X, 5; variant=:ar)
    @test all(W .> 0.0)
    # NMF.printf_mat(W)
end