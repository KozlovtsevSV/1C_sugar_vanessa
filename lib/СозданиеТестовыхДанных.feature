Функционал: Добавление тестовых данных 
    КАК Разработчик
    Я хочу добавлять элементы справочников
    Чтобы тестировать задачи на известных данных

Сценарий: 1. Я создаю данные справочника Банки
    И Я создаю элементы справочника "Банки"
	#Реквизиты
	|Код         |Наименование   | КоррСчет |ВнутреннийКодЦБ  |
	|"000001"    |тестовый Банк  | 524565   | "20005489"      |
    
Сценарий: 2. Я создаю документы Поступление товаров и услуг
    И Я создаю документы "ПоступлениеТоваровУслуг"
    | Номер | Дата         | ВалютаДокумента | КурсВзаиморасчетов | КратностьВзаиморасчетов |  ВидПоступления | Организация                | Контрагент           | СкладОрдер    | СкладОрдер_Тип_ | ДоговорКонтрагента | ОтражатьВБухгалтерскомУчете | ОтражатьВНалоговомУчете | ОтражатьВУправленческомУчете | УчитыватьНДС |
    |       | Текущая дата |             USD |            26.2358 |                       1 | На склад        | Торговый дом "Комплексный" | База "Электротовары" | Главный склад | Склады          | "000000094"        |                          Да |                     Yes |                       Истина |            1 |

    #Товары  в данном примере реквизиты "ЕдиницаИзмерения" и "ЕдиницаИзмеренияМест" имеют владельца Справочник "Номенклатура"
    #владелец реквизита "ЕдиницаИзмерения" отпределяется по пред идушему реквизиту (ссылка на справочник, или ПВХ, планы обмена пока не поддерживаются) получается это реквизит "Номенклатура"
    #для реквизита "ЕдиницаИзмеренияМест" по этому правилу получается владелец в колонке "Номенклатура" что не правильно, поэтому дополнительно необходимо указать колоку где искать владельца      
    #так же возможен вариант когда колонки владельца нет в ТЧ тогда можно указать код владельца если Владелец состовного типа необходимо дополнительно указать в колонке "ИмяРеквизита_ТипВладельца_"
    |Номенклатура                   | КоличествоМест | ЕдиницаИзмерения | ЕдиницаИзмеренияМест | ЕдиницаИзмеренияМест_Владелец_ | ЕдиницаИзмеренияМест_ТипВладельца_ |Коэффициент | Количество | Цена  | Сумма |СтавкаНДС | Склад         | СерияНоменклатуры           |
    |Соковыжималка  BINATONE JE 102 |              1 |               шт |                   шт |                   Номенклатура |                                    |           1 |         10 | 555.5 | 5555  |      18% | Главный склад | СО-789, С-890 от 02.03.2007 |
    |                 "00000000120" |              1 |               шт |                   шт |                  "00000000120" |                       Номенклатура |           1 |         10 | 555.5 | 5555  |      18% | Главный склад | СО-789, С-890 от 02.03.2007 |

Сценарий: 3. Я создаю документы Поступление товаров и услуг с заполнением табличных частей Товары, Услуги
    # Второй вариант создания документов с несколькими табличными частями
    И Я создаю документы "ПоступлениеТоваровУслуг" с ТЧ "Товары, Услуги"
    | Номер        | Дата | ВалютаДокумента | КурсВзаиморасчетов | КратностьВзаиморасчетов |  ВидПоступления | Организация                | Контрагент           | СкладОрдер    | СкладОрдер_Тип_ | ДоговорКонтрагента | ОтражатьВБухгалтерскомУчете | ОтражатьВНалоговомУчете | ОтражатьВУправленческомУчете | УчитыватьНДС |
    |  ТД000000001 |      |             USD |            26.2358 |                       1 | На склад        | Торговый дом "Комплексный" | База "Электротовары" | Главный склад | Склады          | "000000094"        |                          Да |                     Yes |                       Истина |            1 |

    #Товары      
    |Номенклатура                   | КоличествоМест | ЕдиницаИзмерения | ЕдиницаИзмеренияМест | ЕдиницаИзмеренияМест_Владелец_ | Коэффициент | Количество | Цена  | Сумма |СтавкаНДС | Склад         | СерияНоменклатуры           |
    |Соковыжималка  BINATONE JE 102 |              1 |               шт |                   шт | Номенклатура                   |           1 |         10 | 555.5 | 5555  |      18% | Главный склад | СО-789, С-890 от 02.03.2007 |

    #Услуги      
    |Номенклатура | Содержание   | Количество | Цена  | Сумма | СтатьяЗатрат   | СтавкаНДС |
    |Аренда офиса | Аренда офиса |          1 | 15000 | 15000 | Прочие затраты |       18% | 

