# fbp/z-test.jl

using Test: @test

@test cuboid_im(:test)
@test disk_phantom_params(:test)
@test ellipse_im(:test)
@test ellipsoid_im(:test)
@test ellipse_sino(:test)
@test image_geom(:test)
@test rect_im(:test)
@test rect_sino(:test)
@test rotate2d(:test)
@test sino_geom_test()
