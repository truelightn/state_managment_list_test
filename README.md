# list_test

Flutter 프로젝트 - API 데이터 리스트, 페이지네이션, Pull-to-Refresh 구현

## 기능

- JSONPlaceholder API를 사용한 Post 리스트 표시
- 무한 스크롤 페이지네이션
- Pull-to-Refresh 기능
- Clean Architecture 구조
- 4가지 상태 관리 방식 비교:
  1. Riverpod Notifier (기본 방식)
  2. Riverpod Annotation (@riverpod)
  3. Riverpod Annotation + Hooks
  4. GetX
- Freezed를 사용한 불변 데이터 클래스

## 실행 방법

1. 패키지 설치:
```bash
flutter pub get
```

2. 코드 생성 (Freezed + Riverpod Annotation):
```bash
dart run build_runner build --delete-conflicting-outputs
```

3. 앱 실행:
```bash
flutter run
```

## 프로젝트 구조

```
lib/
├── entities/          # 도메인 엔티티
│   └── post.dart
├── repositories/      # 데이터 레포지토리
│   └── post_repository.dart
├── services/          # API 서비스
│   └── api_service.dart
├── controllers/       # 상태 관리 컨트롤러
│   ├── post_list_controller.dart              # Notifier 방식
│   ├── post_list_annotation_controller.dart  # Annotation 방식
│   ├── post_list_hooks_controller.dart       # Annotation + Hooks 방식
│   ├── post_list_getx_controller.dart         # GetX 방식
│   └── post_list_state.dart
├── screens/           # UI 화면
│   ├── home_screen.dart                       # 메인 홈 화면
│   ├── post_list_screen.dart                 # Notifier 화면
│   ├── post_list_annotation_screen.dart      # Annotation 화면
│   ├── post_list_hooks_screen.dart           # Hooks 화면
│   └── post_list_getx_screen.dart            # GetX 화면
├── widgets/           # 공통 위젯
│   └── post_item.dart
└── main.dart
```

## 사용된 API

- JSONPlaceholder: https://jsonplaceholder.typicode.com/posts

## 상태 관리 방식 비교

앱 실행 시 홈 화면에서 4가지 상태 관리 방식을 비교할 수 있습니다.
