void main() {
  // 비어 있는 리스트 생성
  List<int> numbers1 = []; // var numbers = <int>[];
  print(numbers1);

  // 초기값을 설정한 리스트 생성
  List<int> numbers2 = [10, 20, 30];
  print(numbers2);

  // 고정 길이 리스트 생성
  List<int> numbers3 = List.filled(
    5,
    0,
  ); // 길이(size) = 5(앞 사이즈), 초기값(value,뒤 길이) = 0
  print(numbers3); //[0,0,0,0,0]

  // 동적 리스트 생성
  List<int> numbers4 = List.generate(
    5,
    (index) => index * 10,
  ); // 길이(size) = 5, 각 요소 값 = (index) => index * 10 함수의 반환값
  print(numbers4); // [0, 10, 20, 30, 40]

  // Nullable 리스트
  List<int?> numbers5 = [
    1,
    null,
    3,
  ]; // 요소 안의 null값을 나오게 해야한다면 <int>안에 ?을 입력해서 null이 나올수 있다고 해야한다.
  print(numbers5);

  if (numbers5 != null && numbers5.isNotEmpty) {
    for (dynamic element in numbers5) {
      print(element ?? 0); // element가 null이 아니면 그냥 쓰고 null이면 0을 쓰겠다.
    }
  }

  // 리스트 조작하기
  List<int> list = [1, 2]; // 후행 쉼표 가능합니다.

  // 단일 요소 추가
  list.add(3); // 마지막 요소로 3을 추가합니다.

  // 다중 요소 추가
  list.addAll([4, 5]); // 마지막 요소들로 4, 5를 추가합니다.

  // 특정 위치에 요소 추가
  list.insert(0, 0); // insert(index, value) 인덱스 0 위치에 값 0을 추가합니다.

  print(list); // [0,1,2,3,4,5]

  // 특정 값을 가진 요소 삭제
  list.remove(3); // 값이 3인 요소를 삭제합니다.

  // 특정 인덱스의 요소 삭제
  list.removeAt(0); // 인덱스 0인 요소를 삭제합니다.

  print(list); // [1,2,4,5];

  // 리스트 비우기
  list.clear();

  print(list); // []

  list.addAll([1, 2, 3, 4]); // [1, 2, 3, 4]

  // 리스트 크기
  print(list.length);

  // 리스트 첫 요소
  print(list.first);

  // 리스트 마지막 요소
  print(list.last);
}

