 # Create a Table and Create entries(in ABAP DICTIONARY)
 ABAP DICTIONARY에 테이블(Customer Table)을 생성하고, 해당 테이블에 엔트리를 추가하는 방법을 공부하였습니다.
 

## Create a Table
- 1step : SE11
- 2step : 테이블 명 입력
- 3step : Description 입력
- 4step : Delivery Class 입력 및 Data Browser.Table View Maint 설정
 
 

| Delivery Class Type |Description|
|:---:|:---:|
| Delivery Class A  |For Master data and Transaction table|
|Delivery Class C|For Customer table|
|Delivery Class L|For Global Temporary table *가상테이블을 만들 때 사용한다.|
|Delivery Class G|For Customer table *변경이나 삭제를 불허함.|
|Delivery Class E|For System table *사용자가 엔트리를 추가할 수 있음.|
|Delivery Class S|For System table *predefined data = 변경 불허.|
|Delivery Class W|For Administration data |

- 5step : 필드값 입력 (Domain, Element, key setting)
- 6steo : Technical Setting 설정(Data Class, size category, )


| Data Class |Description|
|:---:|:---:|
| APPL0|Master data (* 자주 변하지 않는 데이터 값.)|
|APPL1|Transaction data (*자주 변하는 데이터 값.)|
|APPL2|Organizational (*시스템 설치시, 사용자 지정값으로 입력된 데이터로, 잘 안변함.)|
 


## Create a Entries
- 1step : Menubar -> Utilities -> Table Contents -> Create Entries
- 2step : Entry 필드값 입력
- 3step : Save
- How to DELETE 
  
1. Utilities -> Table Contents -> Display -> Execute
2. Menu bar -> Table Entries -> Delete
 
### 유의사항
a. Key값으로 지정된 값을 중복입력하면 데이터가 저장 안됨을 확인할 수 있다.
b. 데이터타입이 호환되지 않을 경우 당연히 입력 안됨.

>  > REFERENCE MATERIAL : SAP HELP PORTAL.
