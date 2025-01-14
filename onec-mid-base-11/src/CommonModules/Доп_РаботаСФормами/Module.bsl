// {{ Добавлено 23.11.2024 Марьмн М.В. Внесение изменений в конфигурацию на поддержке Задание1

#Область ПрограмнныйИнтерфейс

// Определеяем какая форма открыта
Процедура ДополнитьФорму(Форма) Экспорт 
	
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма); 
		ДобавитьПолеСогласованнаяСкидкаВГруппашапкаСлева(Форма);
	КонецЕсли; 
	Если ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	КонецЕсли; 
	Если ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма); 
	КонецЕсли;
	Если ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоПередОснование(Форма);
	КонецЕсли; 
	Если ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоПередСуммаДокумента(Форма);
	КонецЕсли;
	
КонецПроцедуры 


#КонецОбласти 

#Область СлужебныйПрограммныйИнтерфейс
// Добавлям поля на формы. 
Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма) 
		
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Доп_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ДобавитьПолеКонтактноеЛицоПередСуммаДокумента(Форма) 
		
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Доп_КонтактноеЛицо";
	
КонецПроцедуры 


Процедура ДобавитьПолеКонтактноеЛицоПередОснование(Форма) 
		
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.Основание);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Доп_КонтактноеЛицо";
	
КонецПроцедуры



Процедура ДобавитьПолеСогласованнаяСкидкаВГруппашапкаСлева(Форма) 
		
	ПолеВвода = Форма.Элементы.Добавить("Скидка", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаЛево);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Доп_Скидка";
	ПолеВвода.УстановитьДействие("ПриИзменении", "Доп_СогласованнаяСкидкаПриИзменении");
	//Создаем Команду
	НоваяКоманда = Форма.Команды.Добавить("ПересчитатьСкидку");
	НоваяКоманда.Действие = "КнопкаПересчитатьТаблицуСУчетомСкидки";//Имя процедуры
	НоваяКоманда.Заголовок = "Согласованная Скидка";
	//Создаем Кнопку перед указанным
	НоваяКнопка = Форма.Элементы.Вставить("КнопкаВНачале", Тип("КнопкаФормы"),Форма.Элементы.ГруппаШапкаЛево);
	НоваяКнопка.ИмяКоманды = "ПересчитатьСкидку";	
	
КонецПроцедуры


#КонецОбласти  
//  Добавлено 23.11.2024 Марьмн М.В. Внесение изменений в конфигурацию на поддержке Задание1 }}