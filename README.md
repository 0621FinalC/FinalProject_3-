# FinalProject_team3
- 프로젝트가 있는 브랜치 : 머지_전체

## 0081oo : 혼자서 프로젝트 개선중! 
### 1. get방식으로 데이터 전송시 [, ] 인코딩 문제
  - 원인 : 보안상 이유로 Tomcat 이 URL 에 특수문자가 들어가는 경우를 잡는다. 
  - 해결 : 세가지 방법 존재 (1. encodeURIComponent() 함수 사용, 2. POST 방식 사용, 3. 톰캣 server.xml 수정)
  - 문제사항 : 일단 톰캣 conf의 server.xml 을 수정했는데 적용이 안된다. 
  - <img width="485" alt="스크린샷 2021-08-02 오후 5 16 06" src="https://user-images.githubusercontent.com/52397967/127827661-805021c5-c76f-45a4-8a7d-c81176600413.png">
  - !!! 해결완료 !!! 
  - <img width="743" alt="스크린샷 2021-08-03 오전 10 50 50" src="https://user-images.githubusercontent.com/52397967/127946063-6d17adb6-930a-4396-a661-22317ed52415.png">
  - 파라미터로 보내는 keyword 인코딩함수로 인코딩 해줌



## 프로젝트 주제
<img width="1024" alt="스크린샷 2021-06-23 오후 3 18 25" src="https://user-images.githubusercontent.com/86212850/123045776-45d76a80-d436-11eb-944d-ed84c696347f.png">


## 기능
![0003](https://user-images.githubusercontent.com/86212850/125954370-983b9e79-d933-45e4-b6ee-046b6368a8a2.jpg)


## 사용기술 및 개발환경
<img width="1093" alt="스크린샷 2021-07-19 오전 10 34 50" src="https://user-images.githubusercontent.com/86212850/126090461-329c55ce-c5f4-46eb-b37c-32bae33d8d25.png">


## 역할 분담
![0004](https://user-images.githubusercontent.com/86212850/125954372-1fa08c46-9670-4696-9d3e-20a3426a03b3.jpg)


## DB구조 (개발하면서 필요에 따라 수정)
![0009](https://user-images.githubusercontent.com/86212850/125954988-02f0c0d4-69d2-4ed9-9e04-1da59ae20a6d.jpg)


## 웹페이지 흐름도
![0008](https://user-images.githubusercontent.com/86212850/125954380-83572ca4-380b-4b67-a910-fadc059d8a8e.jpg)


## 개발 일정 계획
![0014](https://user-images.githubusercontent.com/86212850/125954381-8efa4d2b-c936-4b07-bed4-c7a1ab98848f.jpg)


## 동작 스크린샷
![0015](https://user-images.githubusercontent.com/86212850/125954384-564535b9-e0d4-457b-b4e6-5878aa83c11e.jpg)
![0016](https://user-images.githubusercontent.com/86212850/125954386-571a8a4b-0693-4003-b81d-40a108cda96b.jpg)
![0017](https://user-images.githubusercontent.com/86212850/125954389-e02e3d5a-81df-4cc0-b9cb-6dee3469dbec.jpg)
![0018](https://user-images.githubusercontent.com/86212850/125954395-7b5a6c33-e769-44e9-ae52-b3c91198dcc1.jpg)
![0019](https://user-images.githubusercontent.com/86212850/125954397-d56bdfdb-990c-4c81-abf9-c3d7e7dfe957.jpg)
![0020](https://user-images.githubusercontent.com/86212850/125954398-cb2f9a1e-86a4-4d9a-a4e0-59b57cf672f9.jpg)
![0021](https://user-images.githubusercontent.com/86212850/125954401-29aaa247-542f-499e-886d-da55e9f3ef9f.jpg)
![0022](https://user-images.githubusercontent.com/86212850/125954402-08232e21-6c92-4620-a045-fd959aa5579b.jpg)
![0023](https://user-images.githubusercontent.com/86212850/125954403-975cc76a-0925-4913-8e07-afdbb9f08301.jpg)

