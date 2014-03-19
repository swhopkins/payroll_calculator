%module libpayroll
%{
  #include "libpayroll.h"
%}

extern double calculate_sui_tax(const double amount, const double rate);

%typemap(in, numinputs=0) (double *tax, double *rate) {
  $1 = (double *)malloc(1 * sizeof(double));
  $2 = (double *)malloc(1 * sizeof(double));
};

%typemap(argout) (double *tax, double *rate) {
  if(result == 0) {
    $result = rb_hash_new();
    rb_hash_aset($result, rb_str_new2("tax"), rb_float_new(*$1));
    rb_hash_aset($result, rb_str_new2("rate"), rb_float_new(*$2));
  } else {
    $result = Qfalse;
  }
}

%typemap(freearg) (double *tax, double *rate) {
  free($1);
  free($2);
}

int calculate_income_tax(const double amount, double *tax, double *rate);