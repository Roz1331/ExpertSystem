;========================================================================
; Этот блок реализует логику обмена информацией с графической оболочкой,
; а также механизм остановки и повторного пуска машины вывода
; Русский текст в комментариях разрешён!

(deftemplate ioproxy  ; шаблон факта-посредника для обмена информацией с GUI
	(slot fact-id)        ; теоретически тут id факта для изменения
	(multislot answers)   ; возможные ответы
	(multislot messages)  ; исходящие сообщения
	(slot reaction)       ; возможные ответы пользователя
	(slot value)          ; выбор пользователя
	(slot restore)        ; забыл зачем это поле
)

; Собственно экземпляр факта ioproxy
(deffacts proxy-fact
	(ioproxy
		(fact-id 0112) ; это поле пока что не задействовано
		(value none)   ; значение пустое
		(messages)     ; мультислот messages изначально пуст
	)
)

(defrule clear-messages
	(declare (salience 90))
	?clear-msg-flg <- (clearmessage)
	?proxy <- (ioproxy)
	=>
	(modify ?proxy (messages))
	(retract ?clear-msg-flg)
	(printout t "Messages cleared ..." crlf)	
)

(defrule set-output-and-halt
	(declare (salience 99))
	?current-message <- (sendmessagehalt ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message set : " ?new-msg " ... halting ..." crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message)
	(halt)
)

(defrule append-output-and-halt
	; Аналогичен предыдущему, но с добавлением сообщения, а не с заменой
	(declare (salience 99))
	?current-message <- (appendmessagehalt ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message appended : " ?new-msg " ... halting ..." crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message)
	(halt)
)

(defrule set-output-and-proceed
	(declare (salience 99))
	?current-message <- (sendmessage ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message set : " ?new-msg " ... halting ..." crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message))

(defrule append-output-and-proceed
	; По аналогии
	(declare (salience 99))
	?current-message <- (appendmessage ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message appended : " ?new-msg " ... halting ..." crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message))
)

;======================================================================================
(deftemplate barParam 
	(slot argument)
)

(defrule greeting
	(declare (salience 100))
	=>
	(assert (appendmessagehalt "Внимание! Чрезмерное употребление алкоголя вредит вашему здоровью! Зато как приятно вредит..."))
)

;========================================================
(defrule Для_больших_компаний_-_только_большие_бары
(declare(salience 40))
(barParam(argument Большая_компания))
=>
(assert(barParam(argument Большой_бар)))
(assert(appendmessagehalt "Для больших компаний - только большие бары"))

(defrule Маленькая_компания_может_пойти_в_большой_бар
(declare(salience 40))
(barParam(argument Компания_до_4_человек))
=>
(assert(barParam(argument Большой_бар)))
(assert(appendmessagehalt "Маленькая компания может пойти в большой бар"))

(defrule Маленькая_компания_поместится_в_бар_с_парой_больших_столов
(declare(salience 40))
(barParam(argument Компания_до_4_человек))
=>
(assert(barParam(argument Бар_с_парой_больших_столов)))
(assert(appendmessagehalt "Маленькая компания поместится в бар с парой больших столов"))

(defrule Для_больших_компаний_-_только_большие_бары
(declare(salience 40))
(barParam(argument Большая_компания))
=>
(assert(barParam(argument Большой_бар)))
(assert(appendmessagehalt "Для больших компаний - только большие бары"))

(defrule Вдвоём_можно_сходить_в_большой_бар
(declare(salience 40))
(barParam(argument Вдвоем))
=>
(assert(barParam(argument Большой_бар)))
(assert(appendmessagehalt "Вдвоём можно сходить в большой бар"))

(defrule Вдвоём_можно_сходить_и_в_средний_бар
(declare(salience 40))
(barParam(argument Вдвоем))
=>
(assert(barParam(argument Бар_с_парой_больших_столов)))
(assert(appendmessagehalt "Вдвоём можно сходить и в средний бар"))

(defrule Вдвоём_поместитесь_за_маленьким_столиком
(declare(salience 40))
(barParam(argument Вдвоем))
=>
(assert(barParam(argument Бар_только_с_маленькими_столиками)))
(assert(appendmessagehalt "Вдвоём поместитесь за маленьким столиком"))

(defrule Одному_можно_посидеть_за_барной_стойкой
(declare(salience 40))
(barParam(argument В_одиночку))
=>
(assert(barParam(argument Бар_без_столиков)))
(assert(appendmessagehalt "Одному можно посидеть за барной стойкой"))

(defrule Одному_можно_посидеть_за_столиком
(declare(salience 40))
(barParam(argument В_одиночку))
=>
(assert(barParam(argument Бар_только_с_маленькими_столиками)))
(assert(appendmessagehalt "Одному можно посидеть за столиком"))

(defrule Одному_можно_прийти_в_средний_бар
(declare(salience 40))
(barParam(argument В_одиночку))
=>
(assert(barParam(argument Бар_с_парой_больших_столов)))
(assert(appendmessagehalt "Одному можно прийти в средний бар"))

(defrule Одному_можно_найти_место_в_большом_баре
(declare(salience 40))
(barParam(argument В_одиночку))
=>
(assert(barParam(argument Большой_бар)))
(assert(appendmessagehalt "Одному можно найти место в большом баре"))

(defrule Если_сотка_в_кармане_-_иди_в_дешёвый_бар
(declare(salience 40))
(barParam(argument Посидеть_на_сотку))
=>
(assert(barParam(argument Дешёвый_бар)))
(assert(appendmessagehalt "Если сотка в кармане - иди в дешёвый бар"))

(defrule Если_у_тебя_есть_стипендия_-_купи_много_в_дешёвом_баре
(declare(salience 40))
(barParam(argument Посидеть_на_стипендию))
=>
(assert(barParam(argument Дешёвый_бар)))
(assert(appendmessagehalt "Если у тебя есть стипендия - купи много в дешёвом баре"))

(defrule Со_стипендией_можно_пойти_в_бар_со_средними_ценами
(declare(salience 40))
(barParam(argument Посидеть_на_стипендию))
=>
(assert(barParam(argument Бар_средней_ценовой_категории)))
(assert(appendmessagehalt "Со стипендией можно пойти в бар со средними ценами"))

(defrule Если_ты_с_зарплатой_-_купи_очень_много_в_дешёвом_баре
(declare(salience 40))
(barParam(argument Посидеть_на_зарплату))
=>
(assert(barParam(argument Дешёвый_бар)))
(assert(appendmessagehalt "Если ты с зарплатой - купи очень много в дешёвом баре"))

(defrule Если_ты_с_зарплатой_-_иди_веселись_в_среднем_баре
(declare(salience 40))
(barParam(argument Посидеть_на_зарплату))
=>
(assert(barParam(argument Бар_средней_ценовой_категории)))
(assert(appendmessagehalt "Если ты с зарплатой - иди веселись в среднем баре"))

(defrule С_зарплатой_и_с_QR_кодом_можно_шиковать_в_дорогом_баре
(declare(salience 40))
(barParam(argument Посидеть_на_зарплату))
(barParam(argument Все_равно_проверяют_ли_QR-кода))
=>
(assert(barParam(argument Дорогой_бар)))
(assert(appendmessagehalt "С зарплатой и с QR кодом можно шиковать в дорогом баре"))

(defrule Лонг_дринки_-_легко
(declare(salience 40))
(barParam(argument Коктейли))
=>
(assert(barParam(argument Слабоалкогольные_напитки)))
(assert(appendmessagehalt "Лонг дринки - легко"))

(defrule Пиво_-_легко
(declare(salience 40))
(barParam(argument Пиво))
=>
(assert(barParam(argument Слабоалкогольные_напитки)))
(assert(appendmessagehalt "Пиво - легко"))

(defrule Сидр_-_легко
(declare(salience 40))
(barParam(argument Cидр))
=>
(assert(barParam(argument Слабоалкогольные_напитки)))
(assert(appendmessagehalt "Сидр - легко"))

(defrule Вино_-_легко
(declare(salience 40))
(barParam(argument Вино))
=>
(assert(barParam(argument Слабоалкогольные_напитки)))
(assert(appendmessagehalt "Вино - легко"))

(defrule Сидр_=>_сидрерия
(declare(salience 40))
(barParam(argument Cидр))
=>
(assert(barParam(argument Сидрерия)))
(assert(appendmessagehalt "Сидр => сидрерия"))

(defrule Сидр_=>_пивной_бар
(declare(salience 40))
(barParam(argument Cидр))
=>
(assert(barParam(argument Пивной_бар)))
(assert(appendmessagehalt "Сидр => пивной бар"))

(defrule Слабый_алкоголь_=>_бар_широкого_профиля
(declare(salience 40))
(barParam(argument Слабоалкогольные_напитки))
=>
(assert(barParam(argument Бар_широкого_профиля)))
(assert(appendmessagehalt "Слабый алкоголь => бар широкого профиля"))

(defrule Вино_=>_винный_бар
(declare(salience 40))
(barParam(argument Вино))
=>
(assert(barParam(argument Винный_бар)))
(assert(appendmessagehalt "Вино => винный бар"))

(defrule Вино_=>_бар_широкого_профиля
(declare(salience 40))
(barParam(argument Вино))
=>
(assert(barParam(argument Бар_широкого_профиля)))
(assert(appendmessagehalt "Вино => бар широкого профиля"))

(defrule Пиво_=>_пивбар
(declare(salience 40))
(barParam(argument Пиво))
=>
(assert(barParam(argument Пивной_бар)))
(assert(appendmessagehalt "Пиво => пивбар"))

(defrule Крепкие_напитки_=>_Бар_широкого_профиля
(declare(salience 40))
(barParam(argument Крепкие_напитки))
=>
(assert(barParam(argument Бар_широкого_профиля)))
(assert(appendmessagehalt "Крепкие напитки => Бар широкого профиля"))

(defrule Лонг_дринки_=>_Коктейльный_бар
(declare(salience 40))
(barParam(argument Коктейли))
=>
(assert(barParam(argument Коктейльный_бар)))
(assert(appendmessagehalt "Лонг дринки => Коктейльный бар"))

(defrule Есть_все_отрицания_фич_=>_нам_на_них_всё_равно
(declare(salience 40))
(barParam(argument Настольный_футбол_не_обязателен))
(barParam(argument Нет_необходимости_сидеть_после_закрытия))
(barParam(argument Кальян_не_обязателен))
(barParam(argument Кухня_не_обязательна))
(barParam(argument Устроят_обычные_официанты))
(barParam(argument Все_равно_проверяют_ли_QR-кода))
(barParam(argument Кот_не_обязателен))
(barParam(argument Нет_столиков_на_улице))
=>
(assert(barParam(argument Не_выбрана_ни_одна_фича)))
(assert(appendmessagehalt "Есть все отрицания фич => нам на них всё равно"))

(defrule Мы_дошли_до_пивка_на_западном!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_на_западном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Бар_без_столиков))
=>
(assert(barParam(argument Бар_Пив&ко)))
(assert(appendmessagehalt "Мы дошли до пивка на западном!!"))

(defrule Мы_дошли_до_пивка_на_северном!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_на_северном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Бар_без_столиков))
=>
(assert(barParam(argument Бар_Пив&ко)))
(assert(appendmessagehalt "Мы дошли до пивка на северном!!"))

(defrule Мы_дошли_до_пивноff_на_западном!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_на_западном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Бар_без_столиков))
=>
(assert(barParam(argument Бар_Пивноff)))
(assert(appendmessagehalt "Мы дошли до пивноff на западном!!"))

(defrule Мы_дошли_до_пивноff_на_северном!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_на_северном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Бар_без_столиков))
=>
(assert(barParam(argument Бар_Пивноff)))
(assert(appendmessagehalt "Мы дошли до пивноff на северном!!"))

(defrule Мы_дошли_до_Есенина!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Бар_с_парой_больших_столов))
=>
(assert(barParam(argument Бар_Есенин)))
(assert(appendmessagehalt "Мы дошли до Есенина!!"))

(defrule Мы_дошли_до_O.W.Grant!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Коктейльный_бар))
(barParam(argument Дорогой_бар))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_O.W.Grant)))
(assert(appendmessagehalt "Мы дошли до O.W.Grant!!"))

(defrule Мы_дошли_до_Сияния!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Винный_бар))
(barParam(argument Дорогой_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Сияние)))
(assert(appendmessagehalt "Мы дошли до Сияния!!"))

(defrule Мы_дошли_до_Мистера_Fox!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Сидрерия))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_Мистер_Fox)))
(assert(appendmessagehalt "Мы дошли до Мистера Fox!!"))

(defrule Мы_дошли_до_Дров!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_Дрова)))
(assert(appendmessagehalt "Мы дошли до Дров!!"))

(defrule Мы_дошли_до_Hops!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Бар_с_парой_больших_столов))
=>
(assert(barParam(argument Бар_Hops)))
(assert(appendmessagehalt "Мы дошли до Hops!!"))

(defrule Мы_дошли_до_Своего_бара!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Коктейльный_бар))
(barParam(argument Дорогой_бар))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_Свой_Бар)))
(assert(appendmessagehalt "Мы дошли до Своего бара!!"))

(defrule Мы_дошли_до_Эйнштейна!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_на_западном))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Эйнштейн)))
(assert(appendmessagehalt "Мы дошли до Эйнштейна!!"))

(defrule Мы_дошли_до_Пинты_на_западном!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_на_западном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Пинта)))
(assert(appendmessagehalt "Мы дошли до Пинты на западном!!"))

(defrule Мы_дошли_до_Пинты_на_северном!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_на_северном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Пинта)))
(assert(appendmessagehalt "Мы дошли до Пинты на северном!!"))

(defrule Мы_дошли_до_Пинты_в_центре!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Пинта)))
(assert(appendmessagehalt "Мы дошли до Пинты в центре!!"))

(defrule Мы_дошли_до_Доброго_Эля_на_западном!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_на_западном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы дошли до Доброго Эля на западном!!"))

(defrule Мы_дошли_до_Доброго_Эля_на_северном!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_на_северном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы дошли до Доброго Эля на северном!!"))

(defrule Мы_дошли_до_Доброго_Эля_в_центре!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы дошли до Доброго Эля в центре!!"))

(defrule Мы_дошли_до_Немца_Перца_Колбасы!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Дешёвый_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Мы дошли до Немца Перца Колбасы!!"))

(defrule Мы_дошли_до_Голодранца!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_Голодранец)))
(assert(appendmessagehalt "Мы дошли до Голодранца!!"))

(defrule Мы_дошли_до_1984!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Дорогой_бар))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_1984)))
(assert(appendmessagehalt "Мы дошли до 1984!!"))

(defrule Мы_дошли_до_Квадрюпеля!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Бар_с_парой_больших_столов))
=>
(assert(barParam(argument Бар_Квадрюпель)))
(assert(appendmessagehalt "Мы дошли до Квадрюпеля!!"))

