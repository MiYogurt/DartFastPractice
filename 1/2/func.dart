var myFunc = (num params) {
  return params;
};

typedef MyFuncType = num Function(num params);
MyFuncType myFunc2 = (num params) => params;

num myFunc3(num params) {
  return params;
}

num myFunc4(num params) => params;

num myFunc5(num params, {num a = 10, num b = 10}) {/* 空函数 */}
num myFunc6(num params , [num op1 = 20, num op2 = 30]) {/* 空函数 */}

main(List<String> args) {
  // myFunc5(1, a: 2);
  // myFunc6(2, 1);
  // myFunc6(2, 1, 1);
  [1,2,3].map(print).toList();

}
