// Model
// 데이터를 정의하고, 데이터 소스와 상호작용(데이터베이스, API 호출 등)을 수행합니다.

class CounterModel {

  // 데이터 정의 (필드 선언)
  int _count = 0; // 밑줄(_)로 시작하면 private 멤버

  // getter
  int get count => _count; // 외부에서는 count 이름으로 _count 값을 확인

  // method
  void increment() {
    ++_count;
  }
  void decrement() {
    --_count;
  }
  void reset() {
    _count = 0;
  }

}