(defrule Мы_дошли_до_Красного_Крокодила!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_на_северном))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Дешёвый_бар))
(barParam(argument Бар_с_парой_больших_столов))
=>
(assert(barParam(argument Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Мы дошли до Красного Крокодила!!"))

(defrule Мы_дошли_до_Шамайки!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Шамайка)))
(assert(appendmessagehalt "Мы дошли до Шамайки!!"))

(defrule Мы_дошли_до_Корриды!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_на_северном))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Коррида)))
(assert(appendmessagehalt "Мы дошли до Корриды!!"))

(defrule Мы_дошли_до_London_Pub!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Дорогой_бар))
(barParam(argument Бар_с_парой_больших_столов))
=>
(assert(barParam(argument Бар_London_Pub)))
(assert(appendmessagehalt "Мы дошли до London Pub!!"))

(defrule Мы_дошли_до_St._Patrick’s_Pub!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Дорогой_бар))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_St._Patrick’s_Pub)))
(assert(appendmessagehalt "Мы дошли до St. Patrick’s Pub!!"))

(defrule Мы_дошли_до_Mozart_Wine_House!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Винный_бар))
(barParam(argument Дорогой_бар))
(barParam(argument Бар_без_столиков))
=>
(assert(barParam(argument Бар_Mozart_Wine_House)))
(assert(appendmessagehalt "Мы дошли до Mozart Wine House!!"))

(defrule Мы_дошли_до_Шкипера!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Бар_без_столиков))
=>
(assert(barParam(argument Бар_Шкипер)))
(assert(appendmessagehalt "Мы дошли до Шкипера!!"))

(defrule Мы_дошли_до_Mojo!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Коктейльный_бар))
(barParam(argument Дорогой_бар))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_Mojo)))
(assert(appendmessagehalt "Мы дошли до Mojo!!"))

(defrule Мы_дошли_до_Чёрного_кота!!
(declare(salience 40))
(barParam(argument Не_выбрана_ни_одна_фича))
(barParam(argument Располагается_в_центрe))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Дешёвый_бар))
(barParam(argument Бар_без_столиков))
=>
(assert(barParam(argument Бар_Чёрный_кот)))
(assert(appendmessagehalt "Мы дошли до Чёрного кота!!"))

