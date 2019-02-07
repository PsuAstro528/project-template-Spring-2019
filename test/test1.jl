using Test

@testset "Testing solution to Exercise 1" begin


@testset "Testing linear algebra results" begin
   tol = 1e-4
   @test maximum(abs.((wavelength_model_centered_v1(x_obs,result_linalg) .- wavelength_model_centered_v1(x_obs,poly_coeff_true))./wavelength_model_centered_v1(x_obs,poly_coeff_true) )) <= tol

end;

@testset "Testing LsqFit results" begin
   tol = 1e-8
   @test maximum(abs.((wavelength_model_centered_v1(x_obs,result_linalg) .- wavelength_model_centered_v1(x_obs,result_lsqfit.param))./wavelength_model_centered_v1(x_obs,result_linalg) )) <= tol

   @test maximum(abs.((wavelength_model_centered_v2(x_obs,result_linalg) .- wavelength_model_centered_v2(x_obs,result_lsqfit_v2.param))./wavelength_model_centered_v2(x_obs,result_linalg) )) <= tol

   @test maximum(abs.((wavelength_model_centered_v2(x_obs,result_linalg) .- wavelength_model_centered_v2(x_obs,result_lsqfit_with_jacobian.param))./wavelength_model_centered_v2(x_obs,result_linalg) )) <= tol

end;

@testset "Testing Optim results" begin
   tol = 1e-8
   @test maximum(abs.((wavelength_model_centered_v2(x_obs,result_linalg) .- wavelength_model_centered_v2(x_obs,result_optim_neldermead.minimizer))./wavelength_model_centered_v2(x_obs,result_linalg) ))  <= tol
   @test maximum(abs.((wavelength_model_centered_v2(x_obs,result_linalg) .- wavelength_model_centered_v2(x_obs,result_optim_conjgrad.minimizer))./wavelength_model_centered_v2(x_obs,result_linalg) ))  <= tol
   @test maximum(abs.((wavelength_model_centered_v2(x_obs,result_linalg) .- wavelength_model_centered_v2(x_obs,result_optim_conjgrad_autograd.minimizer))./wavelength_model_centered_v2(x_obs,result_linalg) ))  <= tol
   @test maximum(abs.((wavelength_model_centered_v2(x_obs,result_linalg) .- wavelength_model_centered_v2(x_obs,result_optim_bfgs.minimizer))./wavelength_model_centered_v2(x_obs,result_linalg) ))  <= tol
   @test maximum(abs.((wavelength_model_centered_v2(x_obs,result_linalg) .- wavelength_model_centered_v2(x_obs,result_optim_bfgs_autodiff.minimizer))./wavelength_model_centered_v2(x_obs,result_linalg) ))  <= tol

end;

end; # Exercise 1

