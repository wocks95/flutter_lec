void main() {
  // Map
  // 1. key-value
  // 2. key는 중복 불가능, value는 중복 가능
  // 3. key를 이용해서 value를 조회하는 방식

  // 비어 있는 Map 생성
  Map<String, dynamic> map1 = {}; // var map1 = Map<String, dynamic>()
  print(map1);

  // 초기값을 가진 Map 생성
  Map<String, String> map2 = {
    "KR": "South Korea",
    "US": "United States",
    "JP": "Japan", // 후행 쉼표 가능
  };

  print(map2);

  // Map 조작

  // key가 존재하는 경우 기존 value의 수정이 가능하다.
  map2["KR"] = "Korea";

  // key가 없는 경우 새로운 value의 추가
  map2["CA"] = "Canada";

  // key를 전달하는 방식의 삭제
  map2.remove("JP");

  print(map2);

  // 순회 1: for in 문
  for (String Key in map2.keys) {
    // Keys 속성 : Map의 Key만 반환
    print("${Key} : ${map2[Key]}");
  }

  // 순회 2 : forEach() 문
  map2.forEach((String Key, String value) {
    // String은 생략 가능하고 함수를 사용했지만 특이하게도 변수도 없고 화살표도 없다.
    print("$Key : $value");
  });
}