(defrule Есть_настольный_футбол_и_можно_сидеть_после_закрытия_=>_можно_посидеть_компанией
(declare(salience 40))
(barParam(argument Есть_настольный_футбол))
(barParam(argument Можно_сидеть_после_закрытия))
=>
(assert(barParam(argument Можно_посидеть_компанией)))
(assert(appendmessagehalt "Есть настольный футбол и можно сидеть после закрытия => можно посидеть компанией"))

(defrule Нет_столиков_на_улице_и_все_равно_проверяют_ли_QR-код_=>_привитый
(declare(salience 40))
(barParam(argument Нет_столиков_на_улице))
(barParam(argument Все_равно_проверяют_ли_QR-кода))
=>
(assert(barParam(argument Привитый)))
(assert(appendmessagehalt "Нет столиков на улице и все равно проверяют ли QR-код => привитый"))

(defrule Есть_кухня_и_милые_официанты_=>_бар-ресторан_с_хорошим_обслуживанием
(declare(salience 40))
(barParam(argument Есть_кухня))
(barParam(argument Милые_официанты))
=>
(assert(barParam(argument Бар-ресторан_с_хорошим_обслуживанием)))
(assert(appendmessagehalt "Есть кухня и милые официанты => бар-ресторан с хорошим обслуживанием"))

(defrule Кальян_не_обязателен_и_кухня_не_обязательна_=>_зашли_просто_выпить
(declare(salience 40))
(barParam(argument Кальян_не_обязателен))
(barParam(argument Кухня_не_обязательна))
=>
(assert(barParam(argument Зашли_просто_выпить)))
(assert(appendmessagehalt "Кальян не обязателен и кухня не обязательна => зашли просто выпить"))

(defrule Можно_сидеть_после_закрытия_и_есть_кухня_=>_отмечаем_что-то
(declare(salience 40))
(barParam(argument Можно_сидеть_после_закрытия))
(barParam(argument Есть_кухня))
=>
(assert(barParam(argument Отмечаем_что-то)))
(assert(appendmessagehalt "Можно сидеть после закрытия и есть кухня => отмечаем что-то"))

(defrule Кот_и_настольный_футбол_не_обязательны,_на_официантов_все_равно_=>_поздравляю,_вы_социо-_и_котофоб
(declare(salience 40))
(barParam(argument Кот_не_обязателен))
(barParam(argument Устроят_обычные_официанты))
(barParam(argument Настольный_футбол_не_обязателен))
=>
(assert(barParam(argument Социо-_и_котофоб)))
(assert(appendmessagehalt "Кот и настольный футбол не обязательны, на официантов все равно => поздравляю, вы социо- и котофоб"))

(defrule Кошатники
(declare(salience 40))
(barParam(argument Устроят_обычные_официанты))
(barParam(argument Хочу_кота!))
(barParam(argument Настольный_футбол_не_обязателен))
(barParam(argument Зашли_просто_выпить))
=>
(assert(barParam(argument Кошатники)))
(assert(appendmessagehalt "Кошатники"))

(defrule Обниматься_с_котом_до_закрытия_
(declare(salience 40))
(barParam(argument Кошатники))
(barParam(argument Нет_необходимости_сидеть_после_закрытия))
=>
(assert(barParam(argument Обниматься_с_котом__до_закрытия_)))
(assert(appendmessagehalt "Обниматься с котом до закрытия "))

(defrule Обниматься_с_котом_до_утра
(declare(salience 40))
(barParam(argument Кошатники))
(barParam(argument Можно_сидеть_после_закрытия))
=>
(assert(barParam(argument Обниматься_с_котом_до_утра)))
(assert(appendmessagehalt "Обниматься с котом до утра"))

(defrule Кошатники,_которым_все_равно_проверяют_ли_QR-код,_есть_столики_на_улице_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(argument Все_равно_проверяют_ли_QR-кода))
(barParam(argument Есть_столики_на_улице))
(barParam(argument Обниматься_с_котом__до_закрытия_))
=>
(assert(barParam(argument Бар_Квадрюпель)))
(assert(appendmessagehalt "Кошатники, которым все равно проверяют ли QR-код, есть столики на улице => Бар Квадрюпель"))

(defrule Привитый_обнимается_с_котом__до_закрытия_=>_Бар_Квадрюпель_
(declare(salience 40))
(barParam(argument Привитый))
(barParam(argument Обниматься_с_котом__до_закрытия_))
=>
(assert(barParam(argument Бар_Квадрюпель)))
(assert(appendmessagehalt "Привитый обнимается с котом  до закрытия => Бар Квадрюпель "))

(defrule Обниматься_с_котом_до_утра,_все_равно_проверяют_ли_QR-код,_есть_столики_на_улице_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(argument Все_равно_проверяют_ли_QR-кода))
(barParam(argument Есть_столики_на_улице))
(barParam(argument Обниматься_с_котом_до_утра))
=>
(assert(barParam(argument Бар_Квадрюпель)))
(assert(appendmessagehalt "Обниматься с котом до утра, все равно проверяют ли QR-код, есть столики на улице => Бар Квадрюпель"))

(defrule Привитый_обнимается_с_котом_до_утра_=>_Бар_Квадрюпель_
(declare(salience 40))
(barParam(argument Привитый))
(barParam(argument Обниматься_с_котом_до_утра))
=>
(assert(barParam(argument Бар_Квадрюпель)))
(assert(appendmessagehalt "Привитый обнимается с котом до утра => Бар Квадрюпель "))

(defrule Обниматься_с_котом__до_закрытия_без_QR-кода_=>_Бар_Есенин
(declare(salience 40))
(barParam(argument Не_требуется_QR-код))
(barParam(argument Нет_столиков_на_улице))
(barParam(argument Обниматься_с_котом__до_закрытия_))
=>
(assert(barParam(argument Бар_Есенин)))
(assert(appendmessagehalt "Обниматься с котом  до закрытия без QR-кода => Бар Есенин"))

(defrule Привитый_обнимается_с_котом__до_закрытия_=>_Бар_Есенин_
(declare(salience 40))
(barParam(argument Привитый))
(barParam(argument Обниматься_с_котом__до_закрытия_))
=>
(assert(barParam(argument Бар_Есенин)))
(assert(appendmessagehalt "Привитый обнимается с котом  до закрытия => Бар Есенин "))

(defrule Привитый_обнимается_с_котом_до_утра_=>_Бар_Есенин_
(declare(salience 40))
(barParam(argument Привитый))
(barParam(argument Обниматься_с_котом_до_утра))
=>
(assert(barParam(argument Бар_Есенин)))
(assert(appendmessagehalt "Привитый обнимается с котом до утра => Бар Есенин "))

(defrule Обниматься_с_котом_до_утра,_не_требуется_QR-код,_нет_столиков_на_улице_=>_Бар_Есенин
(declare(salience 40))
(barParam(argument Не_требуется_QR-код))
(barParam(argument Нет_столиков_на_улице))
(barParam(argument Обниматься_с_котом_до_утра))
=>
(assert(barParam(argument Бар_Есенин)))
(assert(appendmessagehalt "Обниматься с котом до утра, не требуется QR-код, нет столиков на улице => Бар Есенин"))

(defrule Бар-ресторан_с_хорошим_обслуживанием_без_кота,_кикера_и_кальяна_=>_бар_для_представительных_персон
(declare(salience 40))
(barParam(argument Бар-ресторан_с_хорошим_обслуживанием))
(barParam(argument Кот_не_обязателен))
(barParam(argument Настольный_футбол_не_обязателен))
(barParam(argument Кальян_не_обязателен))
=>
(assert(barParam(argument Бар_для_представительных_персон)))
(assert(appendmessagehalt "Бар-ресторан с хорошим обслуживанием без кота, кикера и кальяна => бар для представительных персон"))

(defrule Бар_для_привитых_представительных_персон
(declare(salience 40))
(barParam(argument Бар_для_представительных_персон))
(barParam(argument Привитый))
=>
(assert(barParam(argument Бар_для_привитых_представительных_персон)))
(assert(appendmessagehalt "Бар для привитых представительных персон"))

(defrule Бар_для_представительных_персон,_которым_рано_вставать
(declare(salience 40))
(barParam(argument Бар_для_представительных_персон))
(barParam(argument Нет_необходимости_сидеть_после_закрытия))
=>
(assert(barParam(argument Бар_для_представительных_персон,_которым_рано_вставать)))
(assert(appendmessagehalt "Бар для представительных персон, которым рано вставать"))

(defrule Социо-_и_котофоб,_которому_рано_вставать
(declare(salience 40))
(barParam(argument Социо-_и_котофоб))
(barParam(argument Нет_необходимости_сидеть_после_закрытия))
=>
(assert(barParam(argument Социо-_и_котофоб,_которому_рано_вставать)))
(assert(appendmessagehalt "Социо- и котофоб, которому рано вставать"))

(defrule Бар_для_привитых_представительных_персон_которым_ещё_и_рано_вставать_(бедные...)
(declare(salience 40))
(barParam(argument Бар_для_привитых_представительных_персон))
(barParam(argument Нет_необходимости_сидеть_после_закрытия))
=>
(assert(barParam(argument Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать_(жалко_их...))))
(assert(appendmessagehalt "Бар для привитых представительных персон которым ещё и рано вставать (бедные...)"))

(defrule Бар_для_привитых_представительных_персон,_где_можно_сидеть_после_закрытия_=>_Бар_O.W._Grant
(declare(salience 40))
(barParam(argument Бар_для_привитых_представительных_персон))
(barParam(argument Можно_сидеть_после_закрытия))
=>
(assert(barParam(argument Бар_O.W.Grant)))
(assert(appendmessagehalt "Бар для привитых представительных персон, где можно сидеть после закрытия => Бар O.W. Grant"))

(defrule Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать_(жалко_их...)_=>_Коррида
(declare(salience 40))
(barParam(argument Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать_(жалко_их...)))
=>
(assert(barParam(argument Бар_Коррида)))
(assert(appendmessagehalt "Бар для привитых представительных персон, которым ещё и рано вставать (жалко их...) => Коррида"))

(defrule Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать_(жалко_их...)_=>_Красный_Крокодил
(declare(salience 40))
(barParam(argument Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать_(жалко_их...)))
=>
(assert(barParam(argument Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Бар для привитых представительных персон, которым ещё и рано вставать (жалко их...) => Красный Крокодил"))

(defrule Социо-_и_котофоб,_которому_рано_вставать_=>_Бар_O.W.Grant
(declare(salience 40))
(barParam(argument Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать_(жалко_их...)))
(barParam(argument Все_равно_проверяют_ли_QR-кода))
=>
(assert(barParam(argument Бар_O.W.Grant)))
(assert(appendmessagehalt "Социо- и котофоб, которому рано вставать => Бар O.W.Grant"))

(defrule Социо-_и_котофоб,_которому_рано_вставать_идет_в_бар-ресторан_с_хорошим_обслуживанием_=>_Бар_Сияние
(declare(salience 40))
(barParam(argument Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать_(жалко_их...)))
(barParam(argument Бар-ресторан_с_хорошим_обслуживанием))
=>
(assert(barParam(argument Бар_Сияние)))
(assert(appendmessagehalt "Социо- и котофоб, которому рано вставать идет в бар-ресторан с хорошим обслуживанием => Бар Сияние"))

(defrule Социо-_и_котофоб,_которому_рано_вставать_идет_в_бар-ресторан_с_хорошим_обслуживанием_=>_London_Pub
(declare(salience 40))
(barParam(argument Бар_для_привитых_представительных_персон,_которым_ещё_и_рано_вставать_(жалко_их...)))
(barParam(argument Бар-ресторан_с_хорошим_обслуживанием))
=>
(assert(barParam(argument Бар_London_Pub)))
(assert(appendmessagehalt "Социо- и котофоб, которому рано вставать идет в бар-ресторан с хорошим обслуживанием => London Pub"))

(defrule Бар_без_столиков_на_улице_для_представительных_персон,_которым_рано_вставать_=>_Красный_Крокодил
(declare(salience 40))
(barParam(argument Бар_для_представительных_персон,_которым_рано_вставать))
(barParam(argument Не_требуется_QR-код))
(barParam(argument Нет_столиков_на_улице))
=>
(assert(barParam(argument Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Бар без столиков на улице для представительных персон, которым рано вставать => Красный Крокодил"))

(defrule Бар-ресторан_с_хорошим_обслуживанием_для_представительных_персон,_которым_рано_вставать_=>_Бар_Сияние
(declare(salience 40))
(barParam(argument Бар_для_представительных_персон,_которым_рано_вставать))
(barParam(argument Все_равно_проверяют_ли_QR-кода))
(barParam(argument Бар-ресторан_с_хорошим_обслуживанием))
(barParam(argument Есть_столики_на_улице))
=>
(assert(barParam(argument Бар_Сияние)))
(assert(appendmessagehalt "Бар-ресторан с хорошим обслуживанием для представительных персон, которым рано вставать => Бар Сияние"))

(defrule Нелюдимый_алкоголик_пришёл_сидеть_до_утра
(declare(salience 40))
(barParam(argument Социо-_и_котофоб))
(barParam(argument Зашли_просто_выпить))
(barParam(argument Можно_сидеть_после_закрытия))
=>
(assert(barParam(argument Нелюдимый_алкоголик_пришёл_сидеть_до_утра)))
(assert(appendmessagehalt "Нелюдимый алкоголик пришёл сидеть до утра"))

(defrule Нелюдимый__социально_ответственный_алкоголик_пришёл_сидеть_до_утра
(declare(salience 40))
(barParam(argument Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(argument Привитый))
=>
(assert(barParam(argument Нелюдимый__социально_ответственный_алкоголик_пришёл_сидеть_до_утра)))
(assert(appendmessagehalt "Нелюдимый  социально ответственный алкоголик пришёл сидеть до утра"))

(defrule Алкоголик-домосед_пришёл_сидеть_до_утра
(declare(salience 40))
(barParam(argument Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(argument Нет_столиков_на_улице))
=>
(assert(barParam(argument Алкоголик-домосед_пришёл_сидеть_до_утра)))
(assert(appendmessagehalt "Алкоголик-домосед пришёл сидеть до утра"))

(defrule Привитый_социо-_и_котофоб_отмечает_без_кальяна_=>Бар_Мистер_Fox
(declare(salience 40))
(barParam(argument Социо-_и_котофоб))
(barParam(argument Привитый))
(barParam(argument Кальян_не_обязателен))
(barParam(argument Отмечаем_что-то))
=>
(assert(barParam(argument Бар_Мистер_Fox)))
(assert(appendmessagehalt "Привитый социо- и котофоб отмечает без кальяна =>Бар Мистер Fox"))

(defrule Нелюдимый_привитый_алкоголик_пришёл_сидеть_до_утра_=>_Бар_Есенин
(declare(salience 40))
(barParam(argument Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(argument Привитый))
=>
(assert(barParam(argument Бар_Есенин)))
(assert(appendmessagehalt "Нелюдимый привитый алкоголик пришёл сидеть до утра => Бар Есенин"))

(defrule Нелюдимый_привитый_алкоголик_пришёл_сидеть_до_утра_=>_Бар_O.W.Grant	__
(declare(salience 40))
(barParam(argument Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(argument Привитый))
=>
(assert(barParam(argument Бар_O.W.Grant)))
(assert(appendmessagehalt "Нелюдимый привитый алкоголик пришёл сидеть до утра => Бар O.W.Grant	  "))

(defrule Нелюдимый_привитый_алкоголик_пришёл_сидеть_до_утра_=>_Бар_Квадрюпель_____	___
(declare(salience 40))
(barParam(argument Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(argument Привитый))
=>
(assert(barParam(argument Бар_Квадрюпель)))
(assert(appendmessagehalt "Нелюдимый привитый алкоголик пришёл сидеть до утра => Бар Квадрюпель     	   "))

(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Дрова_____	___	_
(declare(salience 40))
(barParam(argument Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(argument Привитый))
=>
(assert(barParam(argument Бар_Дрова)))
(assert(appendmessagehalt "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Дрова     	   	 "))

(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Мистер_Fox_______	__
(declare(salience 40))
(barParam(argument Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(argument Привитый))
=>
(assert(barParam(argument Бар_Мистер_Fox)))
(assert(appendmessagehalt "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Мистер Fox       	  "))

(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>Бар_Чёрный_кот____	___
(declare(salience 40))
(barParam(argument Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(argument Привитый))
=>
(assert(barParam(argument Бар_Чёрный_кот)))
(assert(appendmessagehalt "Нелюдимый привитый  алкоголик пришёл сидеть до утра =>Бар Чёрный кот    	   "))

(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Голодранец____	__
(declare(salience 40))
(barParam(argument Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(argument Привитый))
=>
(assert(barParam(argument Бар_Голодранец)))
(assert(appendmessagehalt "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Голодранец    	  "))

(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Шкипер_		___
(declare(salience 40))
(barParam(argument Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(argument Привитый))
=>
(assert(barParam(argument Бар_Шкипер)))
(assert(appendmessagehalt "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Шкипер 		   "))

(defrule Нелюдимый_привитый__алкоголик_пришёл_сидеть_до_утра_=>_Бар_Свой_Бар___
(declare(salience 40))
(barParam(argument Нелюдимый_алкоголик_пришёл_сидеть_до_утра))
(barParam(argument Привитый))
=>
(assert(barParam(argument Бар_Свой_Бар)))
(assert(appendmessagehalt "Нелюдимый привитый  алкоголик пришёл сидеть до утра => Бар Свой Бар   "))

(defrule Алкоголик-домосед_пришёл_сидеть_до_утра_без_QR-кода_на_улице_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(argument Алкоголик-домосед_пришёл_сидеть_до_утра))
(barParam(argument Все_равно_проверяют_ли_QR-кода))
(barParam(argument Есть_столики_на_улице))
=>
(assert(barParam(argument Бар_Квадрюпель)))
(assert(appendmessagehalt "Алкоголик-домосед пришёл сидеть до утра без QR-кода на улице => Бар Квадрюпель"))

(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра
(declare(salience 40))
(barParam(argument Алкоголик-домосед_пришёл_сидеть_до_утра))
(barParam(argument Не_требуется_QR-код))
=>
(assert(barParam(argument Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра)))
(assert(appendmessagehalt "Алкоголик-домосед-антиваксер пришёл сидеть до утра"))

(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра_=>_Бар_Есенин_____		___
(declare(salience 40))
(barParam(argument Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра))
=>
(assert(barParam(argument Бар_Есенин)))
(assert(appendmessagehalt "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Есенин     		   "))

(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра_=>_Бар_Квадрюпель_____	
(declare(salience 40))
(barParam(argument Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра))
=>
(assert(barParam(argument Бар_Квадрюпель)))
(assert(appendmessagehalt "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Квадрюпель     	"))

(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра_=>_Бар_Дрова
(declare(salience 40))
(barParam(argument Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра))
=>
(assert(barParam(argument Бар_Дрова)))
(assert(appendmessagehalt "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Дрова"))

(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра_=>_Бар_Голодранец
(declare(salience 40))
(barParam(argument Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра))
=>
(assert(barParam(argument Бар_Голодранец)))
(assert(appendmessagehalt "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Голодранец"))

(defrule Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра_=>_Бар_Чёрный_кот
(declare(salience 40))
(barParam(argument Алкоголик-домосед-антиваксер_пришёл_сидеть_до_утра))
=>
(assert(barParam(argument Бар_Чёрный_кот)))
(assert(appendmessagehalt "Алкоголик-домосед-антиваксер пришёл сидеть до утра => Бар Чёрный кот"))

(defrule Привитый_курильщик
(declare(salience 40))
(barParam(argument Есть_кальян))
(barParam(argument Привитый))
=>
(assert(barParam(argument Привитый_курильщик)))
(assert(appendmessagehalt "Привитый курильщик"))

(defrule Обозлённый_на_мир_офисный_планктон
(declare(salience 40))
(barParam(argument Привитый_курильщик))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Обозлённый_на_мир_офисный_планктон)))
(assert(appendmessagehalt "Обозлённый на мир офисный планктон"))

(defrule Мы_предварительно_пришли_по_фичам_в_Mojo
(declare(salience 40))
(barParam(argument Обозлённый_на_мир_офисный_планктон))
(barParam(argument Есть_кухня))
=>
(assert(barParam(argument Бар_Mojo)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Mojo"))

(defrule Мы_предварительно_пришли_по_фичам_в_Mojo
(declare(salience 40))
(barParam(argument Обозлённый_на_мир_офисный_планктон))
(barParam(argument Кухня_не_обязательна))
=>
(assert(barParam(argument Бар_Mojo)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Mojo"))

(defrule Мы_поняли_что_за_человек_такой_перед_нами
(declare(salience 40))
(barParam(argument Привитый_курильщик))
(barParam(argument Нет_необходимости_сидеть_после_закрытия))
(barParam(argument Устроят_обычные_официанты))
(barParam(argument Кот_не_обязателен))
=>
(assert(barParam(argument Привитый_курильщик_который_хочет_выпить_без_кота_и_встать_рано)))
(assert(appendmessagehalt "Мы поняли что за человек такой перед нами"))

(defrule Мы_нашли_странного_человека
(declare(salience 40))
(barParam(argument Привитый_курильщик_который_хочет_выпить_без_кота_и_встать_рано))
(barParam(argument Есть_настольный_футбол))
=>
(assert(barParam(argument Привитый_курильщик-футболист_который_хочет_выпить_без_кота_и_встать_рано)))
(assert(appendmessagehalt "Мы нашли странного человека"))

(defrule Мы_предварительно_пришли_по_фичам_в_Дрова
(declare(salience 40))
(barParam(argument Привитый_курильщик-футболист_который_хочет_выпить_без_кота_и_встать_рано))
(barParam(argument Зашли_просто_выпить))
=>
(assert(barParam(argument Бар_Дрова)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Дрова"))

(defrule Мы_идентифицировали_игрока_в_кикер!!
(declare(salience 40))
(barParam(argument Есть_настольный_футбол))
(barParam(argument Нет_необходимости_сидеть_после_закрытия))
(barParam(argument Кот_не_обязателен))
(barParam(argument Устроят_обычные_официанты))
=>
(assert(barParam(argument Непривередливый_игрок_в_кикер)))
(assert(appendmessagehalt "Мы идентифицировали игрока в кикер!!"))

(defrule Игрок_ещё_и_привит!!!!
(declare(salience 40))
(barParam(argument Непривередливый_игрок_в_кикер))
(barParam(argument Привитый))
=>
(assert(barParam(argument Привитый_непривередливый_игрок_в_кикер)))
(assert(appendmessagehalt "Игрок ещё и привит!!!!"))

(defrule Мерзлявый_непривитый_алкоигрок_в_кикер
(declare(salience 40))
(barParam(argument Непривередливый_игрок_в_кикер))
(barParam(argument Зашли_просто_выпить))
(barParam(argument Нет_столиков_на_улице))
(barParam(argument Не_требуется_QR-код))
=>
(assert(barParam(argument Мерзлявый_непривитый_алкоигрок_в_кикер)))
(assert(appendmessagehalt "Мерзлявый непривитый алкоигрок в кикер"))

(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу...
(declare(salience 40))
(barParam(argument Непривередливый_игрок_в_кикер))
(barParam(argument Есть_кухня))
(barParam(argument Нет_столиков_на_улице))
(barParam(argument Не_требуется_QR-код))
(barParam(argument Кальян_не_обязателен))
=>
(assert(barParam(argument Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Немца Перца Колбасу..."))

(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу...
(declare(salience 40))
(barParam(argument Привитый_непривередливый_игрок_в_кикер))
(barParam(argument Зашли_просто_выпить))
=>
(assert(barParam(argument Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Немца Перца Колбасу..."))

(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу...
(declare(salience 40))
(barParam(argument Привитый_непривередливый_игрок_в_кикер))
(barParam(argument Есть_кухня))
(barParam(argument Кальян_не_обязателен))
=>
(assert(barParam(argument Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Немца Перца Колбасу..."))

(defrule Мы_предварительно_пришли_по_фичам_в_Дрова
(declare(salience 40))
(barParam(argument Мерзлявый_непривитый_алкоигрок_в_кикер))
=>
(assert(barParam(argument Бар_Дрова)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Дрова"))

(defrule Мы_предварительно_пришли_по_фичам_в_1984
(declare(salience 40))
(barParam(argument Непривитые_мерзляки-алкоголики))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_1984)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в 1984"))

(defrule Мы_предварительно_пришли_по_фичам_в_пивко
(declare(salience 40))
(barParam(argument Непривитые_мерзляки-алкоголики))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_Пив&ко)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в пивко"))

(defrule Мы_предварительно_пришли_по_фичам_в_пивноff
(declare(salience 40))
(barParam(argument Непривитые_мерзляки-алкоголики))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_Пивноff)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в пивноff"))

(defrule Мы_предварительно_пришли_по_фичам_в_Hops
(declare(salience 40))
(barParam(argument Непривитые_мерзляки-алкоголики))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_Hops)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Hops"))

(defrule Мы_предварительно_пришли_по_фичам_в_Чёрный_кот
(declare(salience 40))
(barParam(argument Непривитые_мерзляки-алкоголики))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_Чёрный_кот)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Чёрный кот"))

(defrule Мы_предварительно_пришли_по_фичам_в_Голодранец
(declare(salience 40))
(barParam(argument Непривитые_мерзляки-алкоголики))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_Голодранец)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Голодранец"))

(defrule Мы_предварительно_пришли_по_фичам_в_Добрый_Эль
(declare(salience 40))
(barParam(argument Непривитые_мерзляки-алкоголики))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Добрый Эль"))

(defrule Мы_предварительно_пришли_по_фичам_в_Дрова
(declare(salience 40))
(barParam(argument Непривитые_мерзляки-алкоголики))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_Дрова)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Дрова"))

(defrule Мы_предварительно_пришли_по_фичам_в_Пинту
(declare(salience 40))
(barParam(argument Непривитые_мерзляки-алкоголики))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_Пинта)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Пинту"))

(defrule Мы_предварительно_пришли_по_фичам_в_Красного_Крокодила
(declare(salience 40))
(barParam(argument Непривитые_мерзляки-алкоголики))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Красного Крокодила"))

(defrule Мы_предварительно_пришли_по_фичам_в_Есенина
(declare(salience 40))
(barParam(argument Непривитые_мерзляки-алкоголики))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_Есенин)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Есенина"))

(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу
(declare(salience 40))
(barParam(argument Непривитые_мерзляки-алкоголики))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Немца Перца Колбасу"))

(defrule Мы_пришли_к_непривередливым_антикошатникам
(declare(salience 40))
(barParam(argument Устроят_обычные_официанты))
(barParam(argument Кот_не_обязателен))
(barParam(argument Можно_посидеть_компанией))
=>
(assert(barParam(argument Непривередливая_компания_антикошатников)))
(assert(appendmessagehalt "Мы пришли к непривередливым антикошатникам"))

(defrule Мы_предварительно_пришли_по_фичам_в_Дрова
(declare(salience 40))
(barParam(argument Непривитые_мерзляки-алкоголики))
(barParam(argument Непривередливая_компания_антикошатников))
=>
(assert(barParam(argument Бар_Дрова)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Дрова"))

(defrule Мы_пришли_к_страшному_человеку
(declare(salience 40))
(barParam(argument Кальян_не_обязателен))
(barParam(argument Есть_кухня))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Голодный_cоцио-_и_котофоб,_которому_рано_вставать)))
(assert(appendmessagehalt "Мы пришли к страшному человеку"))

(defrule Мы_предварительно_пришли_по_фичам_в_Добрый_Эль
(declare(salience 40))
(barParam(argument Голодный_cоцио-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Добрый Эль"))

(defrule Мы_предварительно_пришли_по_фичам_в_Пинту
(declare(salience 40))
(barParam(argument Голодный_cоцио-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_Пинта)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Пинту"))

(defrule Мы_предварительно_пришли_по_фичам_в_Немца_Перца_Колбасу
(declare(salience 40))
(barParam(argument Голодный_cоцио-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Немца Перца Колбасу"))

(defrule Жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе
(declare(salience 40))
(barParam(argument Есть_столики_на_улице))
(barParam(argument Зашли_просто_выпить))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Жаворонок-одиночка,_который_просто_хочет_накатить)))
(assert(appendmessagehalt "Жаворонок-одиночка, который просто хочет накатить на свежем воздухе"))

(defrule Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе
(declare(salience 40))
(barParam(argument Жаворонок-одиночка,_который_просто_хочет_накатить))
(barParam(argument Не_требуется_QR-код))
=>
(assert(barParam(argument Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе)))
(assert(appendmessagehalt "Одинокий жаворонок-антиваксер, который хочет просто накатить на свежем воздухе"))

(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе
(declare(salience 40))
(barParam(argument Жаворонок-одиночка,_который_просто_хочет_накатить))
(barParam(argument Все_равно_проверяют_ли_QR-кода))
=>
(assert(barParam(argument Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе)))
(assert(appendmessagehalt "Привитый жаворонок-одиночка, который просто хочет накатить  на свежем воздухе"))

(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе_=>_Бар_Пинта_
(declare(salience 40))
(barParam(argument Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе))
=>
(assert(barParam(argument Бар_Пинта)))
(assert(appendmessagehalt "Привитый жаворонок-одиночка, который просто хочет накатить на свежем воздухе => Бар Пинта "))

(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе_=>_Бар_Hops
(declare(salience 40))
(barParam(argument Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе))
=>
(assert(barParam(argument Бар_Hops)))
(assert(appendmessagehalt "Привитый жаворонок-одиночка, который просто хочет накатить на свежем воздухе => Бар Hops"))

(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе_=>_Бар_Квадрюпель
(declare(salience 40))
(barParam(argument Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе))
=>
(assert(barParam(argument Бар_Квадрюпель)))
(assert(appendmessagehalt "Привитый жаворонок-одиночка, который просто хочет накатить на свежем воздухе => Бар Квадрюпель"))

(defrule Привитый_жаворонок-одиночка,_который_просто_хочет_накатить_на_свежем_воздухе_=>_Бар_Сияние_
(declare(salience 40))
(barParam(argument Привитый_жаворонок-одиночка,_который_просто_хочет_накатить__на_свежем_воздухе))
=>
(assert(barParam(argument Бар_Сияние)))
(assert(appendmessagehalt "Привитый жаворонок-одиночка, который просто хочет накатить на свежем воздухе => Бар Сияние "))

(defrule Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе_=>_Бар_Hops
(declare(salience 40))
(barParam(argument Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе))
=>
(assert(barParam(argument Бар_Hops)))
(assert(appendmessagehalt "Одинокий жаворонок-антиваксер, который хочет просто накатить на свежем воздухе => Бар Hops"))

(defrule Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе_=>_Бар_Пинта
(declare(salience 40))
(barParam(argument Одинокий_жаворонок-антиваксер,_который_хочет_просто_накатить_на_свежем_воздухе))
=>
(assert(barParam(argument Бар_Пинта)))
(assert(appendmessagehalt "Одинокий жаворонок-антиваксер, который хочет просто накатить на свежем воздухе => Бар Пинта"))

(defrule Некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице
(declare(salience 40))
(barParam(argument Есть_столики_на_улице))
(barParam(argument Кальян_не_обязателен))
(barParam(argument Есть_кухня))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице)))
(assert(appendmessagehalt "Некурящий одинокий жаворонок, который хочет покушать на улице"))

(defrule Привитый_некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице_=>_Пинта
(declare(salience 40))
(barParam(argument Некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице))
(barParam(argument Все_равно_проверяют_ли_QR-кода))
=>
(assert(barParam(argument Бар_Пинта)))
(assert(appendmessagehalt "Привитый некурящий одинокий жаворонок, который хочет покушать на улице => Пинта"))

(defrule Непривитый_некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице_=>_Пинта
(declare(salience 40))
(barParam(argument Некурящий_одинокий_жаворонок,_который_хочет_покушать_на_улице))
(barParam(argument Не_требуется_QR-код))
=>
(assert(barParam(argument Бар_Пинта)))
(assert(appendmessagehalt "Непривитый некурящий одинокий жаворонок, который хочет покушать на улице => Пинта"))

(defrule Привитый_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём
(declare(salience 40))
(barParam(argument Есть_столики_на_улице))
(barParam(argument Настольный_футбол_не_обязателен))
(barParam(argument Все_равно_проверяют_ли_QR-кода))
(barParam(argument Кот_не_обязателен))
(barParam(argument Нет_необходимости_сидеть_после_закрытия))
=>
(assert(barParam(argument Привитый_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём)))
(assert(appendmessagehalt "Привитый футболохейтер, который хочет посидеть на свежем воздухе днём"))

(defrule Привитый_некурящий_непривередливый_голодный_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём_=>_Сияние
(declare(salience 40))
(barParam(argument Привитый_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём))
(barParam(argument Кальян_не_обязателен))
(barParam(argument Устроят_обычные_официанты))
(barParam(argument Есть_кухня))
=>
(assert(barParam(argument Бар_Сияние)))
(assert(appendmessagehalt "Привитый некурящий непривередливый голодный футболохейтер, который хочет посидеть на свежем воздухе днём => Сияние"))

(defrule Привитый_футболохейтер,_который_хочет_просто_выпить_на_свежем_воздухе_днём_=>_Сияние
(declare(salience 40))
(barParam(argument Привитый_футболохейтер,_который_хочет_посидеть_на_свежем_воздухе_днём))
(barParam(argument Милые_официанты))
(barParam(argument Зашли_просто_выпить))
=>
(assert(barParam(argument Бар_Сияние)))
(assert(appendmessagehalt "Привитый футболохейтер, который хочет просто выпить на свежем воздухе днём => Сияние"))

(defrule Непривитые_мерзляки
(declare(salience 40))
(barParam(argument Нет_столиков_на_улице))
(barParam(argument Не_требуется_QR-код))
=>
(assert(barParam(argument Непривитые_мерзляки)))
(assert(appendmessagehalt "Непривитые мерзляки"))

(defrule Непривитые_мерзляки-алкоголики
(declare(salience 40))
(barParam(argument Непривитые_мерзляки))
(barParam(argument Зашли_просто_выпить))
=>
(assert(barParam(argument Непривитые_мерзляки-алкоголики)))
(assert(appendmessagehalt "Непривитые мерзляки-алкоголики"))

(defrule Мы_предварительно_пришли_по_фичам_в_Красный_Крокодил
(declare(salience 40))
(barParam(argument Голодный_cоцио-_и_котофоб,_которому_рано_вставать))
(barParam(argument Настольный_футбол_не_обязателен))
=>
(assert(barParam(argument Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Мы предварительно пришли по фичам в Красный Крокодил"))

(defrule Мы_дошли_до_зожника_с_прибабахом
(declare(salience 40))
(barParam(argument Кальян_не_обязателен))
(barParam(argument Есть_кухня))
(barParam(argument Социо-_и_котофоб,_которому_рано_вставать))
=>
(assert(barParam(argument Голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)))
(assert(appendmessagehalt "Мы дошли до зожника с прибабахом"))

(defrule Мы_дошли_до_непривередливого_антикошатника
(declare(salience 40))
(barParam(argument Кот_не_обязателен))
(barParam(argument Устроят_обычные_официанты))
=>
(assert(barParam(argument Непривередливый_антикошатник)))
(assert(appendmessagehalt "Мы дошли до непривередливого антикошатника"))

(defrule Мы_пришли_к_очередному_клерку
(declare(salience 40))
(barParam(argument Привитый))
(barParam(argument Голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(argument Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить)))
(assert(appendmessagehalt "Мы пришли к очередному клерку"))

(defrule Мы_пришли_к_привитому_непривередливому_антикошатнику
(declare(salience 40))
(barParam(argument Привитый))
(barParam(argument Непривередливый_антикошатник))
=>
(assert(barParam(argument Привитый_непривередливый_антикошатник)))
(assert(appendmessagehalt "Мы пришли к привитому непривередливому антикошатнику"))

(defrule Бар_Сияние
(declare(salience 40))
(barParam(argument Привитые_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(argument Бар_Сияние)))
(assert(appendmessagehalt "Бар Сияние"))

(defrule Бар_London_Pub
(declare(salience 40))
(barParam(argument Привитые_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(argument Бар_London_Pub)))
(assert(appendmessagehalt "Бар London Pub"))

(defrule Бар_Коррида
(declare(salience 40))
(barParam(argument Привитые_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(argument Бар_Коррида)))
(assert(appendmessagehalt "Бар Коррида"))

(defrule Бар_Свой_Бар
(declare(salience 40))
(barParam(argument Привитые_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(argument Бар_Свой_Бар)))
(assert(appendmessagehalt "Бар Свой Бар"))

(defrule Бар_Свой_Бар_
(declare(salience 40))
(barParam(argument Привитые_пришли_выпить_и_поболтать_до_утра))
=>
(assert(barParam(argument Бар_Свой_Бар)))
(assert(appendmessagehalt "Бар Свой Бар "))

(defrule Бар_Mozart_Wine_House
(declare(salience 40))
(barParam(argument Привитые_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(argument Бар_Mozart_Wine_House)))
(assert(appendmessagehalt "Бар Mozart Wine House"))

(defrule Бар_Пинта___
(declare(salience 40))
(barParam(argument Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(argument Бар_Пинта)))
(assert(appendmessagehalt "Бар Пинта   "))

(defrule Бар_Дрова
(declare(salience 40))
(barParam(argument Привитый_непривередливый_антикошатник))
(barParam(argument Можно_посидеть_компанией))
(barParam(argument Зашли_просто_выпить))
=>
(assert(barParam(argument Бар_Дрова)))
(assert(appendmessagehalt "Бар Дрова"))

(defrule Бар_O.W.Grant
(declare(salience 40))
(barParam(argument Привитый_непривередливый_антикошатник,_не_играющий_в_кикер_и_не_курящий_кальян))
(barParam(argument Отмечаем_что-то))
=>
(assert(barParam(argument Бар_O.W.Grant)))
(assert(appendmessagehalt "Бар O.W.Grant"))

(defrule Бар_Красный_Крокодил
(declare(salience 40))
(barParam(argument Непривитые_мерзляки_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(argument Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Бар Красный Крокодил"))

(defrule Бар_O.W.Grant
(declare(salience 40))
(barParam(argument Мерзляки_пришли_выпить_и_поболтать_до_утра))
=>
(assert(barParam(argument Бар_O.W.Grant)))
(assert(appendmessagehalt "Бар O.W.Grant"))

(defrule Бар_Красный_Крокодил
(declare(salience 40))
(barParam(argument Привитые_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(argument Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Бар Красный Крокодил"))

(defrule Бар_O.W.Grant
(declare(salience 40))
(barParam(argument Привитые_пришли_выпить_и_поболтать_до_закрытия))
=>
(assert(barParam(argument Бар_O.W.Grant)))
(assert(appendmessagehalt "Бар O.W.Grant"))

(defrule Бар_St._Patrick’s_Pub
(declare(salience 40))
(barParam(argument Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(argument Бар_St._Patrick’s_Pub)))
(assert(appendmessagehalt "Бар St. Patrick’s Pub"))

(defrule Бар_Коррида___
(declare(salience 40))
(barParam(argument Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(argument Бар_Коррида)))
(assert(appendmessagehalt "Бар Коррида   "))

(defrule Бар_Мистер_Fox_	_
(declare(salience 40))
(barParam(argument Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(argument Бар_Мистер_Fox)))
(assert(appendmessagehalt "Бар Мистер Fox 	 "))

(defrule Бар_Mojo	
(declare(salience 40))
(barParam(argument Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(argument Бар_Mojo)))
(assert(appendmessagehalt "Бар Mojo	"))

(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(argument Привитый_непривередливый_антикошатник,_не_играющий_в_кикер_и_не_курящий_кальян))
(barParam(argument Нет_необходимости_сидеть_после_закрытия))
(barParam(argument Есть_кухня))
=>
(assert(barParam(argument Бар_Эйнштейн)))
(assert(appendmessagehalt "Бар Эйнштейн"))

(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(argument Привитый_курильщик_который_хочет_выпить_без_кота_и_встать_рано))
(barParam(argument Кухня_не_обязательна))
(barParam(argument Кальян_не_обязателен))
=>
(assert(barParam(argument Бар_Эйнштейн)))
(assert(appendmessagehalt "Бар Эйнштейн"))

(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(argument Привитый_непривередливый_игрок_в_кикер))
(barParam(argument Есть_кухня))
(barParam(argument Есть_кальян))
=>
(assert(barParam(argument Бар_Эйнштейн)))
(assert(appendmessagehalt "Бар Эйнштейн"))

(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(argument Привитый_непривередливый_игрок_в_кикер))
(barParam(argument Кухня_не_обязательна))
(barParam(argument Есть_кальян))
=>
(assert(barParam(argument Бар_Эйнштейн)))
(assert(appendmessagehalt "Бар Эйнштейн"))

(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(argument Привитый_непривередливый_игрок_в_кикер))
(barParam(argument Кухня_не_обязательна))
(barParam(argument Кальян_не_обязателен))
=>
(assert(barParam(argument Бар_Эйнштейн)))
(assert(appendmessagehalt "Бар Эйнштейн"))

(defrule Бар_Эйнштейн
(declare(salience 40))
(barParam(argument Привитый_непривередливый_игрок_в_кикер))
(barParam(argument Есть_кухня))
(barParam(argument Кальян_не_обязателен))
=>
(assert(barParam(argument Бар_Эйнштейн)))
(assert(appendmessagehalt "Бар Эйнштейн"))

(defrule Бар_Сияние
(declare(salience 40))
(barParam(argument Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(argument Бар_Сияние)))
(assert(appendmessagehalt "Бар Сияние"))

(defrule Бар_O.W.Grant	
(declare(salience 40))
(barParam(argument Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(argument Бар_O.W.Grant)))
(assert(appendmessagehalt "Бар O.W.Grant	"))

(defrule Бар_Красный_Крокодил_
(declare(salience 40))
(barParam(argument Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(argument Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Бар Красный Крокодил "))

(defrule Бар_London_Pub	
(declare(salience 40))
(barParam(argument Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(argument Бар_London_Pub)))
(assert(appendmessagehalt "Бар London Pub	"))

(defrule Бар_Добрый_Эль__
(declare(salience 40))
(barParam(argument Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(argument Бар_Добрый_Эль)))
(assert(appendmessagehalt "Бар Добрый Эль  "))

(defrule Бар_Немец_Перец_Колбаса
(declare(salience 40))
(barParam(argument Привитый_голодный_социо-_и_котофоб,_которому_рано_вставать_и_не_хочется_курить))
=>
(assert(barParam(argument Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Бар Немец Перец Колбаса"))

(defrule Мы_дошли_до_пивка_на_западном!!
(declare(salience 40))
(barParam(argument Бар_Пив&ко))
(barParam(argument Располагается_на_западном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Бар_без_столиков))
=>
(assert(barParam(argument Бар_Пив&ко)))
(assert(appendmessagehalt "Мы дошли до пивка на западном!!"))

(defrule Мы_дошли_до_пивка_на_северном!!
(declare(salience 40))
(barParam(argument Бар_Пив&ко))
(barParam(argument Располагается_на_северном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Бар_без_столиков))
=>
(assert(barParam(argument Бар_Пив&ко)))
(assert(appendmessagehalt "Мы дошли до пивка на северном!!"))

(defrule Мы_дошли_до_пивноff_на_западном!!
(declare(salience 40))
(barParam(argument Бар_Пивноff))
(barParam(argument Располагается_на_западном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Бар_без_столиков))
=>
(assert(barParam(argument Бар_Пивноff)))
(assert(appendmessagehalt "Мы дошли до пивноff на западном!!"))

(defrule Мы_дошли_до_пивноff_на_северном!!
(declare(salience 40))
(barParam(argument Бар_Пивноff))
(barParam(argument Располагается_на_северном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Бар_без_столиков))
=>
(assert(barParam(argument Бар_Пивноff)))
(assert(appendmessagehalt "Мы дошли до пивноff на северном!!"))

(defrule Мы_дошли_до_Есенина!!
(declare(salience 40))
(barParam(argument Бар_Есенин))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Бар_с_парой_больших_столов))
=>
(assert(barParam(argument Бар_Есенин)))
(assert(appendmessagehalt "Мы дошли до Есенина!!"))

(defrule Мы_дошли_до_O.W.Grant!!
(declare(salience 40))
(barParam(argument Бар_O.W.Grant))
(barParam(argument Располагается_в_центрe))
(barParam(argument Коктейльный_бар))
(barParam(argument Дорогой_бар))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_O.W.Grant)))
(assert(appendmessagehalt "Мы дошли до O.W.Grant!!"))

(defrule Мы_дошли_до_Сияния!!
(declare(salience 40))
(barParam(argument Бар_Сияние))
(barParam(argument Располагается_в_центрe))
(barParam(argument Винный_бар))
(barParam(argument Дорогой_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Сияние)))
(assert(appendmessagehalt "Мы дошли до Сияния!!"))

(defrule Мы_дошли_до_Мистера_Fox!!
(declare(salience 40))
(barParam(argument Бар_Мистер_Fox))
(barParam(argument Располагается_в_центрe))
(barParam(argument Сидрерия))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_Мистер_Fox)))
(assert(appendmessagehalt "Мы дошли до Мистера Fox!!"))

(defrule Мы_дошли_до_Дров!!
(declare(salience 40))
(barParam(argument Бар_Дрова))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_Дрова)))
(assert(appendmessagehalt "Мы дошли до Дров!!"))

(defrule Мы_дошли_до_Hops!!
(declare(salience 40))
(barParam(argument Бар_Hops))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Бар_с_парой_больших_столов))
=>
(assert(barParam(argument Бар_Hops)))
(assert(appendmessagehalt "Мы дошли до Hops!!"))

(defrule Мы_дошли_до_Своего_бара!!
(declare(salience 40))
(barParam(argument Бар_Свой_Бар))
(barParam(argument Располагается_в_центрe))
(barParam(argument Коктейльный_бар))
(barParam(argument Дорогой_бар))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_Свой_Бар)))
(assert(appendmessagehalt "Мы дошли до Своего бара!!"))

(defrule Мы_дошли_до_Эйнштейна!!
(declare(salience 40))
(barParam(argument Бар_Эйнштейн))
(barParam(argument Располагается_на_западном))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Эйнштейн)))
(assert(appendmessagehalt "Мы дошли до Эйнштейна!!"))

(defrule Мы_дошли_до_Пинты_на_западном!!
(declare(salience 40))
(barParam(argument Бар_Пинта))
(barParam(argument Располагается_на_западном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Пинта)))
(assert(appendmessagehalt "Мы дошли до Пинты на западном!!"))

(defrule Мы_дошли_до_Пинты_на_северном!!
(declare(salience 40))
(barParam(argument Бар_Пинта))
(barParam(argument Располагается_на_северном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Пинта)))
(assert(appendmessagehalt "Мы дошли до Пинты на северном!!"))

(defrule Мы_дошли_до_Пинты_в_центре!!
(declare(salience 40))
(barParam(argument Бар_Пинта))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Пинта)))
(assert(appendmessagehalt "Мы дошли до Пинты в центре!!"))

(defrule Мы_дошли_до_Доброго_Эля_на_западном!!
(declare(salience 40))
(barParam(argument Бар_Добрый_Эль))
(barParam(argument Располагается_на_западном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы дошли до Доброго Эля на западном!!"))

(defrule Мы_дошли_до_Доброго_Эля_на_северном!!
(declare(salience 40))
(barParam(argument Бар_Добрый_Эль))
(barParam(argument Располагается_на_северном))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы дошли до Доброго Эля на северном!!"))

(defrule Мы_дошли_до_Доброго_Эля_в_центре!!
(declare(salience 40))
(barParam(argument Бар_Добрый_Эль))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Добрый_Эль)))
(assert(appendmessagehalt "Мы дошли до Доброго Эля в центре!!"))

(defrule Мы_дошли_до_Немца_Перца_Колбасы!!
(declare(salience 40))
(barParam(argument Бар_Немец_Перец_Колбаса))
(barParam(argument Располагается_в_центрe))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Дешёвый_бар))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Немец_Перец_Колбаса)))
(assert(appendmessagehalt "Мы дошли до Немца Перца Колбасы!!"))

(defrule Мы_дошли_до_Голодранца!!
(declare(salience 40))
(barParam(argument Бар_Голодранец))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_Голодранец)))
(assert(appendmessagehalt "Мы дошли до Голодранца!!"))

(defrule Мы_дошли_до_1984!!
(declare(salience 40))
(barParam(argument Бар_1984))
(barParam(argument Располагается_в_центрe))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Дорогой_бар))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_1984)))
(assert(appendmessagehalt "Мы дошли до 1984!!"))

(defrule Мы_дошли_до_Квадрюпеля!!
(declare(salience 40))
(barParam(argument Бар_Квадрюпель))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Бар_с_парой_больших_столов))
=>
(assert(barParam(argument Бар_Квадрюпель)))
(assert(appendmessagehalt "Мы дошли до Квадрюпеля!!"))

(defrule Мы_дошли_до_Красного_Крокодила!!
(declare(salience 40))
(barParam(argument Бар_Красный_Крокодил))
(barParam(argument Располагается_на_северном))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Дешёвый_бар))
(barParam(argument Бар_с_парой_больших_столов))
=>
(assert(barParam(argument Бар_Красный_Крокодил)))
(assert(appendmessagehalt "Мы дошли до Красного Крокодила!!"))

(defrule Мы_дошли_до_Шамайки!!
(declare(salience 40))
(barParam(argument Бар_Шамайка))
(barParam(argument Располагается_в_центрe))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Шамайка)))
(assert(appendmessagehalt "Мы дошли до Шамайки!!"))

(defrule Мы_дошли_до_Корриды!!
(declare(salience 40))
(barParam(argument Бар_Коррида))
(barParam(argument Располагается_на_северном))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Бар_средней_ценовой_категории))
(barParam(argument Большой_бар))
=>
(assert(barParam(argument Бар_Коррида)))
(assert(appendmessagehalt "Мы дошли до Корриды!!"))

(defrule Мы_дошли_до_London_Pub!!
(declare(salience 40))
(barParam(argument Бар_London_Pub))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Дорогой_бар))
(barParam(argument Бар_с_парой_больших_столов))
=>
(assert(barParam(argument Бар_London_Pub)))
(assert(appendmessagehalt "Мы дошли до London Pub!!"))

(defrule Мы_дошли_до_St._Patrick’s_Pub!!
(declare(salience 40))
(barParam(argument Бар_St._Patrick’s_Pub))
(barParam(argument Располагается_в_центрe))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Дорогой_бар))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_St._Patrick’s_Pub)))
(assert(appendmessagehalt "Мы дошли до St. Patrick’s Pub!!"))

(defrule Мы_дошли_до_Mozart_Wine_House!!
(declare(salience 40))
(barParam(argument Бар_Mozart_Wine_House))
(barParam(argument Располагается_в_центрe))
(barParam(argument Винный_бар))
(barParam(argument Дорогой_бар))
(barParam(argument Бар_без_столиков))
=>
(assert(barParam(argument Бар_Mozart_Wine_House)))
(assert(appendmessagehalt "Мы дошли до Mozart Wine House!!"))

(defrule Мы_дошли_до_Шкипера!!
(declare(salience 40))
(barParam(argument Бар_Шкипер))
(barParam(argument Располагается_в_центрe))
(barParam(argument Пивной_бар))
(barParam(argument Дешёвый_бар))
(barParam(argument Бар_без_столиков))
=>
(assert(barParam(argument Бар_Шкипер)))
(assert(appendmessagehalt "Мы дошли до Шкипера!!"))

(defrule Мы_дошли_до_Mojo!!
(declare(salience 40))
(barParam(argument Бар_Mojo))
(barParam(argument Располагается_в_центрe))
(barParam(argument Коктейльный_бар))
(barParam(argument Дорогой_бар))
(barParam(argument Бар_только_с_маленькими_столиками))
=>
(assert(barParam(argument Бар_Mojo)))
(assert(appendmessagehalt "Мы дошли до Mojo!!"))

(defrule Мы_дошли_до_Чёрного_кота!!
(declare(salience 40))
(barParam(argument Бар_Чёрный_кот))
(barParam(argument Располагается_в_центрe))
(barParam(argument Бар_широкого_профиля))
(barParam(argument Дешёвый_бар))
(barParam(argument Бар_без_столиков))
=>
(assert(barParam(argument Бар_Чёрный_кот)))
(assert(appendmessagehalt "Мы дошли до Чёрного кота!!"))

(defrule Привитый_непривередливый_антикошатник,_не_играющий_в_кикер_и_не_курящий_кальян
(declare(salience 40))
(barParam(argument Привитый_непривередливый_антикошатник))
(barParam(argument Кальян_не_обязателен))
(barParam(argument Настольный_футбол_не_обязателен))
=>
(assert(barParam(argument Привитый_непривередливый_антикошатник,_не_играющий_в_кикер_и_не_курящий_кальян)))
(assert(appendmessagehalt "Привитый непривередливый антикошатник, не играющий в кикер и не курящий кальян"))

(defrule Пришли_выпить_и_поболтать
(declare(salience 40))
(barParam(argument Милые_официанты))
(barParam(argument Настольный_футбол_не_обязателен))
(barParam(argument Кот_не_обязателен))
(barParam(argument Зашли_просто_выпить))
=>
(assert(barParam(argument Пришли_выпить_и_поболтать)))
(assert(appendmessagehalt "Пришли выпить и поболтать"))

(defrule Привитые_пришли_выпить_и_поболтать
(declare(salience 40))
(barParam(argument Пришли_выпить_и_поболтать))
(barParam(argument Привитый))
=>
(assert(barParam(argument Привитые_пришли_выпить_и_поболтать)))
(assert(appendmessagehalt "Привитые пришли выпить и поболтать"))

(defrule Привитые_пришли_выпить_и_поболтать_до_закрытия
(declare(salience 40))
(barParam(argument Привитые_пришли_выпить_и_поболтать))
(barParam(argument Нет_необходимости_сидеть_после_закрытия))
=>
(assert(barParam(argument Привитые_пришли_выпить_и_поболтать_до_закрытия)))
(assert(appendmessagehalt "Привитые пришли выпить и поболтать до закрытия"))

(defrule Привитые_пришли_выпить_и_поболтать_до_утра
(declare(salience 40))
(barParam(argument Привитые_пришли_выпить_и_поболтать))
(barParam(argument Можно_сидеть_после_закрытия))
=>
(assert(barParam(argument Привитые_пришли_выпить_и_поболтать_до_утра)))
(assert(appendmessagehalt "Привитые пришли выпить и поболтать до утра"))

(defrule Мерзляки_пришли_выпить_и_поболтать
(declare(salience 40))
(barParam(argument Пришли_выпить_и_поболтать))
(barParam(argument Нет_столиков_на_улице))
=>
(assert(barParam(argument Мерзляки_пришли_выпить_и_поболтать)))
(assert(appendmessagehalt "Мерзляки пришли выпить и поболтать"))

(defrule Мерзляки_пришли_выпить_и_поболтать_до_утра
(declare(salience 40))
(barParam(argument Мерзляки_пришли_выпить_и_поболтать))
(barParam(argument Можно_сидеть_после_закрытия))
=>
(assert(barParam(argument Мерзляки_пришли_выпить_и_поболтать_до_утра)))
(assert(appendmessagehalt "Мерзляки пришли выпить и поболтать до утра"))

(defrule Непривитые_мерзляки_пришли_выпить_и_поболтать_до_закрытия
(declare(salience 40))
(barParam(argument Мерзляки_пришли_выпить_и_поболтать))
(barParam(argument Не_требуется_QR-код))
(barParam(argument Нет_необходимости_сидеть_после_закрытия))
=>
(assert(barParam(argument Непривитые_мерзляки_пришли_выпить_и_поболтать_до_закрытия)))
(assert(appendmessagehalt "Непривитые мерзляки пришли выпить и поболтать до закрытия"))
