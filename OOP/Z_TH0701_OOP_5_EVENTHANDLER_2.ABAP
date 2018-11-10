*&---------------------------------------------------------------------*
*& Report  Z_TH0701_OOP_5_EVNETHANDLER
*----------------------------------------------------------------------*
*& �ó����� : �跰Ŭ������ ���丮 Ŭ�������� ���� ���� �޵�, ��ũ�� �����ϴ� ������ �����.(Ʈ���� Ŭ����)
*&        : Ʈ���� Ŭ�����鿡�� ������ �ɶ� ����, �α�Ŭ�������� ������ �α������� �����س���.(�ڵ鷯 Ŭ����)
*&
*&---------------------------------------------------------------------*
*& �˰Ե� ��� 1. SET HANDLER�� ����� �ڵ鷯�� �������� �ϴ� ������ �ϹǷ�, �ش� ����� CONSTRUCTOR�޼ҵ忡 ������ �ȵ�������, ������ ������ �����ؼ� ������ ���־�� �Ѵ�.
*&             % ���������, Ʈ���� Ŭ������ �ڵ鷯Ŭ������ ������ �޴� �����̹Ƿ�, CONSTRUCTOR�� �������ְ�, ������ ������ �ڵ鷯Ŭ�������� �����Ͽ�, ���������� ȣ���ϰ����ϸ�,
*&               ���� �޼ҵ峻�� ����� �������ְ�, �ش� �޼ҵ带 ȣ���ϴ� ����� �������ָ� �ȴ�.
*&          2. Ʈ����Ŭ������ �ٸ��ٸ�, �ڵ鷯 Ŭ���������� set handler(��������) �� method(���� �޼ҵ�)�� �̸��� �ٸ����Ͽ� �������־�� �Ѵ�.
*&             ex) �跰 Ŭ����(Ʈ����)�� add_population,���丮 Ŭ����(Ʈ����)�� add_population  ---> on_add_population(�ڵ鷯 Ŭ����)
*&         
*&---------------------------------------------------------------------*

REPORT  z_th0701_oop_5_evnethandler.
DATA : result TYPE i.
DATA : unit TYPE i.
*----------------------------------------------------------------------*
*       CLASS t_barrack DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS t_barrack DEFINITION.
  PUBLIC SECTION.
    METHODS marine_product IMPORTING marine_num TYPE i EXPORTING marine_unit TYPE i.
    METHODS medic_product IMPORTING medic_num TYPE i EXPORTING medic_unit TYPE i.  
    EVENTS add_population.                                                   "Ʈ���� �̺�Ʈ ���.
ENDCLASS.                    "t_barrack DEFINITION

*----------------------------------------------------------------------*
*       CLASS t_factory DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS t_factory DEFINITION.
  PUBLIC SECTION.
    METHODS tank_product IMPORTING tank_num TYPE i EXPORTING tank_unit TYPE i. 
    EVENTS add_population.                                                     "Ʈ���� �̺�Ʈ ���.

ENDCLASS.                    "t_factory DEFINITION

*----------------------------------------------------------------------*
*       CLASS h_population DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS h_population DEFINITION.
  PUBLIC SECTION.
    METHODS constructor.
    METHODS on_add_population FOR EVENT add_population OF t_barrack.            "�ڵ鷯���� �跰 Ʈ���� ����.
    METHODS on_add_population_tank FOR EVENT add_population OF t_factory.       "�ڵ鷯���� �ѷ���  Ʈ���� ����.
ENDCLASS.                    "h_population DEFINITION

*----------------------------------------------------------------------*
*       CLASS t_barrack IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS t_barrack IMPLEMENTATION.
  METHOD marine_product.
    marine_unit = marine_num * 1.
    RAISE EVENT add_population.                                                  "�跰 Ʈ������ RAISE EVENT����1.
  ENDMETHOD.                    "marine_product
  METHOD medic_product.
    medic_unit = medic_num * 2.
    RAISE EVENT add_population.                                                  "�跰 Ʈ������ RAISE EVENT����2.
  ENDMETHOD.                    "medic_product
ENDCLASS.                    "t_barrack IMPLEMENTATION
*----------------------------------------------------------------------*
*       CLASS t_factory IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS t_factory IMPLEMENTATION.
  METHOD tank_product.
    tank_unit = tank_num * 3.
    RAISE EVENT add_population.                                                   "���丮 Ʈ������ RAISE EVENT����.
  ENDMETHOD.                    "tank_product
ENDCLASS.                    "t_factory IMPLEMENTATION
*----------------------------------------------------------------------*
*       CLASS h_population IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS h_population IMPLEMENTATION.
  METHOD constructor.
    SET HANDLER me->on_add_population FOR ALL INSTANCES.                           "�跰 Ʈ���ſ� ���� �ڵ鷯 ���.
        SET HANDLER me->on_add_population_tank FOR ALL INSTANCES.                  "���丮 Ʈ���ſ� ���� �ڵ鷯 ���.
  ENDMETHOD.                    "constructor
  METHOD on_add_population.
    result = result + unit.
    WRITE : /'������� �α��� : ', result.
  ENDMETHOD.                    "on_add_population
    METHOD on_add_population_tank.
    result = result + unit.
    WRITE : /'������� �α��� : ', result.
  ENDMETHOD.                    "on_add_population
ENDCLASS.                    "h_population IMPLEMENTATION

DATA : obj1 TYPE REF TO t_barrack,
      obj2 TYPE REF TO t_factory,
      obj3 TYPE REF TO h_population.

START-OF-SELECTION.


  CREATE OBJECT obj1.
  CREATE OBJECT obj2.
  CREATE OBJECT obj3.

  CALL METHOD obj1->marine_product                   "3���� �α����� �߰���
    EXPORTING
      marine_num  = 3
    IMPORTING
      marine_unit = unit.
  
  CALL METHOD obj2->tank_product                       "9���α����� �߰���.
    EXPORTING
      tank_num  = 3
    IMPORTING
      tank_unit = unit.
  
    CALL METHOD obj1->medic_product                    "6���� �α����� �߰���
    EXPORTING
      medic_num  = 3
    IMPORTING
      medic_unit = unit.