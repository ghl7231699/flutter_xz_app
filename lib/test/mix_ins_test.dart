void main() => {test()};

abstract class Base {
  a() {
    print('Base.a())');
  }

  b() {
    print('Base.b()');
  }
}

mixin A1 on Base {
  a() {
    print('A1.a())');
    super.a();
  }

  b() {
    print('A1.b()');
    super.b();
  }
}

mixin A2 on Base {
  a() {
    print('A2.a()');
    super.a();
  }

  b() {
    print('A2.b()');
    super.b();
  }
}

class B extends Base with A1, A2 {}

test() {
  B b = B();
  b.a();
  b.b();
}