Сценарий: 4. Я создаю данные в РC Штрихкоды
	И Я создаю данные в РC "Штрихкоды" 
	| Штрихкод        | Владелец           | Владелец_Тип_        | ТипШтрихкода | ЕдиницаИзмерения | Качество |
    | "4607035653957" | Сапоги жен. низкие | Номенклатура         |        EAN13 |             пара |    Новый |
    | "7638900411423" |        "000000006" | ИнформационныеКарты  |        EAN13 |               шт |    Новый |

Сценарий: 5. Я создаю данные в РC КурсыВалют
	И Я создаю данные в РC "КурсыВалют" 
	| Период      | Валюта | Курс    | Кратность |
    |Текущая дата |    USD | 71.3975 | 1         |
    | 02.11.2021  |    EUR | 82.5355 | 1         |


       # ОПИСАНИЕ РАБОТЫ ФУНКЦИЙ САХАРА 
    #   ЗаполнитьРеквизит_Сахар(Приемник, Данные, ТипСсылкиДляСоставногоТипа = Неопределено, Владелец = Неопределено, Дата = Неопределено)
    #   
    #   Приемник - реквизит который необходимо заполнить
    #
    #   Данные - данные которыми необходимо заполнить: 
    #   - для даты строка в формате ("01.01.2020", "01.01.2020 23:56:16", "Текущая дата")
    #   - для булево (Да/Нет, Истина/Ложь, yes/no, true/false)
    #   - для ВидДвижения РН (Приход, Расход)
    #   - для справочника или ПВХ (Наименование, Код, ИмяПредопределенного)
    #   - для документа номер документа
    #
    #   ТипСсылкиДляСоставногоТипа(не обязательный) - для составных типов приемника необходимо дополительно указать тип в виде строки например "Субсчета", "ВозвратЗайма" 
    #       функция самостоятельно проверит какие типы может принимать Приемник и определит Справочник это или документ, Перечисление, ПВХ. 
    #       Если не задать параметр для Приемника с составным типом поиск будет проходить по всем типам Приемника до первой нахлодки
    #   Владелец(не обязательный) - для справочников ссылка на Владельца
    #
    #   Дата(не обязательный) - для документов при необходимости поиска документа по номеру за определеную дату строка в формате ("01.01.2020") или значение тип дата 
    #
    # Функция помогает превести текстовые данные из фичи в:
    #   - примитивные типы (Булево, Число, Дата, Строка)
    #   - Ссылки (Справочники, Документы, ПВХ) 
    #   - ВидДвижения РН (Приход, Расход) 
    #   - пречисление
    #
    # Функция умет заполнять реквизиты, реквизиты (справочников, документов), ПВХ в том числе реквизиты строк табличной части и Таблицы значений
    # упращенный алгоритм работы:
    # 1) определяют тип заполняемого реквизита  
    # 2) пытается заполнить реквизит, 
    #   - для справочников и пвх поиск происходит сначало по наименованию в случае если не удалось найти производится попытка поиска по коду в случае не удачи пробует найти возможно это пред определенный
    #   - для документов поиск производится по номеру в случае необходимости дополнительно задать дату необходимо в тестовые данные добавить колонку "ИмяРеквизита_Дата_"
    #   - для перечислений поиск сначало по значению затем по синониму
    # 3) проверяет что реквизит удалось заполнить в случае если реквизит не заполнен выдает исключение 
    # Пример использования в реализациях фич:
    #
    #    // переменная или реквизит обязательно должны быть тепизированы
	#    Номенклатура = Справочники.Номенклатура.ПустаяСсылка();
	#    ХарактеристикаНоменклатуры = Справочники.ХарактеристикаНоменклатуры.ПустаяСсылка();
	#    ДокументСсылка = Документы.ПоступлениеТоваровУслуг.ПустаяСсылка();
	#    // используем сахар для заполнения реквизитов или переменных
	#    ЗаполнитьРеквизит_Сахар(Номенклатура, "Код, Имя или имя предопределенного");
    #   
    #   // для Субсчета дополнительно передаем ссылку на владельца
	#   ЗаполнитьРеквизит_Сахар(ХарактеристикаНоменклатуры, "Код, Имя или имя предопределенного", , Номенклатура);
    #  
     // для поиска ссылки на домумет можно дополнительно задать дату
	#   ЗаполнитьРеквизит_Сахар(ДокументСсылка, "1", , , "02.01.2020"); 
    #   //ИЛИ
    #   ЗаполнитьРеквизит_Сахар(ДокументСсылка, "1", , , Дата(2020, 1, 2));
    #
		# // примеры как пользоваться сахаром в своих фичах
        # 
