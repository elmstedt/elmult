em <- function(a, b) {
  nthreads <- max(parallel::detectCores() - 1, 1)
  OpenMPController::omp_set_num_threads(nthreads)
  n <- nrow(a)
  p <- ncol(a)
  .Call(c_em_f, a, b, n, p, nthreads)
}
