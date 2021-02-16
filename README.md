# 잡다한 스위프트 공부

앱 제작전 스위프트에 대해 알아야 할 부분들 공부해보고 커밋하는 곳

TIL 느낌으로 활용할 예정


# 디자인패턴

패턴? -> 어떤 일을 효율적으로 달성할 수 있도록 미리 만들어져 있는 형식

디자인패턴? -> 코딩을 잘짜기 위한 패턴, 개발에서 유지보수와 알아보기 쉽도록 구조를 만들어 놓은 패턴

## 목표

- 기술부채의 최소화

- 재사용 및 지속가능 한 코드 제작

위 두가지 목표 모두 코드를 구조화 시키기 위한 전략이다. (클린아키텍쳐 라고도 함)

## 앱 개발시 가장 많이 사용하는 디자인 패턴

- ### MVC(Model - View - Controller)

MVVM이 등장하기 이전에 가장 대중적으로 사용하던 패턴이며, 과거 애플에서 공식가이드로 제작해서 배포했음

**Model** : app내에서 사용하는 데이터 (Struct)

**View** : 화면에 보여지는 UI요소 (UIView)

**Controller** : View 와 Model 사이에서의 중계자 (UIViewController)

Controller가 하는 일이 굉장히 많아지기 때문에 Massive View Controller라는 오명을 가지게 됨



- ### MVVM(Model - View - ViewModel)

**Model** : app내에서 사용하는 데이터 (Struct)

**View** : 화면에 보여지는 UI요소, Controller도 포함된 형태 (UIView, UIViewController)

**ViewModel** : Model의 데이터를 View에서 사용할 수 있도록 정제해 주는 부분

Controller의 역할을 축소시키고, 각 역할간에 업무가 명확해지는 효과가 있음



## 리팩토링

- 중복 제거
- 단일 책임 갖기 (메소드, 오브젝트 단위의 단일 책임을 가지도록 구성) > 30, 400 rule

