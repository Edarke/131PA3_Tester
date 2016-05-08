void main(){
  int  i = 5 ? 2 : 1;  // TestNotBoolean
  bool b = x ? 2 : 1;  // x undeclared & TestNotBoolean & invalid assign

  int  j = b ? 2 : 1;   // valid
  bool c = b ? 2 : 1;   // invalid assign
  
  int f = b ? y : 1.0; // y undeclared, invalid assign
  int g = b ? 1.0 : z; // z undeclared, invalid assign 
}

