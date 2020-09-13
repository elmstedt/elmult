#include <R.h>
#include <Rinternals.h>
#include <stdlib.h>
#include <Rmath.h>
#include <R_ext/Rdynload.h>
#include <stdio.h>


void F77_NAME(em_f)(int n, int p, double *a, double *b, int nt);

extern SEXP c_em_f(SEXP a, SEXP b, SEXP n, SEXP p, SEXP nt){
  F77_CALL(em_f)(asInteger(n), asInteger(p), REAL(a), REAL(b), asInteger(nt));
  return(a);
}

static const R_CallMethodDef CallEntries[] = {
  {"c_em_f",   (DL_FUNC) &c_em_f,  5},
  {NULL,         NULL,               0}
};

void R_init_elmult (DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