#     _ИмяТЧ_
#     НомерДокументаВладельца

     #
    #   ЗаполнитьЗначенияСвойств_Сахар(Приемник, Данные, КолонкиЗаполнения = Неопределено, КолонкиИсключения = Неопределено)
    #   Процедура помогает перевести текстовые табличные части фичи в данные работает на основании процедуры ЗаполнитьРеквизит_Сахар(), умеет заполнять все те же типы данных
    #   
    #   Приемник - Ссылка на справочник, Ссылка на ПВХ, Ссылка на документ, Строка Табличной Части (Справочника/ПВХ/Документа), Строка Таблицы Значений (обязетельно типизированной таблицы значений)
    #
    #   Данные - Строка табличной части с текстовыми данными    
    #
    #   КолонкиЗаполнения(Не обязательный) - Строка с указанеим колонок заполнения через запятую
    #
    #   КолонкиИсключения(Не обязательный) - Строка с указанеим колонок заполнения через запятую
    #
    #   В процедуре добавлен поиск определенных колонок для задания дополнительных данных по реквизитам
    #       "ИмяКолонки_Тип_" - Для указания определенного типа при составном типе значения Приемника
    #
    #       "ИмяКолонки_Владелец_" - для указания владельца реквизита 
    #           (возможные вариатны заполнения колонки 
    #           1) имя реквизита где ожидаем владельца в этом случае колонка владельца должна быть перед заполняемой колонкой для того чтобы сначало найти владельца а затем уже использовать этот реквизит
    #           2) Наименование, Код или ИмяПредопределенного в случае если Владельцем могут быть несколько справочников необходимо указать тип владельца в колонке "ИмяКолонки_ТипВладельца_")
    #       Так - же для упрощения заполнения есть фича что ссылочное значение в пред идущей колонке считается владельцем колонки заполнения примеры:
    #       
    #   |Номенклатура                   | КоличествоМест | ЕдиницаИзмерения | ЕдиницаИзмеренияМест | ЕдиницаИзмеренияМест_Владелец_ | ЕдиницаИзмеренияМест_ТипВладельца_ |Коэффициент | Количество | Цена  | Сумма |СтавкаНДС | Склад         | СерияНоменклатуры           |
    #   |Соковыжималка  BINATONE JE 102 |              1 |               шт |                   шт |                   Номенклатура |                                    |           1 |         10 | 555.5 | 5555  |      18% | Главный склад | СО-789, С-890 от 02.03.2007 |
    #   |                 "00000000120" |              1 |               шт |                   шт |                  "00000000120" |                       Номенклатура |           1 |         10 | 555.5 | 5555  |      18% | Главный склад | СО-789, С-890 от 02.03.2007 |

    #       Для колонки "ЕдиницаИзмерения" Владельцем является значение колонки "Номенклатура" т.к. оно в пред идушей колонке ссылочного типа    
    #       Для колонки "ЕдиницаИзмеренияМест" в первой строке мы явно задаем владельца имя колонки владельца "Номенклатура"
    #       Для колонки "ЕдиницаИзмеренияМест" во второй строке мы код владельца "00000000120", но т.к. владелец у ед.измерения составного типа дополнительно необходимо указать тип владельца в колонке "ЕдиницаИзмеренияМест_ТипВладельца_"
    #
    #
    #       "ИмяКолонки_ТипВладельца_" - для указания типа владельца при состовном типе реквизита
    #
    #       "ИмяКолонки_Дата_" - для указания даты документа Пример:
    #
    #           | ДокументОснование |ДокументОснование_Дата_ |
    #           | 1                 |02.01.2020              | 
    #           В поле "ДокументОснование" указываем номер документа в поле "ДокументОснование_Дата_" указываем дату документа
    #
    #           так же возможно в одном поле указать и дату и время документа пример
    #
    #           | ДокументОснование |
    #           | 1_02.01.2020      |
    #
    #
    # // пример заполнения Таблицы значений
	# // необходимо подготовить таблицу которую заполняем она должна быть типизирована
	#
    # ОписаниеЧисла = Новый ОписаниеТипов("Число", Новый КвалификаторыЧисла(12, 3));		
	# ТЗ = Новый ТаблицаЗначений;
	# Тз.Колонки.Добавить("Номенклатура", Новый ОписаниеТипов("СправочникСсылка.Номенклатура"));
	# Тз.Колонки.Добавить("ЕдиницаИзмерения", Новый ОписаниеТипов("СправочникСсылка.ЕдиницаИзмерения"));
	# Тз.Колонки.Добавить("Количество1", ОписаниеЧисла);
    #
    # ТаблицаЗначений = ТаблицаЗначенийИзПараметра(ТабПарам);
    # // пробуем заполнить таблицу значений данными из сценария
    # Для каждого Строка из ТаблицаЗначений Цикл
    # 	НоваяЗапись = ТЗ.Добавить();
    # // "КолонкиЗаполнения", "КолонкиИсключения" не обязательный параметр
    # // одной стркой заполняем все поля ТЗ 
    # 	ЗаполнитьЗначенияСвойств_Сахар(НоваяЗапись, Строка, "КолонкиЗаполнения", "КолонкиИсключения");
    # КонецЦикла;
    #
